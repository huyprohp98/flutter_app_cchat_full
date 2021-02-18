// import 'package:json_annotation/json_annotation.dart';
// import 'package:equatable/equatable.dart';
//
// part 'users.g.dart';
//
// @JsonSerializable()
// class Users extends Equatable {
//   String name;
//   String email;
//   @JsonKey(name: "phone_number")
//   String phoneNumber;
//   String avatar;
//   @JsonKey(name: "background_image")
//   String backgroundImage;
//   @JsonKey(name: "date_of_birth")
//   String dateOfBirth;
//   double point;
//   int currentRanking;
//
//   Users(this.name, this.email, this.phoneNumber, this.avatar,
//       this.backgroundImage, this.dateOfBirth, this.point, this.currentRanking);
//
//   @override
//   String toString() {
//     return 'Users{name: $name, email: $email, phoneNumber: $phoneNumber, avatar: $avatar, backgroundImage: $backgroundImage, dateOfBirth: $dateOfBirth, point: $point, currentRanking: $currentRanking}';
//   }
//
//   factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
//
//   Map<String, dynamic> toJson() => _$UsersToJson(this);
//
//   @override
//   List<Object> get props => [
//     name,
//     email,
//     phoneNumber,
//     avatar,
//     backgroundImage,
//     dateOfBirth,
//     point,
//     currentRanking
//   ];
// }
