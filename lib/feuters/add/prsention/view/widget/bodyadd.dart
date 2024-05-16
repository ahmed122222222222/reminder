

import 'package:ah/core/local_noif.dart';
import 'package:ah/core/styel.dart';
import 'package:ah/feuters/add/data/modeladdd.dart';
import 'package:ah/feuters/add/prsention/manager/cubit/add_cubit.dart';
import 'package:ah/feuters/add/prsention/view/widget/durgtype.dart';
import 'package:ah/feuters/add/prsention/view/widget/info.dart';
import 'package:ah/feuters/add/prsention/view/widget/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timezone/timezone.dart' as tz;

class Bodyadd extends StatefulWidget {
  const Bodyadd({Key? key}) : super(key: key);

  @override
  _BodyaddState createState() => _BodyaddState();
}

class _BodyaddState extends State<Bodyadd> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
  }

  String vule1 = "", value2 = "";
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            CustomTextFormFiled(
              
              titel: 'اسم الدواء',
              action: 'اسم الدواء',
              title: '',
              onSaved: (v) {
                setState(() {
                  vule1 = v!;
                });
              },
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextFormFiled(
              titel: 'اسم الدكتور',
              action: 'اسم الدكتور',
              title: '',
              onSaved: (v) {
                setState(() {
                  value2 = v!;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const InfoTake(),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  "وقت البدايه",
                  style: AppStyles.stylebold20(context)
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.access_time),
                        const SizedBox(width: 8),
                        Text(
                          // ignore: unnecessary_string_interpolations
                          '${_formatTime(_selectedTime)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 40, color: Colors.blue),
            Text(
              "نوع الدواء",
              style:
                  AppStyles.stylebold20(context).copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            const Typedurg(),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
 
                        globalKey.currentState!.save();
                        
                        LocalNotification.scheduleDailyRepeatingNotification(
                            _formatTime(_selectedTime,));
                        BlocProvider.of<AddCubit>(context).AddAlamrim(Addmodel(
                            docname: vule1, durgname: value2, hours: "2"));
                        Navigator.pop(context);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(
                      "حفظ",
                      style: AppStyles.stylebold24(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(alwaysUse24HourFormat: false), // تحديد تنسيق 12 ساعة
          child: child!,
        );
      },
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  tz.TZDateTime _formatTime(TimeOfDay time) {
    // Get the current date to create a complete DateTime object
    final now = DateTime.now();

    // Construct a DateTime object with the same date but with the selected time
    final selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    // Convert the selectedDateTime to a TZDateTime object in the local timezone
    final tzDateTime = tz.TZDateTime.local(
      selectedDateTime.year,
      selectedDateTime.month,
      selectedDateTime.day,
      selectedDateTime.hour,
      selectedDateTime.minute,
    );

    return tzDateTime;
  }
}
