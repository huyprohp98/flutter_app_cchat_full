// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_email_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateEmailRequest _$UpdateEmailRequestFromJson(Map<String, dynamic> json) {
  return UpdateEmailRequest(
    email: json['email'] as String,
    code: json['otp_code'] as String,
  );
}

Map<String, dynamic> _$UpdateEmailRequestToJson(UpdateEmailRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp_code': instance.code,
    };
