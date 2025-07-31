import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/custom_feature_item.dart';

class ProfileFeatureItem extends StatelessWidget {
  const ProfileFeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <CustomFeatureItem>[
      CustomFeatureItem(
        prefixIcon: Icons.language,
        prefixText: context.tr.language,
        suffixText: 'English',
        suffixWidget: const Icon(Icons.arrow_forward_ios),
      ),
      CustomFeatureItem(
        prefixIcon: Icons.currency_exchange,
        prefixText: context.tr.dark_mode,
        suffixText: 'Dark',
        suffixWidget: const Icon(Icons.arrow_forward_ios),
      ),
      CustomFeatureItem(
        prefixIcon: Icons.computer,
        prefixText: context.tr.build_developer,
        suffixText: 'Sadio Mane',
        suffixWidget: const Icon(Icons.arrow_forward_ios),
      ),
      CustomFeatureItem(
        prefixIcon: Icons.notifications,
        prefixText: context.tr.notifications,
        suffixWidget: const Icon(Icons.arrow_forward_ios),
      ),
      CustomFeatureItem(
        prefixIcon: Icons.info,
        prefixText: context.tr.build_version,
        suffixText: '1.0.0',
      ),
      CustomFeatureItem(
        prefixIcon: Icons.logout,
        prefixText: context.tr.log_out,
        suffixText: context.tr.log_out,
        suffixWidget: const Icon(Icons.arrow_forward_ios),
      ),
    ];
    return ListView.separated(
      itemBuilder: (context, index) => items[index],
      itemCount: items.length,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return verticalSpace(30);
      },
    );
  }
}
