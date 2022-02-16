import 'package:flutter/material.dart';

import 'body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          iconSize: 30,
          padding: EdgeInsets.all(20),
          icon: Icon(Icons.list),
          onPressed: () {},
        ),
        actions: [
          Container(
              child: IconButton(
            iconSize: 30,
            padding: EdgeInsets.all(20),
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )),
        ],
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Body(),
    );
  }
}
