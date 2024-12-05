part of 'check_internet_cubit.dart';

@immutable
sealed class CheckInternetState {}

final class CheckInternetInitial extends CheckInternetState {}
final class CheckInternetLoading extends CheckInternetState {}
final class CheckInternetSuccess extends CheckInternetState {}
final class CheckInternetFailed extends CheckInternetState {}
