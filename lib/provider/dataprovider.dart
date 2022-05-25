import 'package:api_project/Api/API.dart';
import 'package:api_project/Models/datamodel.dart';
import 'package:flutter/cupertino.dart';


class CatogryProvider with ChangeNotifier {
  bool isLoading = true;
  List<Data> catogrys = [];

  CatogryProvider() {
    fetchdata();
  }

  void fetchdata() async {
    List<dynamic> _catogrys = await API.getdata();

    List<Data> temp = [];
    for (var catogry in _catogrys) {
      Data newCatogry = Data.fromJson(catogry);

      temp.add(newCatogry);
    }
    catogrys = temp;
    isLoading = false;
    notifyListeners();

    // Timer(const Duration(seconds: 3), () {
    //   fetchdata();
    //   print("Data Updated");
    // });
  }
}