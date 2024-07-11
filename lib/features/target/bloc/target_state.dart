part of 'target_bloc.dart';

abstract class TargetState {}

class TargetInitial extends TargetState {}

class TargetLoadedState extends TargetState {
  final List<Target> targets;
  TargetLoadedState({required this.targets});
}
