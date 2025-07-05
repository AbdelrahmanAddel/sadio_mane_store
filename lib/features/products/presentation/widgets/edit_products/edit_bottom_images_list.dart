import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';

class EditBottomImagesList extends StatelessWidget {
  const EditBottomImagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[400],
            image: const DecorationImage(
              image: NetworkImage(
                'https://cpmr-islands.org/wp-content/uploads/sites/4/2019/07/Test-Logo-Small-Black-transparent-1.png',
              ),
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, size: 50, color: Colors.white),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return verticalSpace(10);
      },
    );
  }
}
