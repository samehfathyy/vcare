// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreAppointmentResponse _$StoreAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    StoreAppointmentResponse(
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>,
      status: json['status'] as bool,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$StoreAppointmentResponseToJson(
        StoreAppointmentResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
      'code': instance.code,
    };
