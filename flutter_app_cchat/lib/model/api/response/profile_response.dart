import 'package:flutter_app_cchat/model/api/response/barrel_response.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/users.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse extends BaseResponse {
  User data;

  ProfileResponse(this.data);

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);

  @override
  String toString() {
    return 'ProfileResponse{data: $data}';
  }
}
