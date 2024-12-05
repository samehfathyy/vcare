// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponseModel _$UserProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserProfileResponseModel(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserProfileResponseModelToJson(
        UserProfileResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
      'code': instance.code,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
    };
