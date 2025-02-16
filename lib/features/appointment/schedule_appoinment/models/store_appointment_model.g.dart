// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreAppointmentModel _$StoreAppointmentModelFromJson(
        Map<String, dynamic> json) =>
    StoreAppointmentModel(
      doctor_id: json['doctor_id'] as String,
      start_time: json['start_time'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$StoreAppointmentModelToJson(
        StoreAppointmentModel instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctor_id,
      'start_time': instance.start_time,
      'notes': instance.notes,
    };
