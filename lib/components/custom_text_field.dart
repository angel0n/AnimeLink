import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  State<CustomTextFormField> createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.search),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        contentPadding: const EdgeInsets.fromLTRB(13, 10, 10, 0),
      ),
    );
  }
}
