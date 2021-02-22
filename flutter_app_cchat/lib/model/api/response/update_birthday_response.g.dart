// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_birthday_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBirthdayResponse _$UpdateBirthdayResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateBirthdayResponse()
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$UpdateBirthdayResponseToJson(
        UpdateBirthdayResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
