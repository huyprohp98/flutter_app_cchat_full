import 'package:flutter_app_cchat/model/api/response/barrel_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_name_response.g.dart';

@JsonSerializable()
class UpdateNameResponse extends BaseResponse {

  UpdateNameResponse();

  factory UpdateNameResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateNameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateNameResponseToJson(this);

}
