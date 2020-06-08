import 'package:http/http.dart';
import 'dart:convert';
import 'stateList.dart';

class Networking {
  Future<Map> getCovidStateData(String typedValue) async {
    StateList stateList = StateList();
    int index = stateList.getTypedState(typedValue);
    print(index);

    var covid = [];
    Response response =
        await get('https://covid-india-cases.herokuapp.com/states/');
    String covidData = response.body;

    covid = jsonDecode(covidData);
    Map state = covid[index];
    return state;
  }

  Future<String> getCovidIndiaData() async {
    Response responseIN =
        await get('https://api.thevirustracker.com/free-api?countryTotal=IN');
    String indiaData = responseIN.body;
    return (indiaData);
  }
}
