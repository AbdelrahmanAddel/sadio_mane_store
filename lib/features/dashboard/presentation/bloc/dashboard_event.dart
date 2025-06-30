part of 'dashboard_bloc.dart';

sealed class DashboardEvent {}

class GetProductsTotalLengthEvent extends DashboardEvent {}

class GetUsersTotalNumberEvent extends DashboardEvent {}

class GetCategoriesTotalNumberEvent extends DashboardEvent {}
