// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Faq _$FaqFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Faq',
      json,
      ($checkedConvert) {
        final val = Faq(
          id: $checkedConvert('id', (v) => v as int?),
          pertanyaan: $checkedConvert('pertanyaan', (v) => v as String?),
          jawaban: $checkedConvert('jawaban', (v) => v as String?),
          statusPublish: $checkedConvert('status_publish', (v) => v as int?),
          createdAt: $checkedConvert('created_at', (v) => v as String?),
          updatedAt: $checkedConvert('updated_at', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'statusPublish': 'status_publish',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$FaqToJson(Faq instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('pertanyaan', instance.pertanyaan);
  writeNotNull('jawaban', instance.jawaban);
  writeNotNull('status_publish', instance.statusPublish);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  return val;
}
