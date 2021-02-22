import 'package:json_annotation/json_annotation.dart';

part 'update_phone_request.g.dart';
@JsonSerializable()
class UpdatePhoneRequest {
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  @JsonKey(name: "otp_code")
  final String code;

  UpdatePhoneRequest({this.phoneNumber, this.code});

  factory UpdatePhoneRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePhoneRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePhoneRequestToJson(this);
}