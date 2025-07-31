import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/user/main/enum/main_view_enums.dart';
import 'package:sadio_mane_store/features/user/main/presentation/cubit/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainInitial(mainViewEnums: MainViewEnums.home));

  void changeMainView(MainViewEnums mainViewEnums) {
    emit(ChangeMainViewState(mainViewEnums: mainViewEnums));
  }
}
