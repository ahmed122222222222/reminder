import 'package:ah/core/styel.dart';
import 'package:ah/feuters/add/prsention/view/widget/durgtype.dart';
import 'package:ah/feuters/add/prsention/view/widget/info.dart';
import 'package:ah/feuters/add/prsention/view/widget/textform.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .015,
          ),
          const CustomTextFormFiled(titel: 'اسم الدواء', action: 'اسم الدواء'),
          const SizedBox(
            height: 12,
          ),
          const CustomTextFormFiled(
              titel: 'اسم الدكتور', action: 'اسم الدكتور'),
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
            style: AppStyles.stylebold20(context).copyWith(color: Colors.black),
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
                onPressed: () {},
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  "حفظ",
                  style: AppStyles.stylebold24(context)
                      .copyWith(color: Colors.white),
                ),
              ))
            ],
          )
        ],
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

  String _formatTime(TimeOfDay time) {
    // تحويل الوقت إلى تنسيق 12 ساعة
    final now = DateTime.now();
    final timeString =
        '${time.hourOfPeriod}:${time.minute.toString().padLeft(2, '0')} ${time.period == DayPeriod.am ? 'ص' : 'م'}';
    return timeString;
  }
}
