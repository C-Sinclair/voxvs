import 'package:flutter/material.dart';
import 'package:voxvs/components/logo.dart';
import 'package:voxvs/views/Home/bloc_provider.dart';
import 'package:voxvs/views/Home/components/record_button.dart';
import 'components/body.dart';
import 'components/tab.dart';

const List<HomeTab> homeTabs = <HomeTab>[
  HomeTab(icon: Icons.people_alt_outlined),
  HomeTab(icon: Icons.music_off_outlined),
  HomeTab(icon: Icons.accessibility_new_outlined),
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeProvider(DefaultTabController(
        length: homeTabs.length,
        child: Scaffold(
            body: Body(),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Logo(width: 100),
              backgroundColor: Colors.transparent,
              bottom: TabBar(
                tabs: homeTabs,
              ),
            ),
            floatingActionButton: RecordButton())));
  }
}
