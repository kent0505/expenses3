import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import '../models/target.dart';

class TargetService {
  List<Target> targets = [];

  Future<List<Target>> getTargets() async {
    final box = await Hive.openBox('targetbox');
    List targets2 = box.get('targets') ?? [];
    targets = targets2.cast<Target>();
    log(targets.length.toString());
    return targets;
  }

  Future<List<Target>> updateTargets() async {
    final box = await Hive.openBox('targetbox');
    box.put('targets', targets);
    targets = await box.get('targets');
    return targets;
  }
}
