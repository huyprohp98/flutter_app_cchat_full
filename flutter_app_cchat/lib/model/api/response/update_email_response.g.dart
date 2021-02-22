// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateEmailResponse _$UpdateEmailResponseFromJson(Map<String, dynamic> json) {
  return UpdateEmailResponse()
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$UpdateEmailResponseToJson(
        UpdateEmailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
