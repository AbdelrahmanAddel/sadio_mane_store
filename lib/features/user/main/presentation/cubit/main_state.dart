import 'package:equatable/equatable.dart';
import 'package:sadio_mane_store/features/user/main/enum/main_view_enums.dart';

sealed class MainState extends Equatable {
  const MainState({required this.mainViewEnums});

  final MainViewEnums mainViewEnums;
}

final class MainInitial extends MainState {
  const MainInitial({required super.mainViewEnums});

  @override
  List<Object?> get props => [mainViewEnums];
}

final class ChangeMainViewState extends MainState {
  const ChangeMainViewState({required super.mainViewEnums});

  @override
  List<Object?> get props => [mainViewEnums];
}
