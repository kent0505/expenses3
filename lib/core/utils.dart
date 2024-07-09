import 'package:shared_preferences/shared_preferences.dart';

bool onboarding = true;
String myname = '';
String mycurrency = '\$';
int myexpense = 0;
int myincome = 0;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboarding');
  onboarding = prefs.getBool('onboarding') ?? true;
  myname = prefs.getString('myname') ?? 'John';
  mycurrency = prefs.getString('mycurrency') ?? '\$';
  myexpense = prefs.getInt('myexpense') ?? 0;
  myincome = prefs.getInt('myincome') ?? 0;
}
