import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Network({this.url});
  final String url;

  Future getdata() async {
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    if (response.statusCode != 200) {
      return response.statusCode;
    } else
      return data;
  }
}
//Uri.parse(
//         'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=e03355a3d3d1e824a1f31184dc0deb21')
