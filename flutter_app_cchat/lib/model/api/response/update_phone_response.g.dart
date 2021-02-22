// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_phone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePhoneResponse _$UpdatePhoneResponseFromJson(Map<String, dynamic> json) {
  return UpdatePhoneResponse()
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$UpdatePhoneResponseToJson(
        UpdatePhoneResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
