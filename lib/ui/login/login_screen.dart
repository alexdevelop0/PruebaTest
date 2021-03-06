import 'dart:math';

import 'package:pruebaTest/generated/l10n.dart';


import 'package:pruebaTest/routes/assets_routes.dart';
import 'package:pruebaTest/styles/colors.dart';
import 'package:pruebaTest/styles/style.dart';
import 'package:pruebaTest/utils/adapt_screen.dart';
import 'package:pruebaTest/utils/alert.dart';
import 'package:pruebaTest/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  Utils utils = Utils();
  bool changePage = true;
  String email;
  String password;
  Widget _decorationBox() {
    return Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 360.0,
          width: 370.0,
          child: Container(
            child: Transform.rotate(
              angle: 26,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Center(
                      child: Image(
                        image: AssetImage(AssetsRoutes.loginIcon),
                        height: 200.0,

                      ),
                    ),
                  ),
              ],),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(colors: [
               Colors.white,
                Colors.white,
              ])),
        ));
  }
  final _ediUser = TextEditingController();
final _ediPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(body:


      Container(

        

        child: Column(children: <Widget>[
           SizedBox(height: 70,),
         Container(margin: EdgeInsets.only(left: 30,right: 30),
                    child: Center(
                      child: Image(
                        image: AssetImage(AssetsRoutes.loginIcon),
                        height: 150.0,

                      ),
                    ),
                  ),
                  SizedBox(height: 70,),

 
          Container(
             margin: EdgeInsets.only(left: 25,right: 25),
                child: Form(key: _formKey,child:Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   
 Container(
   height: 70,
   width: double.infinity,
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return AppLocalizations.of(context).requiredfield;
                                        }
                                        return null;
                                      },
                                      controller: _ediUser,
                                      style: TextStyle(
                                              color: Colors.black),
                                      decoration: InputDecoration(
                                        //  border: InputBorder.none,
                                          hintText: AppLocalizations.of(context).user,
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),



                      /*             Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text("Hello 1"),
            Text("Hello 2"),
          ],
      //  mainAxisAlignment:MainAxisAlignment.spaceBetween
        ),
      ],
    ),*/
                                  Container(
                 height: 70,
   width: double.infinity,
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return AppLocalizations.of(context).requiredfield;
                                        }
                                        return null;
                                      },
                                      obscureText: true,
                                       style: TextStyle(
                                              color: Colors.black),
                                      controller: _ediPassword,
                                      decoration: InputDecoration(
                                         // border: InputBorder.none,
                                          hintText: AppLocalizations.of(context).password,
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
  
                                 
                                  
                                  SizedBox(height: 20,),  
                              
                            
                    _submitButtom(context)
                  ],
                ),
           ) ),
        ]),
      ));



  }




  Widget _submitButtom(BuildContext context) {
    return 
    
   
      
  Container(margin: EdgeInsets.only(left: 20,right: 20),height: 60,width: double.infinity,child:ElevatedButton(
          onPressed: ()  {

            if(_formKey.currentState.validate()){
            if(_ediPassword.text == "1234" &&_ediUser.text == "admin"  ){
  Navigator.pushNamed(context, 'main');
            }else{
              AlertWidget().message(context, "Datos incorrectos");
            }
          }
          },
          
       
          child: Text('Entrar',style:  AppStyle().styleText(16, Colors.white, false,bold2:true),),
          
           style: ElevatedButton.styleFrom(
              elevation: 0, //Defines Elevation
               primary: AppColors.raisedButtonColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5), 
      
      
      
 
    ),
  ),
         
               
        ),
      );
    
  }
}
