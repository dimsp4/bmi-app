import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.value, required this.valueNumber})
      : super(key: key);

  final String value;
  final String valueNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(valueNumber),
            Text(value),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Recalculate"))
          ],
        ),
      ),
    );
  }
}
