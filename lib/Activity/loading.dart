import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tempest/Model/weather.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? temp;
  String? feelLike;
  String? hum;
  String? airSpeed;
  String? gusts;
  String? visibility;
  String? pressure;
  String? des;
  String? main;
  String city = "Digboi";

  void startApp(String city) async {
    Weather instance = Weather(location: city);
    await instance.getData();
    temp = instance.temp.toString();
    feelLike = instance.feelsLike.toString();
    hum = instance.humidity.toString();
    airSpeed = instance.airSpeed.toString();
    gusts = instance.gusts.toString();
    visibility = instance.vision.toString();
    pressure = instance.pressure.toString();
    des = instance.description.toString();
    main = instance.main;
    //city = instance.location.toString();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "feels_like": feelLike,
        "hum_value": hum,
        "air_speed": airSpeed,
        "gust": gusts,
        "visibility": visibility,
        "pressure": pressure,
        "des_value": des,
        "main_value": main,
        "City": city
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if (search?.isNotEmpty ?? false) {
      city = search!['searchText'];
    }
    startApp(city.toString());
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent[100],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 80,
                ),
                Image.asset(
                  'assets/AppIcon.png',
                  height: 280,
                  width: 200,
                ),
                Lottie.asset('assets/Loadingf.json'),
                const SizedBox(
                  height: 120,
                ),
                const Text(
                  "Tempest",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Made by Sahil",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const Text(
                  "Data Provided by openweathermap",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )
              ],
            ),
          ),
        ));
  }
}
