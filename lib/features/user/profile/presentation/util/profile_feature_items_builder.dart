import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/custom_feature_item.dart';

class ProfileFeatureItemsBuilder {
  static List<CustomFeatureItem> build(BuildContext context) {
    return <CustomFeatureItem>[
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
  }
}
