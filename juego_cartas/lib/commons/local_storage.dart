import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late final SharedPreferences prefs;

  Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}
