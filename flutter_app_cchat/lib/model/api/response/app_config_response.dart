import 'package:flutter_app_cchat/model/api/response/barrel_response.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_config_response.g.dart';

@JsonSerializable()
class AppConfigResponse extends BaseResponse {
  AppConfigData data;

  AppConfigResponse(this.data);

  factory AppConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$AppConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigResponseToJson(this);

  @override
  String toString() {
    return 'AppConfigResponse{data: $data}';
  }
}
