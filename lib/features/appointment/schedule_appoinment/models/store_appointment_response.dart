import 'package:json_annotation/json_annotation.dart';
part 'store_appointment_response.g.dart';
@JsonSerializable()
class StoreAppointmentResponse {
  final String message;
  final Map data;
  final bool status;
  final int code;

  StoreAppointmentResponse(
      {required this.message,
      required this.data,
      required this.status,
      required this.code});

   factory StoreAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreAppointmentResponseFromJson(json);
}
