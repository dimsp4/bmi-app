import 'package:flutter/material.dart';

class GenderSection extends StatefulWidget {
  GenderSection({
    Key? key,
    required this.currentIndex,
    required this.onChange,
  }) : super(key: key);

  int currentIndex;
  Function(int) onChange;

  @override
  State<GenderSection> createState() => _GenderSectionState();
}

class _GenderSectionState extends State<GenderSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gender",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: [
                GenderBox(
                  icon: Icons.male,
                  text: 'Male',
                  index: 0,
                  press: (index) {
                    widget.currentIndex = index;
                    this.widget.onChange(index);
                    setState(() {});
                  },
                  currentIndex: widget.currentIndex,
                ),
                SizedBox(
                  width: 20,
                ),
                GenderBox(
                  icon: Icons.female,
                  text: 'Female',
                  index: 1,
                  press: (index) {
                    widget.currentIndex = index;
                    this.widget.onChange(index);
                    setState(() {});
                  },
                  currentIndex: widget.currentIndex,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GenderBox extends StatefulWidget {
  const GenderBox({
    Key? key,
    required this.icon,
    required this.text,
    required this.index,
    required this.currentIndex,
    required this.press,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Function(int) press;
  final int index;
  final int currentIndex;

  @override
  State<GenderBox> createState() => _GenderBoxState();
}

class _GenderBoxState extends State<GenderBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.press(widget.index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: widget.currentIndex == widget.index
              ? Border.all(color: Colors.green, width: 5)
              : Border.all(
                  color: Colors.transparent,
                ),
          color: Colors.white.withOpacity(0.2),
        ),
        height: 165,
        width: 165,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 100,
              color: Colors.white,
            ),
            Text(
              widget.text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
