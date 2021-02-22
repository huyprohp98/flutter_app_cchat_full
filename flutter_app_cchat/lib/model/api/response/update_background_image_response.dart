import 'package:flutter_app_cchat/model/api/response/barrel_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_background_image_response.g.dart';

@JsonSerializable()
class UpdateBackgroundImageResponse extends BaseResponse {

  UpdateBackgroundImageResponse();

  factory UpdateBackgroundImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBackgroundImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBackgroundImageResponseToJson(this);

}
