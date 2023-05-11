import 'package:json_annotation/json_annotation.dart';

import '../faq.dart';

part 'faq_response.g.dart';

@JsonSerializable()
class FaqResponse {
  int? code;
  String? message;
  List<Faq> data;
  FaqResponse(this.code, this.message, this.data);

  factory FaqResponse.fromJson(Map<String, dynamic> json) =>
      _$FaqResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FaqResponseToJson(this);
}
