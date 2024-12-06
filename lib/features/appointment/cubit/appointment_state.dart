part of 'appointment_cubit.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}
final class AppointmentLoading extends AppointmentState {}
final class AppointmentSuccess extends AppointmentState {
  final AppointmentResponse appointmentResponse;
  AppointmentSuccess({required this.appointmentResponse});
}
final class AppointmentFailed extends AppointmentState {
  final String message;
  AppointmentFailed({required this.message});
}
