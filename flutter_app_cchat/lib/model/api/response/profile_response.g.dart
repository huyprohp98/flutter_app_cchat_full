// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) {
  return ProfileResponse(
    json['data'] == null
        ? null
        : User.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
