part of 'internet_connection_cubit.dart';

@immutable
sealed class InternetConnectionState {}

final class InternetConnectionInitial extends InternetConnectionState {}

final class InternetConnedtedState extends InternetConnectionState {}

final class NoInternetConnectionState extends InternetConnectionState {}
