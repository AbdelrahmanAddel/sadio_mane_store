import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  AppInfo._();
  static AppInfo get instance => AppInfo._();

  Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return '${packageInfo.version} (${packageInfo.buildNumber})';
  }
}
