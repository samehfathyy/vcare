part of 'appointment_cubit.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}
final class AppointmentLoading extends AppointmentState {}
final class AppointmentSuccess extends AppointmentState {
  final List<Appointment> appoinments;
  AppointmentSuccess({required this.appoinments});
}
final class AppointmentFailed extends AppointmentState {
  final String message;
  AppointmentFailed({required this.message});
}
