import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/util/profile_feature_items_builder.dart';

class ProfileFeatureItem extends StatelessWidget {
  const ProfileFeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ProfileFeatureItemsBuilder.build(context);
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => items[index],
      itemCount: items.length,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return verticalSpace(30);
      },
    );
  }
}
