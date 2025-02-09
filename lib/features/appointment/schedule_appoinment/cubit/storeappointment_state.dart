part of 'storeappointment_cubit.dart';

@immutable
sealed class StoreappointmentState {}

final class StoreappointmentInitial extends StoreappointmentState {}
final class Storeappointmentloading extends StoreappointmentState {}
final class Storeappointmentsuccess extends StoreappointmentState {}
final class Storeappointmentfailed extends StoreappointmentState {}
