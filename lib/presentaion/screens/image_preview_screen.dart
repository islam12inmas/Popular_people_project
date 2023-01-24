import 'dart:io';

import 'package:course_task/data/cubits/popular_people_images_cubits/popular_people_images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePreview extends StatefulWidget {
  String? image;

  ImagePreview({Key? key, this.image}) : super(key: key);

  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {

        }, icon: const Icon(Icons.download_rounded))
        ],
      ),
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Container(width: double.infinity, height: double.infinity, child:
        Image.network(widget.image!),)
    );
  }
}
