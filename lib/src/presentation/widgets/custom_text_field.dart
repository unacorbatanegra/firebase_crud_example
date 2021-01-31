import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'palette.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    @required this.controller,
    @required this.label,
    @required this.hint,
    this.validator,
    this.readOnly = false,
    this.onChanged,
    this.keyboardType,
    this.onTap,
  }) : super(key: key);
  final TextEditingController controller;
  final String label;
  final String hint;

  final bool readOnly;
  final TextInputType keyboardType;

  final String Function(String) validator;
  final ValueChanged<String> onChanged;
  final VoidCallback onTap;
  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 4.0),
        TextFormField(
          onTap: onTap,
          controller: controller,
          validator: validator,
          readOnly: readOnly,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Lato',
          ),
          decoration: InputDecoration(
            border: _border,
            focusedBorder: _border.copyWith(
              borderSide: BorderSide(
                color: Palette.accent,
              ),
            ),
            contentPadding: const EdgeInsets.all(18.0),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
