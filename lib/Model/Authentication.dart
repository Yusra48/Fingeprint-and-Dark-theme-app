import 'package:local_auth/local_auth.dart';

class Authentication {
  static final _auth = LocalAuthentication();

  static Future<bool> canAuthenticate() async {
    bool canCheckBiometrics = await _auth.canCheckBiometrics;
    bool isDeviceSupported = await _auth.isDeviceSupported();
    return canCheckBiometrics && isDeviceSupported;
  }

  static Future<bool> authenticate() async {
    try {
      bool canAuth = await canAuthenticate();
      if (!canAuth) return false;

      bool authenticated = await _auth.authenticate(
        localizedReason: 'Authenticate to access the app',
      );

      return authenticated;
    } catch (e) {
      print('Error during authentication: $e');
      return false;
    }
  }
}
