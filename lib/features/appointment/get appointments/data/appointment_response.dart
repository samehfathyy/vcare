
import 'package:json_annotation/json_annotation.dart';
part 'appointment_response.g.dart';
@JsonSerializable()
class AppointmentResponse {
  final String message;
  final List<Appointment> data;
  final bool status;
  final int code;

  AppointmentResponse({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseFromJson(json);
}

@JsonSerializable()
class Appointment {
  final int id;
  final Doctor doctor;
  final Patient patient;
  @JsonKey(name: 'appointment_time')
  final String appointmentTime;
  @JsonKey(name: 'appointment_end_time')
  final String appointmentEndTime;
  final String status;
  final String? notes;
  @JsonKey(name: 'appointment_price')
  final int appointmentPrice;

  Appointment({
    required this.id,
    required this.doctor,
    required this.patient,
    required this.appointmentTime,
    required this.appointmentEndTime,
    required this.status,
    this.notes,
    required this.appointmentPrice,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
}

@JsonSerializable()
class Doctor {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final Specialization specialization;
  final City city;
  @JsonKey(name: 'appoint_price')
  final int appointPrice;
  @JsonKey(name: 'start_time')
  final String startTime;
  @JsonKey(name: 'end_time')
  final String endTime;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.specialization,
    required this.city,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) =>
      _$DoctorFromJson(json);
}

@JsonSerializable()
class Specialization {
  final int id;
  final String name;

  Specialization({
    required this.id,
    required this.name,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);
}

@JsonSerializable()
class City {
  final int id;
  final String name;
  final Governrate governrate;

  City({
    required this.id,
    required this.name,
    required this.governrate,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@JsonSerializable()
class Governrate {
  final int id;
  final String name;

  Governrate({
    required this.id,
    required this.name,
  });

  factory Governrate.fromJson(Map<String, dynamic> json) =>
      _$GovernrateFromJson(json);
}

@JsonSerializable()
class Patient {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;

  Patient({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}

