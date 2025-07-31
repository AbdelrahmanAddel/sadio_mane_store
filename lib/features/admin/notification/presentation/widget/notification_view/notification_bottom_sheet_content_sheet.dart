import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/functions/text_form_field_validator.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/admin/notification/data/model/notification_content_model.dart';
import 'package:sadio_mane_store/features/admin/notification/presentation/bloc/notification_bloc.dart';
import 'package:sadio_mane_store/features/admin/notification/presentation/bloc/notification_event.dart';
import 'package:sadio_mane_store/features/admin/notification/presentation/widget/notification_add/notification_bloc_listener.dart';

class NotificationBottomSheetContent extends StatelessWidget {
  const NotificationBottomSheetContent({
    required this.isEdit,
    this.currentIndex,
    this.notificationContentModel,
    super.key,
  });
  final bool isEdit;
  final NotificationContentModel? notificationContentModel;
  final int? currentIndex;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NotificationBloc>();
    bloc.titleController.text = notificationContentModel?.title ?? '';
    bloc.bodyController.text = notificationContentModel?.body ?? '';
    bloc.productIdController.text =
        notificationContentModel?.productId.toString() ?? '';

    return SingleChildScrollView(
      child: Form(
        key: bloc.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                isEdit ? 'Edit Notification' : 'Add Notification ',

                style: context.theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            verticalSpace(20),
            const Text('Enter The Notification Title'),
            verticalSpace(20),
            CustomTextFormField(
              validator: textFormFieldValidator(TextFormFieldEnums.title),
              controller: bloc.titleController,
              hintText: 'Title',
            ),
            verticalSpace(20),
            const Text('Enter The Notification Body'),
            verticalSpace(20),
            CustomTextFormField(
              validator: textFormFieldValidator(TextFormFieldEnums.body),

              controller: bloc.bodyController,
              hintText: 'Body',
            ),
            verticalSpace(20),
            const Text('Enter The Notification product Id'),
            verticalSpace(20),
            CustomTextFormField(
              validator: textFormFieldValidator(TextFormFieldEnums.productId),
              controller: bloc.productIdController,
              keyboardType: TextInputType.number,
              hintText: 'Product Id',
            ),
            verticalSpace(20),
            CustomAppButton(
              onTap: () {
                if (bloc.formKey.currentState!.validate()) {
                  if (isEdit) {
                    bloc.add(UpdateNotificationEvent(id: currentIndex!));
                  } else {
                    bloc.add(AddNotificationEvent());
                  }
                  Navigator.pop(context);
                }
              },
              width: double.infinity,
              child: Text(isEdit ? 'Update' : 'Add'),
            ),
            const NotificationBlocListener(),
          ],
        ),
      ),
    );
  }
}
