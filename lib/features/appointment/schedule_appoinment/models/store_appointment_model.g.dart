// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreAppointmentModel _$StoreAppointmentModelFromJson(
        Map<String, dynamic> json) =>
    StoreAppointmentModel(
      doctorId: json['doctorId'] as String,
      startDate: json['startDate'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$StoreAppointmentModelToJson(
        StoreAppointmentModel instance) =>
    <String, dynamic>{
      'doctorId': instance.doctorId,
      'startDate': instance.startDate,
      'notes': instance.notes,
    };
