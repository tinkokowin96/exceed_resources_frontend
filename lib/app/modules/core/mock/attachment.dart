import 'package:exceed_resources_frontend/app/modules/core/mock/data.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';

final attachments = [
  MAttachment(type: EAttachment.image, name: 'Product 1', url: asset_data[0]),
  MAttachment(type: EAttachment.image, name: 'Product 2', url: asset_data[1]),
  MAttachment(type: EAttachment.image, name: 'Product 3', url: asset_data[2]),
  MAttachment(type: EAttachment.image, name: 'You Reached Sam', url: asset_data[3]),
];
