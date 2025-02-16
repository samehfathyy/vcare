import 'package:json_annotation/json_annotation.dart';

part 'store_appointment_model.g.dart';

@JsonSerializable()
class StoreAppointmentModel {
  //doctor_id
  String doctor_id;
  //start_time
  String start_time;
  //notes
  String notes;

  StoreAppointmentModel(
      {required this.doctor_id, required this.start_time, required this.notes});
  Map<String, dynamic> toJson() => _$StoreAppointmentModelToJson(this);
}
