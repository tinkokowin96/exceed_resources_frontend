import 'dart:io';

import 'package:exceed_resources_frontend/app/modules/core/models/attachment_field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageUpload extends StatefulWidget {
  final String placeHolder;
  final double width;
  final double height;
  final Function(MAttachmentField image) pickFile;
  final Function(String? error) updateError;
  const ImageUpload({
    Key? key,
    required this.placeHolder,
    required this.width,
    required this.height,
    required this.pickFile,
    required this.updateError,
  }) : super(key: key);

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? _pickedFile;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      if (result.files.first.size > 5242880) {
        widget.updateError('Maximum of 5MB is allowed');
      } else {
        final type = RegExp(r'([a-z]{3,4})$').firstMatch(result.files.first.name)!.group(1);
        final file = File(result.files.first.path!);
        widget.pickFile(
          MAttachmentField(
            type: type!,
            name: result.files.first.name,
            value: result.files.first.name,
            file: file,
          ),
        );
        setState(() {
          _pickedFile = file;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickFile,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.sm),
        child: ColoredBox(
          color: AppTheme.of(context).color.secondary.withOpacity(0.05),
          child: _pickedFile == null
              ? SvgPicture.asset(
                  widget.placeHolder,
                  width: widget.width,
                )
              : Image.file(
                  _pickedFile!,
                  width: widget.width,
                  height: widget.height,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
