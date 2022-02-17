import 'package:flutter/material.dart';

import 'body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            iconSize: 30,
            padding: EdgeInsets.all(20),
            icon: Icon(Icons.help),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Body(),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              height: 150,
              color: Colors.red,
              child: Text(
                "Menu",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
