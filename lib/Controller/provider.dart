import 'package:e_commerce_app/Controller/constant.dart';
import 'package:e_commerce_app/Model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DataProvider extends ChangeNotifier {
  late Welcome data;
  ProviderStatus status = ProviderStatus.LOADING;
  fetchQuestion() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    print(response.toString());
    if (response.statusCode == 200) {
      data = welcomeFromJson(response.body);
      status = ProviderStatus.COMPLETED;
      // return welcomeFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
    notifyListeners();
  }
}
