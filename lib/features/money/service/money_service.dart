import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import '../models/money.dart';

class MoneyService {
  List<Money> moneys = [];

  Future<List<Money>> getMoneys() async {
    final box = await Hive.openBox('moneybox');
    List moneys2 = box.get('moneys') ?? [];
    moneys = moneys2.cast<Money>();
    log(moneys.length.toString());
    return moneys;
  }

  Future<List<Money>> updateMoneys() async {
    final box = await Hive.openBox('moneybox');
    box.put('moneys', moneys);
    moneys = await box.get('moneys');
    return moneys;
  }
}
