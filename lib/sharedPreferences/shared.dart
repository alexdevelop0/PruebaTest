 
 
 
 import 'dart:convert';

import 'package:pruebaTest/data/models/HistorySearch.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
 
 Future setDataScan(List<HistoryItem> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   print("prueba56: "+list.toString());
   // String value = json.encode(listScan);
  //print("prueba56: "+value.toString());
  String json = jsonEncode(list);
    prefs.setString("listhistory", json);
  }

    Future<List<HistoryItem>> getDataUser() async {
    //  try{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString("listhistory");

  List valuedata = jsonDecode(value.toString());
          print("prueba60: "+valuedata.toString());
           List<HistoryItem> dataHistory = [];
for (var i = 0; i < valuedata.length; i++){

        HistoryItem dataUser = HistoryItem.fromJson(valuedata[i]);
dataHistory.add(dataUser);
}
  
            
    return dataHistory;
     /* }catch(e){
        print("error: "+e.toString());
        return null;
      }*/
  }
 }