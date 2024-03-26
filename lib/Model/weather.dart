import 'package:http/http.dart';
import 'dart:convert';

class Weather {
  String? temp;
  String? feelsLike;
  String? humidity;
  String? airSpeed;
  String? gusts;
  String? vision;
  String? pressure;
  String? description;
  String? main;
  String? location;
  Weather({this.location}) {
    location = this.location;
  }

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=08254747178369022343901b42e11f8e'));
      Map data = jsonDecode(response.body);
      //temperature ,humidity, wind speed
      Map tempData = data["main"];
      int getTemp = (tempData['temp'] - 273.15).round();
      double vis = data['visibility'] / 1000;
      Map wind = data['wind'];
      int getAirSpeed = (wind['speed'] * 3.6).round();
      int getGusts = (wind['gust'] * 3.6).round();
      int getHumidity = tempData['humidity'];
      int getfeelsLike = (tempData['feels_like'] - 273.15).round();
      int getVisible = vis.toInt();
      int getPress = tempData['pressure'];

      //getting description
      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getMainDes = weatherMainData['main'];
      String getDesc = weatherMainData['description'];

      //assigning values
      temp = getTemp.toString();
      feelsLike = getfeelsLike.toString();
      humidity = getHumidity.toString();
      airSpeed = getAirSpeed.toString();
      gusts = getGusts.toString();
      vision = getVisible.toString();
      description = getDesc;
      main = getMainDes;
      pressure = getPress.toString();
    } catch (e) {
      temp = "--";
      feelsLike = "--";
      humidity = "--";
      airSpeed = "--";
      gusts = "--";
      vision = "--";
      pressure = "--";
      description = "--";
      main = "--";
    }
  }
}
