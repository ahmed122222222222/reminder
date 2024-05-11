import 'package:ah/feuters/add/data/modeladdd.dart';
import 'package:ah/feuters/add/prsention/manager/cubit/add_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'get_state.dart';

class GetCubit extends Cubit<GetState> {
  GetCubit() : super(GetInitial());
  void fetchDataFromHive(String boxName) async {
    emit(Getload());
  // Open the Hive box
  try {
  final box = await Hive.openBox<Addmodel>(boxName);
  
  // Fetch all instances of Addmodel from the box
  final List<Addmodel> dataList = box.values.toList();
     
  // Close the box after fetching data
  
  emit(Getsucess(alarim: dataList));
} on Exception catch (e) {
  // TODO
  emit(Getfauiler(errmass: e.toString()));
}

}


}
