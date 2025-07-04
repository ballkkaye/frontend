import 'package:ballkkaye_frontend/_core/utils/m_http.dart';
import 'package:ballkkaye_frontend/data/repository/user_match_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  UserMatchRepository repo = UserMatchRepository();

  dio.options.headers["Authorization"] =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhY2Nlc3MtdG9rZW4iLCJuaWNrbmFtZSI6InNzYXIiLCJ1c2Vycm9sZSI6IlVTRVIiLCJpZCI6MSwiZXhwIjoxNzUxNjEzMDIzfQ.lqnAV_ZUVqTZJ7FsmaARzGBs2v6CMutpAMVUJH1GIk0enyxy3GbwNoCaLYLN10D_sBSJY8dqJyVf9V67tKfTqw";

  // getList 테스트
  //await repo.getList();

  // getOne 테스트
  int userMatchId = 5;
  await repo.getOne(userMatchId);
}
