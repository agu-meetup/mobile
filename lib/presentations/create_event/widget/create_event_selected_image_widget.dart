import 'dart:io';

import 'package:flutter/material.dart';

class CreateEventSelectedImageWidget extends StatelessWidget {
  String selectedImagePath;
  CreateEventSelectedImageWidget({required this.selectedImagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 110,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: FileImage(
            File(selectedImagePath),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
