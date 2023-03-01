import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  Future<Map?> getCovidData({required String country}) async {
    String myURL = "https://covid-19-tracking.p.rapidapi.com/v1/$country";
    http.Response res = await http.get(Uri.parse(myURL), headers: {
      'X-RapidAPI-Key': '9fce58a6bfmshf17ff529083cb4ep166fe8jsn46970ab2a891',
      'X-RapidAPI-Host': 'covid-19-tracking.p.rapidapi.com'
    });

    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body);
      return data;
    }
    return null;
  }
}
