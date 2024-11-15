import 'package:canteen_app/data/model/response/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocal{
  Future<void> saveAuthData(AuthResponse authResponse) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('authData', authResponse.toJson());
  }
  Future<void> removeAuthData(AuthResponse authResponse) async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('authData');
  }

  Future<AuthResponse?> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final authData = pref.getString('authData');

    return AuthResponse.fromJson(authData!);

  }
  Future <bool> isAuth() async {
    final pref = await SharedPreferences.getInstance();
    final authData = pref.getString('authData');
    return authData != null;
  }

}