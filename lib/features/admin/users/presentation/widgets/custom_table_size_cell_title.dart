import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class CustomTableSizeCellTitle extends StatelessWidget {
  const CustomTableSizeCellTitle({
    required this.title,
    required this.icon,
    super.key,
  });
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 10),
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.start,
          style: TextStyle(color: context.theme.appColors.textColor
          
          ),
        ),
      ],
    );
  }
}
