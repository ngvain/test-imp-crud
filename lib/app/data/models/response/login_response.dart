import 'package:json_annotation/json_annotation.dart';

import '../base_entities.dart';

part 'login_response.g.dart';

@JsonSerializable(
  includeIfNull: BaseEntities.includeIfNull,
  explicitToJson: BaseEntities.explicitToJson,
  checked: BaseEntities.checked,
  fieldRename: BaseEntities.fieldRename,
)
class LoginResponse {
  int? id;
  String? name;
  dynamic jenisUser;
  String? email;
  String? level;
  String? pathFoto;
  String? accessToken;
  String? tokenType;
  String? expiresIn;
  String? nik;

  LoginResponse({
    this.id,
    this.name,
    this.jenisUser,
    this.email,
    this.level,
    this.pathFoto,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.nik,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
