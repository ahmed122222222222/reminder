import 'package:ah/core/styel.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {super.key, required this.titel, required this.action, required String title});
  final String titel, action;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          action,
          style: AppStyles.stylebold20(context).copyWith(color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              hintText: titel,
              hintStyle: AppStyles.stylesemi20(context)
                  .copyWith(fontSize: 13, color: Colors.black26)),
        ),
      ],
    );
  }
}
