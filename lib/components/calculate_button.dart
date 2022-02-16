import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(top: 130),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                onPress();
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 20),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: Text(
                "Calculate",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
