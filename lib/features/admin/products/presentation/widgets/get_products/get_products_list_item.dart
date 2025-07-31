import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/core/common/widget/custom_container_linear_admin.dart';
import 'package:sadio_mane_store/core/common/widget/custom_show_modal_bottom_sheet.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_event.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/bloc/product_bloc.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/bloc/product_event.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/widgets/edit_products/edit_product_show_bottom_content.dart';

class GetProductListItem extends StatelessWidget {
  const GetProductListItem({
    required this.currentIndex,
    required this.productData,
    super.key,
  });

  final ProductDataModel productData;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 100.h,
      width: 100.w,

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.green),
                  onPressed:
                      () => updateProducts(context, currentIndex, productData),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed:
                      () => _showDeleteProductDialog(
                        context,
                        productData.id.toString(),
                        context.read<ProductBloc>(),
                      ),
                ),
              ],
            ),
            Flexible(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: CachedNetworkImage(
                    width: 200.w,
                    height: 120.h,
                    imageUrl: productData.images![0],
                    fit: BoxFit.fill,
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            verticalSpace(5),
            Text(productData.title.toString(), textAlign: TextAlign.left),
            verticalSpace(5),
            Text('${productData.price} \$'),
          ],
        ),
      ),
    );
  }
  //TODO You repeat this widget 2 times one in category and one in product i think you know what you should do 😁

  Future<dynamic> _showDeleteProductDialog(
    BuildContext context,
    String id,
    ProductBloc productBloc,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Are You Sure?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'If you delete this product, it will be removed permanently.',
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    productBloc.add(
                      DeleteProductEvent(productId: int.parse(id)),
                    );
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

Future<dynamic> updateProducts(
  BuildContext context,
  int currentIndex,
  ProductDataModel productData,
) {
  return customShowModalBottomSheet(
    buttonWidget: MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: context.read<ProductBloc>()..add(GetProductEvent()),
        ),
        BlocProvider(
          create:
              (context) => getIt<CategoriesBloc>()..add(GetCategoriesEvent()),
        ),
        BlocProvider(create: (context) => getIt<UploadImageCubit>()),
      ],
      child: EditProductBottomSheetContent(
        currentProductIndex: currentIndex,
        productData: productData,
      ),
    ),
    context: context,
  );
}
