// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_birthday_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBirthdayRequest _$UpdateBirthdayRequestFromJson(
    Map<String, dynamic> json) {
  return UpdateBirthdayRequest(
    dateOfBirth: json['date_of_birth'] as String,
  );
}

Map<String, dynamic> _$UpdateBirthdayRequestToJson(
        UpdateBirthdayRequest instance) =>
    <String, dynamic>{
      'date_of_birth': instance.dateOfBirth,
    };
