part of 'get_cubit.dart';

@immutable
sealed class GetState {}

final class GetInitial extends GetState {}
final class Getload extends GetState {}
final class Getsucess extends GetState {
  final List<Addmodel>alarim;

  Getsucess({required this.alarim}); 
}
final class Getfauiler extends GetState {
  final String errmass;

  Getfauiler({required this.errmass}); 
}
