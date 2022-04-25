import 'package:pruebaTest/ui/login/login_screen.dart';
import 'package:pruebaTest/ui/main/main_screen.dart';
import 'package:pruebaTest/ui/profile/profileScreen.dart';
import 'package:flutter/material.dart';

final mainRoutes = {
  'login': (BuildContext context) => LoginScreen(),
  'main': (BuildContext context) => usersListPage(),
  //'profile': (BuildContext context) => usersListProfilePage(),
};
