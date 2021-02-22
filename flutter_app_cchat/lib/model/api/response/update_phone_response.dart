import 'package:flutter_app_cchat/model/api/response/barrel_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_phone_response.g.dart';

@JsonSerializable()
class UpdatePhoneResponse extends BaseResponse {

  UpdatePhoneResponse();

  factory UpdatePhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePhoneResponseToJson(this);

}
