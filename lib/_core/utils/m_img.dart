import 'dart:convert';
import 'dart:io';

import 'package:ballkkaye_frontend/_core/utils/m_exception.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

class Env {
  static final String bucketUrl = dotenv.env['BUCKET_URL'] ?? '';
  static final String apiUrl = dotenv.env['API_URL'] ?? '';
  static final String deleteApiUrl = dotenv.env['DELETE_API_URL'] ?? '';
}

class MImg {
  /// MIME 타입 반환
  static String getMimeType(String filePath) {
    return lookupMimeType(filePath) ?? 'image/jpeg';
  }

  /// 파일명 생성
  static String generateFilename(String contentType) {
    return '${const Uuid().v4()}.${contentType.split('/').last}';
  }

  /// Presigned URL 받아오기
  static Future<String?> getPresignedUrl(String filename, String contentType) async {
    final encodedFilename = Uri.encodeComponent(filename);
    final url = Uri.parse('${Env.apiUrl}?filename=$encodedFilename&contentType=$contentType');

    final response = await http.get(url);

    try {
      final Map<String, dynamic> outer = json.decode(response.body);
      dynamic inner = outer['body'];
      if (inner is String) {
        inner = json.decode(inner);
      }

      if (outer['statusCode'] == 200 && inner['url'] != null) {
        return inner['url'];
      } else {
        print('Presigned URL을 찾을 수 없거나 형식이 잘못되었습니다.');
        throw MException(
          message: "Presigned URL을 찾을 수 없거나 형식이 잘못되었습니다.",
        );
      }
    } catch (e) {
      throw MException(
        message: "Presigned URL을 파싱하는 중 오류가 발생했습니다.",
        cause: e,
      );
    }
  }

  /// S3 업로드
  static Future<String?> uploadToS3(
      File imageFile,
      String presignedUrl,
      String contentType,
      String objectKey,
      ) async {
    try {
      final bytes = await imageFile.readAsBytes();

      final res = await http.put(
        Uri.parse(presignedUrl),
        headers: {'Content-Type': contentType},
        body: bytes,
      );

      if (res.statusCode == 200) {
        return "${Env.bucketUrl}/$objectKey";
      } else {
        throw MException(
          message: "이미지 업로드에 실패했습니다.",
          cause: res.body,
        );
      }
    } catch (e) {
      throw MException(
        message: "이미지를 업로드하는 중 오류가 발생했습니다.",
        cause: e,
      );
    }
  }

  /// S3 오브젝트 삭제
  static Future<void> deleteObject(String photoUrl) async {
    try {
      final Uri uri = Uri.parse(photoUrl);
      final String objectKey = uri.path.substring(1);

      final url = Uri.parse('${Env.deleteApiUrl}?objectKey=$objectKey');
      final response = await http.delete(url);

      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['statusCode'] == 200) {
        Logger().d('이미지가 성공적으로 삭제되었습니다: ${response.body}');
      } else {
        throw MException(
          message: "이미지를 삭제하는 데 실패했습니다.",
          cause: response.body,
        );
      }
    } catch (e) {
      throw MException(
        message: "이미지를 삭제하는 중 예외가 발생했습니다.",
        cause: e,
      );
    }
  }

  /// 이미지 선택 후 업로드 → 결과 반환 (imageFile과 uploadedUrl)
  static final ImagePicker _picker = ImagePicker();

  static Future<UploadResult?> pickAndUploadImg(ImageSource source) async {
    final XFile? picked = await _picker.pickImage(source: source);
    if (picked == null) return null;

    final contentType = getMimeType(picked.path);
    final filename = generateFilename(contentType);
    final presignedUrl = await getPresignedUrl(filename, contentType);

    if (presignedUrl != null) {
      final resultUrl = await uploadToS3(
        File(picked.path),
        presignedUrl,
        contentType,
        filename,
      );

      if (resultUrl != null) {
        return UploadResult(file: picked, url: resultUrl);
      }
    }
    return null;
  }
}

/// 업로드 결과 클래스
class UploadResult {
  final XFile file;
  final String url;

  UploadResult({
    required this.file,
    required this.url,
  });
}
