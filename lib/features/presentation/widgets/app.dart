
import 'package:bima_application/core/config/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return MaterialApp(
  title: 'bima',
theme: ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
),
  initialRoute: 'login',
  routes: applicationRoutes(),
);
  }

}