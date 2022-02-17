import 'package:bmi_app/components/calculate_button.dart';
import 'package:bmi_app/components/gender.dart';
import 'package:bmi_app/components/textfield_number.dart';
import 'package:bmi_app/pages/result_page.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController heightController = TextEditingController(text: '0.0');

  TextEditingController weightController = TextEditingController(text: '0.0');
  int currentIndex = 0;
  late double hasil;
  late String kondisi;
  late Color color;
  late String info;

  @override
  Widget build(BuildContext context) {
    final double size = 170;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Text(
                "BMI Calculator",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GenderSection(
              currentIndex: currentIndex,
              onChange: (valueGender) {
                this.currentIndex = valueGender;
              },
            ),
            Column(
              children: [
                TextFieldNumber(
                  text: "Weight",
                  controller: this.weightController,
                  spress: () {
                    double valueWeight =
                        double.parse(this.weightController.text);
                    valueWeight++;
                    this.weightController.text = valueWeight.toString();
                  },
                  ppress: () {
                    double valueWeight =
                        double.parse(this.weightController.text);
                    valueWeight--;
                    this.weightController.text = valueWeight.toString();
                  },
                ),
                TextFieldNumber(
                  text: "Height",
                  controller: this.heightController,
                  spress: () {
                    double valueHeight =
                        double.parse(this.heightController.text);
                    valueHeight++;
                    this.heightController.text = valueHeight.toString();
                  },
                  ppress: () {
                    double valueHeight =
                        double.parse(this.heightController.text);
                    valueHeight--;
                    this.heightController.text = valueHeight.toString();
                  },
                ),
              ],
            ),
            CalculateButton(
              onPress: () async {
                // if (weightController.text == 0.0.toString() ||
                //     heightController.text == 0.0.toString()) {
                //   SnackBar(
                //     duration: Duration(seconds: 60),
                //     content: Text("Please fill Height and Weight section."),
                //     action: SnackBarAction(
                //       label: "dismiss",
                //       onPressed: () {},
                //     ),
                //   );
                // }

                if (this.currentIndex == 0) {
                  hasil = double.parse(weightController.text) /
                      (double.parse(heightController.text) *
                          double.parse(heightController.text));
                  if (hasil <= 18.5) {
                    kondisi = "Berat badan kurang";
                    color = Colors.amber;
                    info = "(BMI under 18.5)";
                  } else if (hasil >= 18.6 && hasil <= 22.9) {
                    kondisi = "Berat badan normal";
                    color = Colors.green;
                    info = "(BMI 18.6 to 22.9)";
                  } else if (hasil >= 23 && hasil <= 29.9) {
                    kondisi = "Berat badan berlebih (cenderung obesitas)";
                    color = Colors.amber;
                    info = "(BMI 23 to 29.9)";
                  } else if (hasil >= 30) {
                    kondisi = "Berat badan obesitas";
                    color = Colors.red;
                    info = "(BMI above 30)";
                  } else {
                    kondisi = "Berat badan belum ditentukan";
                    color = Colors.white;
                  }
                } else {
                  hasil = double.parse(weightController.text) /
                      (double.parse(heightController.text) *
                          double.parse(heightController.text));
                  if (hasil <= 18.5) {
                    kondisi = "Berat badan kurang";
                    color = Colors.amber;
                    info = "(BMI under 18.5)";
                  } else if (hasil >= 18.6 && hasil <= 25) {
                    kondisi = "Berat badan normal";
                    color = Colors.green;
                    info = "(BMI 18.6 to 25)";
                  } else if (hasil >= 25.1 && hasil <= 27) {
                    kondisi = "Berat badan berlebih (cenderung obesitas)";
                    color = Colors.amber;
                    info = "(BMI 25.1 to 27)";
                  } else if (hasil >= 28) {
                    kondisi = "Berat badan obesitas";
                    color = Colors.red;
                    info = "(BMI above 28)";
                  } else {
                    kondisi = "Berat badan belum ditentukan";
                    color = Colors.white;
                  }
                }

                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Result(
                          value: kondisi,
                          valueNumber: hasil.toStringAsFixed(1),
                          color: color,
                          valueInfo: info,
                        )));

                hasil = 0;
                this.heightController.text = 0.0.toString();
                this.weightController.text = 0.0.toString();
                currentIndex = 0;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
