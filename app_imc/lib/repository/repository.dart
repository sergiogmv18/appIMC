import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  
  Future<void> saveLocaly({required List listOfCalculator})async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('allCalculator', json.encode(listOfCalculator));
  }

  Future<List>fetchAll()async{
    final prefs = await SharedPreferences.getInstance();
    List allValue = prefs.getString('allCalculator') != null ?  json.decode(prefs.getString('allCalculator')!): [];
    return allValue;
  }

}

