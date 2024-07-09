part of 'money_bloc.dart';

abstract class MoneyState {}

class MoneyInitial extends MoneyState {}

class MoneysLoadedState extends MoneyState {
  final List<Money> moneys;
  MoneysLoadedState({required this.moneys});
}
