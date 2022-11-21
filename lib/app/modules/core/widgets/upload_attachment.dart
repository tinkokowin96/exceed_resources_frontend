import 'dart:io';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UploadAttachment extends StatefulWidget {
  final double width;
  final double height;
  final Function(MAttachmentField image) pickFile;
  final Function(String? error) updateError;
  final EAttachment type;
  const UploadAttachment({
    Key? key,
    required this.width,
    required this.height,
    required this.pickFile,
    required this.updateError,
    this.type = EAttachment.image,
  }) : super(key: key);

  @override
  State<UploadAttachment> createState() => _UploadAttachmentState();
}

class _UploadAttachmentState extends State<UploadAttachment> {
  File? _pickedFile;
  String? _fileName;
  late final _placeholder =
      'assets/images/ph_${widget.type == EAttachment.image ? 'img' : widget.type == EAttachment.thumbnail ? 'thn' : widget.type == EAttachment.video ? 'vdo' : 'pdf'}_lnd.svg';

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: widget.type == EAttachment.image || widget.type == EAttachment.thumbnail
            ? FileType.image
            : widget.type == EAttachment.video
                ? FileType.video
                : FileType.custom,
        allowedExtensions: widget.type == EAttachment.pdf ? ['pdf'] : null);
    final maximunFileSize = widget.type == EAttachment.image || widget.type == EAttachment.thumbnail
        ? 5242880
        : widget.type == EAttachment.video
            ? 209715200
            : 10485760;
    if (result != null) {
      if (result.files.first.size > maximunFileSize) {
        widget.updateError(
          'Maximum of ${widget.type == EAttachment.image || widget.type == EAttachment.thumbnail ? 5 : widget.type == EAttachment.video ? 200 : 10}MB is allowed',
        );
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
          _fileName = result.files.first.name;
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
                  _placeholder,
                  width: widget.width,
                )
              : widget.type == EAttachment.image || widget.type == EAttachment.thumbnail
                  ? Image.file(
                      _pickedFile!,
                      width: widget.width,
                      height: widget.height,
                      fit: BoxFit.cover,
                    )
                  : Text(
                      _fileName!,
                      style: AppTheme.text(
                        context: context,
                        type: ETextType.primary,
                      ),
                    ),
        ),
      ),
    );
  }
}
