// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqRequest _$FaqRequestFromJson(Map<String, dynamic> json) => $checkedCreate(
      'FaqRequest',
      json,
      ($checkedConvert) {
        final val = FaqRequest(
          page: $checkedConvert('page', (v) => v as int?),
          rows: $checkedConvert('rows', (v) => v as int?),
        );
        return val;
      },
    );

Map<String, dynamic> _$FaqRequestToJson(FaqRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('page', instance.page);
  writeNotNull('rows', instance.rows);
  return val;
}
