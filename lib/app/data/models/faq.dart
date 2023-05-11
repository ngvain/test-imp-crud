import 'package:json_annotation/json_annotation.dart';

import 'base_entities.dart';

part 'faq.g.dart';

@JsonSerializable(
  includeIfNull: BaseEntities.includeIfNull,
  explicitToJson: BaseEntities.explicitToJson,
  checked: BaseEntities.checked,
  fieldRename: BaseEntities.fieldRename,
)
class Faq {
  int? id;
  String? pertanyaan;
  String? jawaban;
  int? statusPublish;
  String? createdAt;
  String? updatedAt;

  Faq({
    this.id,
    this.pertanyaan,
    this.jawaban,
    this.statusPublish,
    this.createdAt,
    this.updatedAt,
  });
  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);
  Map<String, dynamic> toJson() => _$FaqToJson(this);
}
