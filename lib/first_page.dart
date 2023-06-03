import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/constant.dart';
import 'package:weather/container.dart';
import 'package:http/http.dart' as http;
import 'package:weather/model/weather_model.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  void initState() {
    fetch();
    formatDateandDay();
    super.initState();
  }

  String? _setImage() {
    String _title = "${weather_model!.des}";

    if (_title == "clear sky") {
      return "images/sorj.gif";
    } else if (_title == "overcast clouds") {
      return "images/sun.png";
    } else if (_title == "rain") {
      return "images/mono.gif";
    } else if (_title == "scattered clouds") {
      return "images/scat.png";
    } else if (_title == "broken clouds") {
      return "images/bro.png";
    } else if (_title == "light snow") {
      return "images/sno.png";
    } else {
      return 'images/hze.gif';
    }
  }

  String countryValue = '';
  String stateValue = '';
  String cityValue = '';
  String city = "";

  WeatherModel? weather_model;

  String day = '';

  formatDateandDay() {
    var now = DateTime.now();
    var formattor = DateFormat.EEEE();
    day = formattor.format(now);
    setState(() {
      day = formattor.format(now);
    });
  }

  void fetch() async {
    if (cityValue == "") {
      cityValue = 'sahiwal';
    }
    Uri uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityValue&units=metric&appid=e5499c23868b8e115d6cb390a9f5f5aa");
    var res = await http.get(uri);
    var decodebody = json.decode(res.body);
    setState(() {
      weather_model = WeatherModel.fromJson(decodebody);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a1a4e),
      appBar: AppBar(
        backgroundColor: Color(0xff1a1a4e),
        elevation: 0,
        title: Center(
          child: Text(
            'WeatherForecast',
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.power_settings_new,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext) => AlertDialog(
                  scrollable: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  title: Text('Choose Location'),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  backgroundColor: Colors.white,
                  content: SelectState(
                    dropdownColor: Colors.white,
                    style: TextStyle(fontSize: 12),
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        stateValue = value;
                      });
                    },
                    onCityChanged: (value) {
                      setState(() {
                        cityValue = value;
                      });
                    },
                  ),
                  buttonPadding: EdgeInsets.only(right: 30),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        city = cityValue;
                        fetch();
                        Navigator.pop(context);
                      },
                      child: Text('Done'),
                      color: Color(0xfff5d057),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.location_on,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: weather_model != null
          ? Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 270,
                    width: 335,
                    decoration: BoxDecoration(
                      color: Color(0xff1a1a3e),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              day,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Text(
                              new DateFormat.jm().format(DateTime.now()),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "${weather_model!.temp}",
                              style: TextStyle(
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              " \u00B0C",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xfff5d057)),
                            ),
                            SizedBox(
                              width: 43,
                            ),
                            Image.asset(
                              _setImage().toString(),
                              height: 120,
                              width: 115,
                            ),
                          ],
                        ),
                        Text(
                          '${weather_model!.des}',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.location_on_outlined,
                              color: Color(0xfff5d057),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "$cityValue $stateValue$countryValue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Air Pressure: ${weather_model!.pressure}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Humidity: ${weather_model!.humidity}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Today",
                      style: TextStyle(fontSize: 18, color: Color(0xfff5d057)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Tomorow",
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Next 7 Days",
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       SizedBox(
                //         width: 20,
                //       ),
                //       Cont(name: '10 AM', num: 18, image: 'images/cloud.png'),
                //       SizedBox(
                //         width: 14,
                //       ),
                //       Cont(name: '11 AM', num: 20, image: 'images/rain.png'),
                //       SizedBox(
                //         width: 14,
                //       ),
                //       Cont(name: '12 PM', num: 22, image: 'images/sun.png'),
                //       SizedBox(
                //         width: 14,
                //       ),
                //       Cont(name: '1 PM', num: 24, image: 'images/sun.png'),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: 20,
                //     ),
                //     Text(
                //       'Chance of rain',
                //       style: TextStyle(fontSize: 22, color: Colors.white),
                //     ),
                //   ],
                // ),
                // Image.asset(
                //   'images/grq.png',
                //   color: Color(0xfff5d057),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Text(
                //       '10 AM',
                //       style: TextStyle(color: Colors.white30),
                //     ),
                //     Text(
                //       '11 AM',
                //       style: TextStyle(color: Colors.white30),
                //     ),
                //     Text(
                //       '12 PM',
                //       style: TextStyle(color: Colors.white30),
                //     ),
                //     Text(
                //       '1 PM',
                //       style: TextStyle(color: Colors.white30),
                //     ),
                //     Text(
                //       '2 PM',
                //       style: TextStyle(color: Colors.white30),
                //     ),
                //     Text(
                //       '2 PM',
                //       style: TextStyle(color: Colors.white30),
                //     ),
                //   ],
                // ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
