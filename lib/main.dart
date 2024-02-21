import 'package:flutter/material.dart';
import 'HomePage.dart';
main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context)=>HomePage()
    },
  ));
}