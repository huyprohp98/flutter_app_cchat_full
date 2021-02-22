// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_name_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateNameResponse _$UpdateNameResponseFromJson(Map<String, dynamic> json) {
  return UpdateNameResponse()
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$UpdateNameResponseToJson(UpdateNameResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
