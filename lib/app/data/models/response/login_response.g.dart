// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LoginResponse',
      json,
      ($checkedConvert) {
        final val = LoginResponse(
          id: $checkedConvert('id', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as String?),
          jenisUser: $checkedConvert('jenis_user', (v) => v),
          email: $checkedConvert('email', (v) => v as String?),
          level: $checkedConvert('level', (v) => v as String?),
          pathFoto: $checkedConvert('path_foto', (v) => v as String?),
          accessToken: $checkedConvert('access_token', (v) => v as String?),
          tokenType: $checkedConvert('token_type', (v) => v as String?),
          expiresIn: $checkedConvert('expires_in', (v) => v as String?),
          nik: $checkedConvert('nik', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'jenisUser': 'jenis_user',
        'pathFoto': 'path_foto',
        'accessToken': 'access_token',
        'tokenType': 'token_type',
        'expiresIn': 'expires_in'
      },
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('jenis_user', instance.jenisUser);
  writeNotNull('email', instance.email);
  writeNotNull('level', instance.level);
  writeNotNull('path_foto', instance.pathFoto);
  writeNotNull('access_token', instance.accessToken);
  writeNotNull('token_type', instance.tokenType);
  writeNotNull('expires_in', instance.expiresIn);
  writeNotNull('nik', instance.nik);
  return val;
}
