import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'alarimtoday_state.dart';

class AlarimtodayCubit extends Cubit<AlarimtodayState> {
  AlarimtodayCubit() : super(AlarimtodayInitial());
}
