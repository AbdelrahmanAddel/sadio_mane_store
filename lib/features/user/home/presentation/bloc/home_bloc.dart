import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/user/home/domain/usecases/get_banners_usecase.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_event.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.getBannersUsecase}) : super(HomeInitial()) {
    on<GetBannersEvent>(_onGetBannersEvent);
  }

  final GetBannersUsecase getBannersUsecase;
  int activeIndex = 0;

  Future<void> _onGetBannersEvent(
    GetBannersEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(GetBannersLoadingState());
    final result = await getBannersUsecase();
    result.fold(
      (error) => emit(GetBannersErrorState(error)),
      (banners) => emit(GetBannersSuccessState(banners)),
    );
  }

  void setActiveIndex(int index) {
    activeIndex = index;
    emit(HomeInitial());
  }
}
