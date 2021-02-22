import 'package:flutter_app_cchat/model/api/response/barrel_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_avatar_response.g.dart';

@JsonSerializable()
class UpdateAvatarResponse extends BaseResponse {

  UpdateAvatarResponse();

  factory UpdateAvatarResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAvatarResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateAvatarResponseToJson(this);

}
