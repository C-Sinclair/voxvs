import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  final IconData icon;
  const HomeTab({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
