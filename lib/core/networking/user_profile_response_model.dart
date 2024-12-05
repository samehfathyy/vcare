import 'package:json_annotation/json_annotation.dart';

part 'user_profile_response_model.g.dart';

@JsonSerializable()
class UserProfileResponseModel {
  String? message;
  List<Data?>? data;
  bool? status;
  int? code;
  UserProfileResponseModel({this.message, this.data, this.status, this.code});
  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseModelFromJson(json);
}

@JsonSerializable()
class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;
  Data({this.id, this.name, this.email, this.phone, this.gender});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
