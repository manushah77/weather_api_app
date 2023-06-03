import 'package:flutter/material.dart';

class Cont extends StatelessWidget {
  const Cont({required this.image, required this.name, required this.num});

  final image;
  final String name;
  final int num;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        color: Color(0xff1a1a3e),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            image,
            height: 70,
            width: 70,
          ),
          Row(
            children: [
              SizedBox(
                width: 9,
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 9,
              ),
              Text(
                "${num}\u00B0 C",
                style: TextStyle(fontSize: 21, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
