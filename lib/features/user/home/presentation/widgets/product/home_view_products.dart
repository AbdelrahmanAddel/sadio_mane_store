import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_bloc.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_state.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/product/states/build_product_loading_state.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/product/states/build_product_success_state.dart';

class HomeViewProducts extends StatelessWidget {
  const HomeViewProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is GetProductsLoadingState ||
          current is GetProductsSuccessState ||
          current is GetProductsErrorState,
      builder: (context, state) {
        return switch (state) {
          GetProductsLoadingState() => const BuildProductsLoadingState(),
          GetProductsSuccessState() => BuildProductSuccessState(
            products: state.products,
          ),
          GetProductsErrorState() => const SliverToBoxAdapter(
            child: Center(child: Text('Error')),
          ),
          _ => const SliverToBoxAdapter(),
        };
      },
    );
  }
}
