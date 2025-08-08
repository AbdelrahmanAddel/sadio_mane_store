import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/build_custom_paint.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/features/user/category_products/data/models/get_product_by_category_id_model.dart';
import 'package:sadio_mane_store/features/user/category_products/presentation/widgets/product_item.dart';
import 'package:sadio_mane_store/features/user/get_all_products/presentation/bloc/get_all_products_bloc.dart';
import 'package:sadio_mane_store/features/user/get_all_products/presentation/bloc/get_all_products_event.dart';
import 'package:sadio_mane_store/features/user/get_all_products/presentation/bloc/get_all_products_state.dart';

class GetAllProductsView extends StatelessWidget {
  const GetAllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<GetAllProductsBloc>()..add(GetAllProductsViewEvent()),
      child: const Scaffold(
        body: Stack(
          children: [
            BuildCustomPaint(),
            CustomScrollView(slivers: [GetAllProductsViewBody()]),
          ],
        ),
      ),
    );
  }
}

class GetAllProductsViewBody extends StatelessWidget {
  const GetAllProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
      buildWhen: (previous, current) =>
          current is GetAllProductLoadingState ||
          current is GetAllProductSuccessState ||
          current is GetAllProductFailureState,
      builder: (context, state) {
        return switch (state) {
          GetAllProductLoadingState() => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          GetAllProductSuccessState() => SliverGrid.builder(
            itemCount: state.productsList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              mainAxisExtent: 1,
            ),
            itemBuilder: (context, index) {
              final data = state.productsList[index];
              return ProductItem(
                product: ProductsData(
                  description: data.description,
                  title: data.title,
                  price: data.price,
                  images: data.images,
                ),
              );
            },
          ),
          GetAllProductFailureState() => SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          ),
          _ => const SliverToBoxAdapter(),
        };
      },
    );
  }
}
