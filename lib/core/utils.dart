import 'dart:developer';

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

int dayExpenses = 0;
int w1Loss = 0;
int w2Loss = 0;
int w3Loss = 0;
int w4Loss = 0;
int w5Loss = 0;
int w6Loss = 0;
int w7Loss = 0;

int w1Profit = 0;
int w2Profit = 0;
int w3Profit = 0;
int w4Profit = 0;
int w5Profit = 0;
int w6Profit = 0;
int w7Profit = 0;

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

  for (Money money in mymoneys) {
    log(money.id.toString());
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
  print(w1Loss);
  print(w2Loss);
  print(w3Loss);
  print(w4Loss);
  print(w5Loss);
  print(w6Loss);
  print(w7Loss);
  print(w1Profit);
  print(w2Profit);
  print(w3Profit);
  print(w4Profit);
  print(w5Profit);
  print(w6Profit);
  print(w7Profit);
}

double getHeight(int a, int b) {
  if (a == 0) return 5;
  if (b == 0) return 5;
  if (a > b) return 100 + 50;
  return (a / b) * 100 + (a / b) * 50;
}
