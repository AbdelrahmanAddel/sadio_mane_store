part of 'connectivity_check_cubit.dart';

sealed class ConnectivityCheckState {}

final class ConnectivityCheckInitial extends ConnectivityCheckState {}

final class InternetConnection extends ConnectivityCheckState {}

final class NoInternetConnection extends ConnectivityCheckState {}
