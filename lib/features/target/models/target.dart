import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class Target {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String target;

  Target({
    required this.id,
    required this.target,
  });
}

class TargetAdapter extends TypeAdapter<Target> {
  @override
  final typeId = 1;

  @override
  Target read(BinaryReader reader) {
    return Target(
      id: reader.read(),
      target: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Target obj) {
    writer.write(obj.id);
    writer.write(obj.target);
  }
}
