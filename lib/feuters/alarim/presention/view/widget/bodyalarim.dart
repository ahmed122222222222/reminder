import 'package:ah/feuters/alarim/presention/manager/cubit/get_cubit.dart';
import 'package:ah/feuters/alarim/presention/view/widget/bodylistview.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bodalarim extends StatefulWidget {
  const Bodalarim({super.key});

  @override
  State<Bodalarim> createState() => _BodalarimState();
}

class _BodalarimState extends State<Bodalarim> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetCubit>(context).fetchDataFromHive("alarim");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCubit, GetState>(
      builder: (context, state) {
       if(state is Getsucess) {
        
        return ListView.builder(
          itemCount: state.alarim.length,
          itemBuilder: (context, index) =>  Padding(
            padding:const EdgeInsets.all(8.0),
            child: Bodylistview(addmodel: state.alarim[index],),
          ),
        );}
        else {
          return Text("data");
        }
      },
    );
  }
}
