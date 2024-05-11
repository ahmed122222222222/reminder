part of 'add_cubit.dart';

@immutable
sealed class AddState {}

final class AddInitial extends AddState {}
final class Addload extends AddState {}
final class Addsucess extends AddState {}
final class AddInfailuer extends AddState {
  final String errmas;

  AddInfailuer({required this.errmas});
}
