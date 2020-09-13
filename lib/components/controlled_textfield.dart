import 'package:flutter/material.dart';
import 'package:voxvs/components/textfield_container.dart';
import 'package:voxvs/constants.dart';

class ControlledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool password;
  final IconData icon;
  final String Function(String) validator;

  const ControlledTextField(
      {Key key,
      @required this.controller,
      @required this.labelText,
      this.validator,
      this.hintText,
      this.password = false,
      this.icon = Icons.person})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        icon: Icon(icon, color: Colours.primary),
        border: InputBorder.none,
        suffixIcon:
            password ? Icon(Icons.visibility, color: Colours.primary) : null,
      ),
      validator: validator,
      obscureText: password,
    ));
  }
}
