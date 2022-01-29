import 'package:custom_utilities/device/service/device_info_service.dart';
import 'package:custom_utilities/logger/models/logger_model.dart';
import 'package:custom_utilities/logger/repository/logger_repository.dart';
import 'package:package_info/package_info.dart';

class LoggerService {
  LoggerService({
    required this.loggerRepository,
    required this.deviceInfoService,
  });

  final LoggerRepository? loggerRepository;
  final DeviceInfoService? deviceInfoService;

  Future<void> addLogAsync(LoggerModel log, String? login) async {
    log.deviceInfo = await deviceInfoService!.getDeviceInfo();

    final PackageInfo packageInfo = await getPackageInfoAsync();
    log.appName = packageInfo.appName;
    log.appVersion = packageInfo.version;
    log.packageName = packageInfo.packageName;

    //log.login = userWrapper!.getUser!.email;
    log.login = login;

    loggerRepository!.addLog(log);
  }

  Future<PackageInfo> getPackageInfoAsync() async {
    return await PackageInfo.fromPlatform();
  }
}
