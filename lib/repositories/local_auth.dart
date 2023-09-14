import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class Localauth {
  static final _auth = LocalAuthentication();

  static Future<bool> _canAuth() async => await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try {
      if (!await _canAuth()) return false;

      return await _auth.authenticate(
          localizedReason: 'ตั้งค่าล็อกอินด้วยชีวมาตรเพื่อการเข้าถึงที่รวดเร็วขึ้น',
          authMessages: [
            AndroidAuthMessages(
              signInTitle: 'ต้องการ',
              cancelButton: 'คราวหลัง',
            ),
            IOSAuthMessages(
              cancelButton: 'คราวหลัง',
            ),
          ],
          options: AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ));
    } catch (e) {
      return false;
    }
  }
}
