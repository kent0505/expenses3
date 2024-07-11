import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/target.dart';
import '../service/target_service.dart';

part 'target_event.dart';
part 'target_state.dart';

class TargetBloc extends Bloc<TargetEvent, TargetState> {
  final _service = TargetService();
  List<Target> _targets = [];

  TargetBloc() : super(TargetInitial()) {
    on<GetTargetsEvent>((event, emit) async {
      if (_service.targets.isEmpty) {
        _targets = await _service.getTargets();

        emit(TargetLoadedState(targets: _targets));
      } else {
        emit(TargetLoadedState(targets: _targets));
      }
    });

    on<AddTargetEvent>((event, emit) async {
      _service.targets.add(event.target);
      _targets = await _service.updateTargets();

      emit(TargetLoadedState(targets: _targets));
    });

    on<EditTargetEvent>((event, emit) async {
      for (Target target in _service.targets) {
        if (target.id == event.target.id) {
          target.target = event.target.target;
        }
      }
      _targets = await _service.updateTargets();

      emit(TargetLoadedState(targets: _targets));
    });

    on<DeleteTargetEvent>((event, emit) async {
      _service.targets.removeWhere((element) => element.id == event.id);
      _targets = await _service.updateTargets();
      emit(TargetLoadedState(targets: _targets));
    });
  }
}
