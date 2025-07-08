import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_show_modal_bottom_sheet.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_event.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_bloc.dart';
import 'package:sadio_mane_store/features/products/presentation/widgets/add_products/add_product_bottom_sheet_content.dart';

class ProductsActionRow extends StatelessWidget {
  const ProductsActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Get All Products ', style: TextStyle(fontSize: 20.sp)),
        CustomAppButton(
          onTap: () => addProduct(context),
          width: 100.h,
          height: 40.w,
          child: const Text('Add'),
        ),
      ],
    );
  }
}

Future<dynamic> addProduct(BuildContext context) {
  return customShowModalBottomSheet(
    buttonWidget: MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<UploadImageCubit>()),
        BlocProvider(
          create:
              (context) => getIt<CategoriesBloc>()..add(GetCategoriesEvent()),
        ),
        BlocProvider(create: (context) => getIt<ProductBloc>()),
      ],
      child: const AddProductBottomSheetContent(),
    ),
    context: context,
  );
}
