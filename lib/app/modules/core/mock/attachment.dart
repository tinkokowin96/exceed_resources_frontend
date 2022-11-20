import 'package:exceed_resources_frontend/app/modules/core/mock/data.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';

final m_attachments = [
  MAttachment(
    thumbnail: asset_data[0],
    type: EAttachment.image,
    name: 'Product 1',
    url: asset_data[0],
  ),
  MAttachment(
    thumbnail: asset_data[0],
    type: EAttachment.image,
    name: 'Product 2',
    url: asset_data[1],
  ),
  MAttachment(
    thumbnail: asset_data[0],
    type: EAttachment.image,
    name: 'Product 3',
    url: asset_data[2],
  ),
  MAttachment(
    thumbnail: asset_data[1],
    type: EAttachment.pdf,
    name: 'You Reached Sam',
    url: asset_data[5],
  ),
  MAttachment(
    thumbnail: asset_data[2],
    type: EAttachment.video,
    name: 'The Forest',
    url: asset_data[6],
  ),
];
