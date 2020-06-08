import 'package:CovidCases/services/networking.dart';
import 'dart:convert';

class ExtractData {
  var totalCases, deaths, recovery;
  var totalStateCases, stateDeaths, stateRecovery, state;

  Future extractIndiaData() async {
    Networking networking = Networking();
    String indiaData = await networking.getCovidIndiaData();

    totalCases = jsonDecode(indiaData)['countrydata'][0]['total_cases'];
    recovery = jsonDecode(indiaData)['countrydata'][0]['total_recovered'];
    deaths = jsonDecode(indiaData)['countrydata'][0]['total_deaths'];
  }

  Future extractStateData(String typedValue) async {
    Networking networking = Networking();
    Map stateData = await networking.getCovidStateData(typedValue);
    print(stateData);
    totalStateCases = stateData["noOfCases"];
    stateDeaths = stateData["deaths"];
    stateRecovery = stateData["cured"];
    state = stateData["state"];
  }
}
