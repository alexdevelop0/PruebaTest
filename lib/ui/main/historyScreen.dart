import 'dart:async';


import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pruebaTest/data/models/HistorySearch.dart';
import 'package:pruebaTest/data/models/RestaurantModel.dart';
import 'package:pruebaTest/data/models/UserModel2.dart';
import 'package:pruebaTest/data/networking/api.dart';
import 'package:pruebaTest/generated/l10n.dart';


import 'package:pruebaTest/app/app_constants.dart';
import 'package:pruebaTest/redux2/app/app_state.dart';
import 'package:pruebaTest/redux2/settingApp/settingsHomeActions.dart';
import 'package:pruebaTest/redux2/settingApp/store.dart';
import 'package:pruebaTest/redux2/store.dart';
import 'package:pruebaTest/routes/assets_routes.dart';
import 'package:pruebaTest/sharedPreferences/shared.dart';

import 'package:pruebaTest/styles/colors.dart';
import 'package:pruebaTest/styles/style.dart';

import 'package:pruebaTest/utils/adapt_screen.dart';
import 'package:pruebaTest/widget/card/cardInicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:redux/redux.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redux/redux.dart';

//import 'package:sign_in_with_apple/sign_in_with_apple.dart';
//import 'package:google_sign_in/google_sign_in.dart';

import 'dart:convert';
import 'dart:math';

import 'dart:math';
import 'dart:ui';

import '../../styles/colors.dart';
class historyPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
 historyPage({Key key}) : super(key: key);

  @override
  _historyState createState() => _historyState();
}

var _store;
class _historyState extends State<historyPage> {





  Position _currentPosition;
  String _currentAddress;

   _getCurrentLocation()  async {
     location() async {
      LocationPermission permission;
   permission = await Geolocator.requestPermission();
     }location();

    print("location1:");
     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
   print(position.latitude);
   print(position.longitude);
    Geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
      .then((Position position) {
        setState(() {
          _currentPosition = position;
           print("location:"+_currentPosition.latitude.toString());
          _getAddressFromLatLng();
         
        });
      }).catchError((e) {
        print(e);
          print("location2:");
      });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition.latitude,
        _currentPosition.longitude
      );

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }


  final String apiKey = '6ed5914d0446030f513756c4a11ab46d';
  TextStyle moneyStyle;
  TextStyle titleStyle;
  final bool revealWeather = false;
  String search = "";

  @override
  Widget build(BuildContext context) {
    AdaptScreen.initAdapt(context);
    moneyStyle = TextStyle(
        color: AppColors.fontColor,
        fontSize: AdaptScreen.screenWidth() * 0.09,
        fontWeight: FontWeight.bold);
    titleStyle = TextStyle(
        color: AppColors.fontColor, fontSize: AdaptScreen.screenWidth() * 0.05);

    return



      Scaffold(
      body: StoreProvider<AppStateHome>(
        //ReduxSignUp.store,
          store: ReduxHome.store,
          child: StoreConnector<AppStateHome, dynamic>(
              distinct: true,
              converter: (store) => store.state.postsState,
              onInit: (store) {
                _store = store;
              },
              builder: (context, value) {
                return RefreshIndicator(
                    onRefresh: () {

                      /*var action = RefreshItemsAction();
                  Redux.store
                      .dispatch(UpdateUserInfo(state.userState.user, action));
                  return action.completer.future;*/
                    },
                    child:Stack(children: <Widget>[
                      Positioned(
                          top: -60.0, right: -35, child: _decorationBox()),
                      Container(
                        padding: EdgeInsets.all(15.0),
                      ),

                      ListView(


                        children: [
                          Container(
                            child: Center(
                              child:   Row(children: [
                               GestureDetector(onTap: (){

Navigator.pop(context);

                               },child: Icon(Icons.arrow_back,size:40,color: Colors.grey,)),
                               Expanded(child: SizedBox()),
Text("Historial", style: AppStyle().styleText(30, Colors.white, true)),
  Expanded(child: SizedBox()),
  SizedBox(width: 60,),
                              ]),
                            ),
                          ),

                            if (_currentPosition != null) Text(
              "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"
            ),

     
SizedBox(height: 10,),
     


FutureBuilder(
    future: AppSharedPreference().getDataUser(),
    builder: (
      BuildContext context,
      AsyncSnapshot snapshot,
    ) {
      print(snapshot.connectionState);
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      } else if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return const Text('Error');
        } else if (snapshot.hasData) {
         // return Text(snapshot.data);

         return     snapshot.data == null ?Text("No resullt", style: AppStyle().styleText(16, Colors.black, false)): ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:  snapshot.data.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                              
                               HistoryItem dataUser = snapshot.data[index];
                                

                               return ListTile(
                                 title: 
Text(dataUser.title, style: AppStyle().styleText(20, Colors.black, false)),

                                 
                                // subtitle:  Text(dataUser.body),
                                 trailing: Flexible(child:Text(dataUser.date, style: AppStyle().styleText(16, Colors.black, false))),
                                 
                                 
                               );
                              
                                
                              }
                          );
        } else {
          return const Text('Empty data');
        }
      } else {
        return Text('State: ${snapshot.connectionState}');
      }
    },
            )]),


                     
                        ],
                      ),
                    );
              })),
     
    );
  }



  Widget _decorationBox() {
    return Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(colors: [
                AppColors.mainColor,
                AppColors.main2Color,
              ])),
        ));
  }
  refreshList(){
    asinc() async {
      Store<AppState> store =
      await createStore(api: API());


      store.dispatch(getRestaurantAction(
        context,
      ));
    }

    asinc();
  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();
  
  }
}



class RefreshItemsAction {
  final Completer<Null> completer;

  RefreshItemsAction({Completer completer})
      : this.completer = completer ?? Completer<Null>();
}
