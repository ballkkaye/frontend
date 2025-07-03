import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserUpdateProfileImagePicker extends StatefulWidget {
  const UserUpdateProfileImagePicker({super.key});

  @override
  State<UserUpdateProfileImagePicker> createState() => _UserUpdateProfileImagePickerState();
}

class _UserUpdateProfileImagePickerState extends State<UserUpdateProfileImagePicker> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('✅ tapped!');
        _pickImage();
      },
      child: Stack(
        children: [
          // 배경 (동그라미 + 이미지 아이콘)
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
              image: _selectedImage != null
                  ? DecorationImage(
                      image: FileImage(_selectedImage!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: _selectedImage == null
                ? Center(
                    child: Icon(Icons.image, size: 30, color: Colors.grey),
                  )
                : null,
          ),

          // 오른쪽 아래 플러스 아이콘
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
