import 'package:flutter/material.dart';
import 'package:mithra/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator; // Add this line

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.controller,
    this.validator, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField( // Changed from TextField to TextFormField
        controller: controller,
        onChanged: onChanged,
        validator: validator, // Add this line
        decoration: const InputDecoration(
          
          hintText: "Password",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
