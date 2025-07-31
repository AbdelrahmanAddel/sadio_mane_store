import 'package:sadio_mane_store/core/constants/images_string.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_images_extensions.dart';

class AppDarkModeImages {
  static const String primaryImage = 'assets/images/png/empty_screen.png';
  static const String mainBackGround =
      Assets.assetsImagesPngCustomerHomeBgDark;
  static const String bigNavBar =
      Assets.assetsImagesPngCustomerBigNavBarDark;
  static final darkAppImages = AppImageExtensions(
    mainBackGround: mainBackGround,
    primaryImage: primaryImage,
    bigNavBar: bigNavBar,
  );
}
