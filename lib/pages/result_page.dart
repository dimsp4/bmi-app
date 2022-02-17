import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key,
      required this.value,
      required this.valueNumber,
      required this.color,
      required this.valueInfo})
      : super(key: key);

  final String value;
  final String valueNumber;
  final String valueInfo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 310,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Result",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: color,
                          size: 90,
                        ),
                        Text(
                          valueNumber,
                          style: TextStyle(
                              fontSize: 30,
                              color: color,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          value,
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        Text(
                          valueInfo,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 20),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                        child: Text("Recalculate")),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
