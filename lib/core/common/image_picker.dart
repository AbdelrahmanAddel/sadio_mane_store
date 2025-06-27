
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerClass {
  ImagePickerClass({required this.context});
  BuildContext context;

  Future<XFile?> pickImage() async {
    final picker = ImagePicker();
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);

      // ignore: unnecessary_null_comparison
      if (picker != null) {
        return XFile(image!.path);
      } else {
        return null;
      }
    } catch (error, stack) {
      final premsion = await Permission.camera.status;
      if (premsion.isDenied) {
        await _showAlertPermissionsDialog(context);
      } else {
        debugPrint('error => $error');
        debugPrint('where => $stack');
      }
    }
    return null;
  }

  Future<void> _showAlertPermissionsDialog(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Permissions Denied'),
          content: const Text('Allow access to gallery and photos'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            const CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: openAppSettings,
              child: Text('Settings'),
            ),
          ],
        );
      },
    );
  }
}
