import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/local/barrel_local.dart';
import 'package:meta/meta.dart';

class SessionRepository {
  Pref pref;

  SessionRepository({@required this.pref});

  Future<bool> saveToken(String token) {
    return pref.saveString(AppPreferences.auth_token, token);
  }

  Future<String> getToken() async {
    return await pref.getString(AppPreferences.auth_token);
  }
}
