import 'package:exceed_resources_frontend/app/modules/core/mock/data.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/article_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/article_section_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';

final m_articles = [
  MArticle(
    id: 'art_1',
    title: 'Exceed Resources Article',
    image: asset_data[3],
    sections: [
      MArticleSection(
        type: EDynamicField.body,
        data: [
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
        ],
      ),
      MArticleSection(
        type: EDynamicField.title,
        data: ["Article Section 1"],
      ),
      MArticleSection(
        type: EDynamicField.body,
        data: [
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."
        ],
      ),
      MArticleSection(
        type: EDynamicField.image,
        data: [asset_data[0]],
      ),
      MArticleSection(
        type: EDynamicField.body,
        data: [
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable."
        ],
      ),
      MArticleSection(
        type: EDynamicField.carousel,
        data: [
          asset_data[1],
          asset_data[2],
          asset_data[3],
        ],
      )
    ],
  ),
];
