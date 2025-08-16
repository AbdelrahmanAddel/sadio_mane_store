import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/build_custom_paint.dart';
import 'package:sadio_mane_store/features/user/get_all_products/presentation/bloc/get_all_products_bloc.dart';
import 'package:sadio_mane_store/features/user/get_all_products/presentation/bloc/get_all_products_event.dart';
import 'package:sadio_mane_store/features/user/get_all_products/presentation/bloc/get_all_products_state.dart';
import 'package:sadio_mane_store/features/user/get_all_products/presentation/widgets/build_get_all_products_success_state.dart';

class BuildGetAllProductsBody extends StatefulWidget {
  const BuildGetAllProductsBody({super.key});

  @override
  State<BuildGetAllProductsBody> createState() =>
      _BuildGetAllProductsBodyState();
}

class _BuildGetAllProductsBodyState extends State<BuildGetAllProductsBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent -
                MediaQuery.of(context).size.height * 0.15) {
          context.read<GetAllProductsBloc>().add(LoadMoreProductEvent());
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
      buildWhen: (previous, current) =>
          current is GetAllProductLoadingState ||
          current is GetAllProductSuccessState ||
          current is GetAllProductFailureState ||
          current is GetAllProductLoadingMoreState,
      builder: (context, state) {
        return Stack(
          children: [
            const BuildCustomPaint(),
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                if (state is GetAllProductLoadingState &&
                    state.productsList.isEmpty)
                  const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (state is GetAllProductFailureState)
                  SliverToBoxAdapter(
                    child: Center(child: Text(state.errorMessage)),
                  )
                else ...[
                  BuildGetAllProductsSuccessState(
                    products: state.productsList,
                    hasMoreData: state.hasMoreData,
                  ),
                  if (state is GetAllProductLoadingMoreState)
                    SliverToBoxAdapter(
                      child: Center(
                        child: state.hasMoreData
                            ? const CircularProgressIndicator()
                            : const Center(
                                child: Text(
                                  'No More Data',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                      ),
                    ),
                ],
              ],
            ),
          ],
        );
      },
    );
  }
}
