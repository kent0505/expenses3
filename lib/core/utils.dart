import 'package:shared_preferences/shared_preferences.dart';

import '../features/money/models/money.dart';

bool onboarding = true;
String myname = '';
int myprofits = 0;
int mylosses = 0;
List<Money> mymoneys = [];

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboarding');
  onboarding = prefs.getBool('onboarding') ?? true;
  myname = prefs.getString('myname') ?? 'John';
  myprofits = prefs.getInt('myprofits') ?? 0;
  mylosses = prefs.getInt('mylosses') ?? 0;
}

Future<void> saveUser(String name) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('myname', name);
  prefs.setBool('onboarding', false);
  await getData();
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}
