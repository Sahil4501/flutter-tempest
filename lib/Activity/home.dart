import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cityName = [
      'Baksa',
      'Barpeta',
      'Bongaigaon',
      'Cachar',
      'Chirang',
      'Darrang',
      'Dhemaji',
      'Dima Hasao',
      'Dhubri',
      'Dibrugarh',
      'Goalpara',
      'Golaghat',
      'Hailakandi',
      'Jorhat',
      'Kamrup',
      'Kamrup Metropolitan',
      'Karbi Anglong',
      'Karimganj',
      'Kokrajhar',
      'Lakhimpur',
      'Marigaon',
      'Nagaon',
      'Nalbari',
      'Sibsagar',
      'Sonitpur',
      'Tinsukia',
      'Udalguri'
    ];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    String temperature = info['temp_value'].toString();
    String feelLike = info['feels_like'].toString();
    String hum = info['hum_value'].toString();
    String airSpeed = info['air_speed'].toString();
    String gusts = info['gust'].toString();
    String visibility = info['visibility'].toString();
    String pressure = info['pressure'].toString();
    String des = info['des_value'];
    String main = info['main_value'];
    String getcity = info['City'];

    String weatherAnimation(String? maincondition) {
      if (maincondition == null) return 'assets/Sunny.json';
      switch (maincondition.toLowerCase()) {
        case 'clouds':
        case 'mist':
        case 'smoke':
        case 'haze':
        case 'dust':
        case 'fog':
          return 'assets/Cloudy.json';
        case 'rain':
        case 'drizzle':
        case 'shower rain':
          return 'assets/Rainy.json';
        case 'thuderstorm':
          return 'assets/Thunder.json';
        case 'clear':
          return 'assets/Sunny.json';
        default:
          return 'assets/Sunny.json';
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.lightBlueAccent,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      Colors.lightBlueAccent,
                      Color.fromARGB(255, 152, 222, 255)
                    ])),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white54),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if ((searchController.text)
                                        .replaceAll(" ", "") ==
                                    "") {
                                  print("Blank Search");
                                } else {
                                  Navigator.pushReplacementNamed(
                                      context, '/loading',
                                      arguments: {
                                        "searchText":
                                            searchController.text as String?,
                                      });
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.search),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: searchController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search City ' $city '",
                                    hintStyle: const TextStyle(fontSize: 17)),
                              ),
                            )
                          ],
                        )),
                    Column(children: [
                      Text(
                        getcity,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Container(
                        child: Lottie.asset(weatherAnimation(main),
                            height: 150, width: 150),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$temperature \u00b0C",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        des,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white.withOpacity(0.3)),
                              margin: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                              padding: const EdgeInsets.all(50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Feels Like",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        WeatherIcons.thermometer,
                                        size: 30,
                                        color: Colors.white60,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "$feelLike \u00b0C",
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white.withOpacity(0.3)),
                              margin: const EdgeInsets.fromLTRB(5, 0, 20, 0),
                              padding: const EdgeInsets.all(50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Visibility',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.visibility,
                                        size: 30,
                                        color: Colors.white60,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "$visibility KM",
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white.withOpacity(0.3)),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.all(50),
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      WeatherIcons.day_windy,
                                      color: Colors.white60,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          airSpeed,
                                          style: const TextStyle(
                                              fontSize: 50,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Column(
                                          children: [
                                            Text(
                                              "Wind",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "Kmh",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white60),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.white54,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          gusts,
                                          style: const TextStyle(
                                              fontSize: 50,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Column(
                                          children: [
                                            Text(
                                              "Gusts",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "Kmh",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white60),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white.withOpacity(0.3)),
                              margin: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                              padding: const EdgeInsets.all(50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Humidity',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        WeatherIcons.night_cloudy_windy,
                                        size: 30,
                                        color: Colors.white60,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "$hum %",
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white.withOpacity(0.3)),
                              margin: const EdgeInsets.fromLTRB(5, 0, 20, 0),
                              padding: const EdgeInsets.all(50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Pressure',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.speed,
                                        size: 30,
                                        color: Colors.white60,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$pressure hPa',
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 30,
                    ),
                    const Column(
                      children: [
                        Text(
                          "Made by Sahil",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          "Data Provided by Openweathermap",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ))),
      ),
    );
  }
}
