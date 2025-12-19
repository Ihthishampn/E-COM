import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final bool obst;
  final String hint;
  final String label;
  final TextEditingController controller;
  const CustomTextfield({
    super.key,
    required this.hint,
    required this.label,
    this.obst = false,
    required this.controller, 
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 21, left: 21),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obst,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          label: Text(label),
          labelStyle: TextStyle(fontSize: 14),
          hint: Text(hint),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: const Color.fromARGB(154, 203, 206, 209),
        ),
      ),
    );
  }
}
