part of 'dashboard_bloc.dart';

sealed class DashboardState {}

final class DashboardLoadingState extends DashboardState {}

final class GetTotalProductLengthState extends DashboardState {
  GetTotalProductLengthState({this.productsLength});
  final int? productsLength;
}

final class FailureGetTotalProductLengthState extends DashboardState {
  FailureGetTotalProductLengthState({required this.failure});
  final String failure;
}

final class GetTotalUsersNumberState extends DashboardState {
  GetTotalUsersNumberState({this.usersTotalLenght});

  final int? usersTotalLenght;
}

final class FailureGetTotalUsersNumberState extends DashboardState {
  FailureGetTotalUsersNumberState({required this.errorMessage});

  final String errorMessage;
}
final class GetTotalCategoriesNumberState extends DashboardState {
  GetTotalCategoriesNumberState({this.categoriesTotalLenght});

  final int? categoriesTotalLenght;
}
final class FailureGetTotalCategoriesNumberState extends DashboardState {
  FailureGetTotalCategoriesNumberState({required this.errorMessage});

  final String errorMessage;
}
