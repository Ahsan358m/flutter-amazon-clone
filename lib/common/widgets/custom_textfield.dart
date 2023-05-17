// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final bool obsecureText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.label,
    required this.obsecureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(label),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
      validator: (val) {},
    );
  }
}
