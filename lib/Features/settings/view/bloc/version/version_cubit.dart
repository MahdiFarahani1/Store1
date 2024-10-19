import 'package:bloc/bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'version_state.dart';

class VersionCubit extends Cubit<VersionState> {
  VersionCubit() : super(VersionState(appVersion: '')) {
    getAppVersion();
  }

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    emit(VersionState(appVersion: packageInfo.version));
  }
}
