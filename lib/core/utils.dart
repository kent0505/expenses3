import 'package:shared_preferences/shared_preferences.dart';

import '../features/money/models/money.dart';

bool onboarding = true;
String myname = '';
bool achieve1 = false;
bool achieve2 = false;
bool achieve3 = false;
List<Money> mymoneys = [];

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboarding');
  onboarding = prefs.getBool('onboarding') ?? true;
  myname = prefs.getString('myname') ?? 'John';
  achieve1 = prefs.getBool('achieve1') ?? false;
  achieve2 = prefs.getBool('achieve2') ?? false;
  achieve3 = prefs.getBool('achieve3') ?? false;
}

Future<void> saveUser(String name) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('myname', name);
  prefs.setBool('onboarding', false);
  await getData();
}

int getBalance() {
  int prifit = 0;
  int loss = 0;
  for (Money money in mymoneys) {
    if (money.profit) {
      prifit = prifit + money.amount;
    } else {
      loss = loss + money.amount;
    }
  }
  return prifit - loss;
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

int dayExpenses = 0;
int w1Loss = 0;
int w2Loss = 0;
int w3Loss = 0;
int w4Loss = 0;
int w5Loss = 0;
int w6Loss = 0;
int w7Loss = 0;

int m1Loss = 0;
int m2Loss = 0;
int m3Loss = 0;
int m4Loss = 0;
int m5Loss = 0;
int m6Loss = 0;
int m7Loss = 0;
int m8Loss = 0;
int m9Loss = 0;
int m10Loss = 0;
int m11Loss = 0;
int m12Loss = 0;

int w1Profit = 0;
int w2Profit = 0;
int w3Profit = 0;
int w4Profit = 0;
int w5Profit = 0;
int w6Profit = 0;
int w7Profit = 0;

int m1Profit = 0;
int m2Profit = 0;
int m3Profit = 0;
int m4Profit = 0;
int m5Profit = 0;
int m6Profit = 0;
int m7Profit = 0;
int m8Profit = 0;
int m9Profit = 0;
int m10Profit = 0;
int m11Profit = 0;
int m12Profit = 0;

List<Money> getLastWeekMoneys() {
  List<Money> sortedmoneys = [];
  int last = getCurrentTimestamp() - 604800;
  for (Money money in mymoneys) {
    if (money.id > last) {
      sortedmoneys.add(money);
    }
  }
  return sortedmoneys;
}

void calculateExpenses() {
  w1Loss = 0;
  w2Loss = 0;
  w3Loss = 0;
  w4Loss = 0;
  w5Loss = 0;
  w6Loss = 0;
  w7Loss = 0;

  w1Profit = 0;
  w2Profit = 0;
  w3Profit = 0;
  w4Profit = 0;
  w5Profit = 0;
  w6Profit = 0;
  w7Profit = 0;

  for (Money money in getLastWeekMoneys()) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(money.id * 1000);

    if (money.profit) {
      if (date.weekday == 1) w1Profit = w1Profit + money.amount;
      if (date.weekday == 2) w2Profit = w2Profit + money.amount;
      if (date.weekday == 3) w3Profit = w3Profit + money.amount;
      if (date.weekday == 4) w4Profit = w4Profit + money.amount;
      if (date.weekday == 5) w5Profit = w5Profit + money.amount;
      if (date.weekday == 6) w6Profit = w6Profit + money.amount;
      if (date.weekday == 7) w7Profit = w7Profit + money.amount;
    } else {
      if (date.weekday == 1) w1Loss = w1Loss + money.amount;
      if (date.weekday == 2) w2Loss = w2Loss + money.amount;
      if (date.weekday == 3) w3Loss = w3Loss + money.amount;
      if (date.weekday == 4) w4Loss = w4Loss + money.amount;
      if (date.weekday == 5) w5Loss = w5Loss + money.amount;
      if (date.weekday == 6) w6Loss = w6Loss + money.amount;
      if (date.weekday == 7) w7Loss = w7Loss + money.amount;
    }
  }
}

void calculateMonthExpenses() {
  m1Loss = 0;
  m2Loss = 0;
  m3Loss = 0;
  m4Loss = 0;
  m5Loss = 0;
  m6Loss = 0;
  m7Loss = 0;
  m8Loss = 0;
  m9Loss = 0;
  m10Loss = 0;
  m11Loss = 0;
  m12Loss = 0;

  m1Profit = 0;
  m2Profit = 0;
  m3Profit = 0;
  m4Profit = 0;
  m5Profit = 0;
  m6Profit = 0;
  m7Profit = 0;
  m8Profit = 0;
  m9Profit = 0;
  m10Profit = 0;
  m11Profit = 0;
  m12Profit = 0;

  for (Money money in mymoneys) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(money.id * 1000);

    if (money.profit) {
      if (date.month == 1) m1Profit = m1Profit + money.amount;
      if (date.month == 2) m2Profit = m2Profit + money.amount;
      if (date.month == 3) m3Profit = m3Profit + money.amount;
      if (date.month == 4) m4Profit = m4Profit + money.amount;
      if (date.month == 5) m5Profit = m5Profit + money.amount;
      if (date.month == 6) m6Profit = m6Profit + money.amount;
      if (date.month == 7) m7Profit = m7Profit + money.amount;
      if (date.month == 8) m8Profit = m8Profit + money.amount;
      if (date.month == 9) m9Profit = m9Profit + money.amount;
      if (date.month == 10) m10Profit = m10Profit + money.amount;
      if (date.month == 11) m11Profit = m11Profit + money.amount;
      if (date.month == 12) m12Profit = m12Profit + money.amount;
    } else {
      if (date.month == 1) m1Loss = m1Loss + money.amount;
      if (date.month == 2) m2Loss = m2Loss + money.amount;
      if (date.month == 3) m3Loss = m3Loss + money.amount;
      if (date.month == 4) m4Loss = m4Loss + money.amount;
      if (date.month == 5) m5Loss = m5Loss + money.amount;
      if (date.month == 6) m6Loss = m6Loss + money.amount;
      if (date.month == 7) m7Loss = m7Loss + money.amount;
      if (date.month == 8) m8Profit = m8Profit + money.amount;
      if (date.month == 9) m9Profit = m9Profit + money.amount;
      if (date.month == 10) m10Profit = m10Profit + money.amount;
      if (date.month == 11) m11Profit = m11Profit + money.amount;
      if (date.month == 12) m12Profit = m12Profit + money.amount;
    }
  }
}

bool chechMonth(int month) {
  DateTime now = DateTime.now();
  if (now.month == month) return true;
  return false;
}

double getHeight(int a, int b) {
  if (a == 0) return 5;
  if (b == 0) return 5;
  if (a > b) return 82;
  return (a / b) * 32 + (a / b) * 50;
}

Future<void> checkAchievements() async {
  final prefs = await SharedPreferences.getInstance();
  List<Money> oneMonthMoneys = [];
  int secs = getCurrentTimestamp() - 2629744;
  for (Money money in mymoneys) {
    if (money.id > secs) oneMonthMoneys.add(money);
  }
  int total = 0;
  for (Money money in oneMonthMoneys) {
    if (!money.profit) total = total + money.amount;
  }
  if (total >= 1000) prefs.setBool('achieve1', true);
  if (total >= 5000) prefs.setBool('achieve2', true);
  await getData();
}
