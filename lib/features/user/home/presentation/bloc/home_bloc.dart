import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/user/home/domain/usecases/get_banners_usecase.dart';
import 'package:sadio_mane_store/features/user/home/domain/usecases/get_categories_usecase.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_event.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.getCategoriesUsecase,
    required this.getBannersUsecase,
  }) : super(HomeInitial()) {
    on<GetBannersEvent>(_onGetBannersEvent);
    on<GetCategoriesEvent>(_onGetCategoriesEvent);
  }

  final GetBannersUsecase getBannersUsecase;
  final GetHomeCategoriesUsecase getCategoriesUsecase;
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

  Future<void> _onGetCategoriesEvent(
    GetCategoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(GetCategoriesLoadingState());
    final result = await getCategoriesUsecase.call();
    result.fold(
      (error) {
        emit(GetCategoriesErrorState(error));
      },
      (categories) {
        emit(GetCategoriesSuccessState(categories));
      },
    );
  }
}
