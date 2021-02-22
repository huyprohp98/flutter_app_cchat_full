// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_phone_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePhoneRequest _$UpdatePhoneRequestFromJson(Map<String, dynamic> json) {
  return UpdatePhoneRequest(
    phoneNumber: json['phone_number'] as String,
    code: json['otp_code'] as String,
  );
}

Map<String, dynamic> _$UpdatePhoneRequestToJson(UpdatePhoneRequest instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'otp_code': instance.code,
    };
