import 'package:freezed_annotation/freezed_annotation.dart';

enum ETextType { body, error, primary, white, subtitle, disabled, disabledPrimary, category }

enum EText { h1, h2, h3, h4, h5 }

enum EMenu { home, task, chat, report, misc }

enum EDevice { mobile, tablet, desktop }

enum ERequestMethod { get, post, patch, delete }

enum ESize { xs, sm, md, lg, xl }

enum EAsyncDropdown { tyep1 }

enum EExpandable { minimize, expand, form }

enum EInputStyle { line, primary }

enum EInputColor { primary, transparent, background }

enum EAttachment {
  @JsonValue('Video')
  video,
  @JsonValue('Image')
  image,
  @JsonValue('Pdf')
  pdf,
  @JsonValue('Thumbnail')
  thumbnail,
  @JsonValue('Others')
  others
}

enum EDynamicField {
  @JsonValue('Image')
  image,
  @JsonValue('Carousel')
  carousel,
  @JsonValue('Title')
  title,
  @JsonValue('Body')
  body,
  @JsonValue('Unordered')
  unordered
}

enum EChat {
  @JsonValue('Projects')
  projects,
  @JsonValue('Departments')
  departments,
  @JsonValue('Groups')
  groups,
  @JsonValue('Colleagues')
  colleagues
}

enum EField {
  @JsonValue('Colleague')
  colleague,
  @JsonValue('Date')
  date,
  @JsonValue('String')
  string,
  @JsonValue('number')
  number,
}
