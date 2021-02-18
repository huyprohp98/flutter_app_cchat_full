// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfigResponse _$AppConfigResponseFromJson(Map<String, dynamic> json) {
  return AppConfigResponse(
    json['data'] == null
        ? null
        : AppConfigData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$AppConfigResponseToJson(AppConfigResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
