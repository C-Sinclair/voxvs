import 'package:flutter/material.dart';
import 'package:voxvs/components/logo.dart';
import 'components/body.dart';
import 'components/tab.dart';

const List<HomeTab> homeTabs = <HomeTab>[
  HomeTab(icon: Icons.ac_unit),
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: homeTabs.length,
        child: Scaffold(
          body: Body(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Logo(width: 100),
            backgroundColor: Colors.transparent,
            bottom: TabBar(
              tabs: <Widget>[
                HomeTab(icon: Icons.people_alt_outlined),
              ],
            ),
          ),
        ));
  }
}
