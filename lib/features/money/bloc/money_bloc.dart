import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../models/money.dart';
import '../service/money_service.dart';

part 'money_event.dart';
part 'money_state.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  final _service = MoneyService();
  List<Money> _moneys = [];

  MoneyBloc() : super(MoneyInitial()) {
    on<GetMoneysEvent>((event, emit) async {
      if (_service.moneys.isEmpty) {
        _moneys = await _service.getMoneys();
        mymoneys = _moneys;
        calculateMonthExpenses();
        await checkAchievements();
        emit(MoneysLoadedState(moneys: _moneys));
      } else {
        mymoneys = _moneys;
        emit(MoneysLoadedState(moneys: _moneys));
      }
    });

    on<AddMoneyEvent>((event, emit) async {
      if (event.money.important) {
        _service.moneys.insert(0, event.money);
      } else {
        _service.moneys.add(event.money);
      }
      _moneys = await _service.updateMoneys();
      mymoneys = _moneys;
      calculateMonthExpenses();
      await checkAchievements();
      emit(MoneysLoadedState(moneys: _moneys));
    });

    on<EditMoneyEvent>((event, emit) async {
      for (Money money in _service.moneys) {
        if (money.id == event.money.id) {
          if (event.money.important && !money.important) {
            _service.moneys.removeWhere(
              (element) => element.id == event.money.id,
            );
            _service.moneys.insert(0, event.money);
          }
          money.title = event.money.title;
          money.category = event.money.category;
          money.currency = event.money.currency;
          money.amount = event.money.amount;
          money.important = event.money.important;
        }
      }

      _moneys = await _service.updateMoneys();
      mymoneys = _moneys;
      calculateMonthExpenses();
      emit(MoneysLoadedState(moneys: _moneys));
    });

    on<DeleteMoneyEvent>((event, emit) async {
      _service.moneys.removeWhere((element) => element.id == event.id);
      _moneys = await _service.updateMoneys();
      mymoneys = _moneys;
      calculateMonthExpenses();
      emit(MoneysLoadedState(moneys: _moneys));
    });
  }
}
