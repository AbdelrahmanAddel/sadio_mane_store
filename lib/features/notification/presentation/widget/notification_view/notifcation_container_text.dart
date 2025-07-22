import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class NotificationContainerText extends StatelessWidget {
  const NotificationContainerText({
    required this.title,
    required this.content,
    super.key,
  });
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: Text('$title :')),
        horizontalSpace(10),
        Flexible(
          child: Text(
            content,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: context.theme.appColors.textColor),
          ),
        ),
      ],
    );
  }
}
