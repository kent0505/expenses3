part of 'target_bloc.dart';

abstract class TargetEvent {}

class GetTargetsEvent extends TargetEvent {}

class AddTargetEvent extends TargetEvent {
  final Target target;
  AddTargetEvent({required this.target});
}

class EditTargetEvent extends TargetEvent {
  final Target target;
  EditTargetEvent({required this.target});
}

class DeleteTargetEvent extends TargetEvent {
  final int id;
  DeleteTargetEvent({required this.id});
}
