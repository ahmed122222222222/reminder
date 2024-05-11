import 'package:ah/feuters/add/data/modeladdd.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:meta/meta.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitial());
  void AddAlamrim (Addmodel addmodel)
{
  emit(Addload());
  try {
  var box =Hive.box<Addmodel>("alarim");
  box.add(addmodel);
  emit(Addsucess());
} on Exception catch (e) {
  // TODO
  emit(AddInfailuer(errmas: e.toString()));
}
 
}  
}
