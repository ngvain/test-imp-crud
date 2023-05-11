import 'package:json_annotation/json_annotation.dart';

import '../base_entities.dart';
part 'faq_request.g.dart';

@JsonSerializable(
  includeIfNull: BaseEntities.includeIfNull,
  explicitToJson: BaseEntities.explicitToJson,
  checked: BaseEntities.checked,
  fieldRename: BaseEntities.fieldRename,
)
class FaqRequest {
  int? page;
  int? rows;

  FaqRequest({
    this.page,
    this.rows,
  });
  factory FaqRequest.fromJson(Map<String, dynamic> json) =>
      _$FaqRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FaqRequestToJson(this);
}
