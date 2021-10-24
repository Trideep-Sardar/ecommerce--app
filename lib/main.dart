import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/Pages/cart_page.dart';
import 'package:flutter_application_2/Pages/home_page.dart';
import 'package:flutter_application_2/Pages/login_page.dart';
import 'package:flutter_application_2/modals/catalogs.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:flutter_application_2/widgets/drawer_widget.dart';
import 'package:flutter_application_2/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_2/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_application_2/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';

void main() {
  runApp(VxState(child: MyApp(), store: MyStore()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeDark();
  }
}

class ChangeDark extends StatefulWidget {
  @override
  _ChangeDarkState createState() => _ChangeDarkState();
}

bool _light = true;

class _ChangeDarkState extends State<ChangeDark> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hello",
      initialRoute: MyRoute.homeRoute,
      routes: {
        MyRoute.cartRoute: (context) => MyCart(),
        MyRoute.loginRoute: (context) => LoginPage(),
      },
      theme:
          _light ? MyThemes.lightTheme(context) : MyThemes.darkTheme(context),
      home: HomePage(light: _light),
    );
  }
}
