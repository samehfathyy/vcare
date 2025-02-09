import 'package:json_annotation/json_annotation.dart';

part 'store_appointment_model.g.dart';

@JsonSerializable()
class StoreAppointmentModel {
  //doctor_id
  final String doctorId;
  //start_time
  final String startDate;
  //notes
  final String notes;

  StoreAppointmentModel(
      {required this.doctorId, required this.startDate, required this.notes});
  Map<String, dynamic> toJson() => _$StoreAppointmentModelToJson(this);
}
