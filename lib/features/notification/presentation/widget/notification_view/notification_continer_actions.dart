import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';

class NotificationContainerActions extends StatelessWidget {
  const NotificationContainerActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Icon(Icons.delete, color: Colors.red),
        horizontalSpace(25),
        const Icon(Icons.edit, color: Colors.yellow),
        horizontalSpace(25),
        const Icon(Icons.send, color: Colors.green),
      ],
    );
  }
}
