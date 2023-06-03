import 'package:flutter/material.dart';
import 'package:weather/first_page.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a1a4e),
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Center(
            child: Image.asset('images/gif.gif'),
          ),
          Row(
            children: [
              SizedBox(
                width: 90,
              ),
              Text(
                'Weather',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              SizedBox(width: 7),
              Text(
                'NEWS',
                style: TextStyle(fontSize: 28, color: Color(0xfff5d057)),
              )
            ],
          ),
          Text(
            '& Feeds',
            style: TextStyle(
              fontSize: 28,
              color: Color(0xfff5d057),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              'FIRST WEATHER APP THAT DONT TELL YOU ACURACY OF WEATHER. ONLY WEATHER IS CAHNGED BY GOD. WE ARE JUST PREDICTOR. WE DONT GIVE ACURATE AND CORRECT WEATHER ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.white30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => First()),
              );
            },
            color: Color(0xfff5d057),
            minWidth: 290,
            height: 60,
            child: Text('Get Start'),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          )
        ],
      ),
    );
  }
}
