import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_unread_data.g.dart';

@JsonSerializable()
class NotificationUnreadData extends Equatable {
  int unread;

  NotificationUnreadData(this.unread);

  factory NotificationUnreadData.fromJson(Map<String, dynamic> json) =>
      _$NotificationUnreadDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationUnreadDataToJson(this);

  @override
  List<Object> get props => [unread];
}
