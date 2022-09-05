import 'package:clima/Location.dart';
import "package:clima/services/Networking.dart";

const apid = 'e03355a3d3d1e824a1f31184dc0deb21';
const url = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getcityweather(String cityname) async {
    var connection = Network(url: '$url?q=$cityname&appid=$apid');
    var data = await connection.getdata();
    return data;
  }

  Future<dynamic> getwearther() async {
    var getloc = Location();
    await getloc.getLocation();
    var connection = Network(
        url: '$url?lat=${getloc.latitude}&lon=${getloc.longitude}&appid=$apid');
    var data = await connection.getdata();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
