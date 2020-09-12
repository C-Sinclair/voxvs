import 'package:flutter/material.dart';
import 'package:voxvs/components/textfield_container.dart';
import 'package:voxvs/constants.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool password;

  const RoundedTextField({
    Key key,
    this.icon = Icons.person,
    this.hintText,
    this.onChanged,
    this.password = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        icon: Icon(icon, color: Colours.primary),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        suffixIcon:
            password ? Icon(Icons.visibility, color: Colours.primary) : null,
      ),
      obscureText: password,
    ));
  }
}
