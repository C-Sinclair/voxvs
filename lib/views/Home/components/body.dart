import 'package:flutter/material.dart';
import 'package:voxvs/components/background.dart';
import 'package:voxvs/views/Home/tabs/feed.dart';
import 'package:voxvs/views/Home/tabs/friends.dart';
import 'package:voxvs/views/Home/tabs/profile.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
        logo: false,
        child: Stack(
          children: <Widget>[
            TabBarView(children: <Widget>[
              FriendsTab(),
              FeedTab(),
              ProfileTab(),
            ]),
          ],
        ));
  }
}
