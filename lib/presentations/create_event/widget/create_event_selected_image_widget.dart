import 'dart:io';

import 'package:flutter/material.dart';

class CreateEventSelectedImageWidget extends StatelessWidget {
  String selectedImagePath;
  int index;
  Function removeFunc;
  CreateEventSelectedImageWidget({
    required this.selectedImagePath,
    required this.index,
    required this.removeFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
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
        ),
        Positioned(
          right: 4,
          // top: -5,
          child: GestureDetector(
            onTap: () {
              removeFunc(index);
            },
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(
                  size: 20,
                  Icons.clear,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
