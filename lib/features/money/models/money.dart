import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Money {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String category;
  @HiveField(3)
  String currency;
  @HiveField(4)
  int amount;
  @HiveField(5)
  bool profit;
  @HiveField(6)
  bool important;

  Money({
    required this.id,
    required this.title,
    required this.category,
    required this.currency,
    required this.amount,
    required this.profit,
    required this.important,
  });
}

class MoneyAdapter extends TypeAdapter<Money> {
  @override
  final typeId = 0;

  @override
  Money read(BinaryReader reader) {
    return Money(
      id: reader.read(),
      title: reader.read(),
      category: reader.read(),
      currency: reader.read(),
      amount: reader.read(),
      profit: reader.read(),
      important: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Money obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.category);
    writer.write(obj.currency);
    writer.write(obj.amount);
    writer.write(obj.profit);
    writer.write(obj.important);
  }
}
