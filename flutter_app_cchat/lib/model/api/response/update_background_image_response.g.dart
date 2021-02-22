// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_background_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBackgroundImageResponse _$UpdateBackgroundImageResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateBackgroundImageResponse()
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$UpdateBackgroundImageResponseToJson(
        UpdateBackgroundImageResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
