import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/categories/presentation/widget/get_all_categories_row.dart';
import 'package:sadio_mane_store/features/categories/presentation/widget/product_container.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: Column(
        children: [
          verticalSpace(20),
          const GetAllCategoriesAndAddCategoriesRow(),
          verticalSpace(25),
          const ProductContainer(categoryName: 'Sadio Mane', categoryImage: 'https://upload.wikimedia.org/wikipedia/commons/e/e2/Sadio_Man%C3%A9_-_Persepolis_F.C._v_Al_Nassr_FC%2C_19_September_2023.jpg'),
        
        ],
      ),
    );
  }
}
Future<dynamic> bottomSheet(BuildContext context){
  return showModalBottomSheet(
    
    isScrollControlled: true,
    context: context, builder: 
  (context) {
    
    return SingleChildScrollView(
      child: Container(
        child: Placeholder(),

      ),
    );


  },
  
  );
}
