import 'package:sadio_mane_store/core/constants/images_string.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_images_extensions.dart';

class AppLightModeImages {
  static const String primaryImage =
      'assets/images/png/andriod_12_splash_screen.png';
  static const String mainBackGround =
      Assets.assetsImagesPngCustomerHomeBgLight;
  static const String bigNavBar =
      Assets.assetsImagesPngCustomerBigNavBarLight;

  static final lightAppImages = AppImageExtensions(
    mainBackGround: mainBackGround,
    primaryImage: primaryImage,
    bigNavBar: bigNavBar,
  );
}
