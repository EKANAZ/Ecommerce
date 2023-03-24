import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import '../models/api_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ProviderStatus { loding, complted }

class ProviderPage extends ChangeNotifier {
  late Welcome data;
  ProviderStatus status = ProviderStatus.loding;

  fetchAlbum() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      data = welcomeFromJson(response.body);
      status = ProviderStatus.complted;
      // return welcomeFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
    notifyListeners();
  }

//save to cart
  late SharedPreferences _prefs;

  loadData() async {
    _prefs = await SharedPreferences.getInstance();
    List<String>? stringNumbers = _prefs.getStringList('numbers');
    if (stringNumbers != null) {
      List<int> numbers =
          stringNumbers.map((stringNumber) => int.parse(stringNumber)).toList();

      shoppingsample = numbers;
    }
  }

  @override
  notifyListeners();
  List<int> shoppingsample = [];
  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringNumbers = shoppingsample
        .map((shoppingsample) => shoppingsample.toString())
        .toList();
    await prefs.setStringList('numbers', stringNumbers);
  }

  Future<void> removeItem(int index) async {
    shoppingsample.removeAt(index);
    await saveData();
  }

//save to favourite
  List<int> favlist = [];

  favloadData() async {
    _prefs = await SharedPreferences.getInstance();
    List<String>? stringNumbers = _prefs.getStringList('number');
    if (stringNumbers != null) {
      List<int> number =
          stringNumbers.map((stringNumber) => int.parse(stringNumber)).toList();

      favlist = number;
    }
  }

  Future<void> favsaveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringNumbers =
        favlist.map((favlist) => favlist.toString()).toList();
    await prefs.setStringList('number', stringNumbers);
  }

  Future<void> favremoveItem(int index) async {
    favlist.removeAt(index);
    await saveData();
  }
}
