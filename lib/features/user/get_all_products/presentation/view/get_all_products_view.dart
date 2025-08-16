import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/features/user/get_all_products/presentation/bloc/get_all_products_bloc.dart';
import 'package:sadio_mane_store/features/user/get_all_products/presentation/bloc/get_all_products_event.dart';
import 'package:sadio_mane_store/features/user/get_all_products/presentation/widgets/build_get_all_products_body.dart';

class GetAllProductsView extends StatelessWidget {
  const GetAllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<GetAllProductsBloc>()..add(GetAllProductsViewEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('All Products'), centerTitle: true),
        body: const BuildGetAllProductsBody(),
      ),
    );
  }
}
