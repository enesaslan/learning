import 'package:flutter/material.dart';
import 'package:ilk_uygulama/arayuz/alertvetext.dart';
import 'package:ilk_uygulama/arayuz/dosyakonusu.dart';
import 'arayuz/ilksayfa.dart';
import 'arayuz/hello.dart';
import 'arayuz/scaffold.dart';
import 'arayuz/degiskenwidget.dart';
import 'arayuz/sharedkonusu.dart';
import 'arayuz/jsonkonusu.dart';
import 'arayuz/localjsonkonusu.dart';
import 'arayuz/basithttp.dart';
import 'arayuz/elfeneri.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main () {
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => ScaffoldOgesi(),
        "/ilksayfa": (context) => IlkSayfa(title: "ilk sayfa",),
        "/hello": (context) => Hello(),
        "/degiskenwidget": (context) => DegiskenWidget(),
        "/alertvetext" : (context) => AlertVeTextField(),
        "/sharedkonusu" : (context) => SharedKonusu(),
        "/dosyakonusu" : (context) => DosyaIslemleri(kayitislemi: KayitIslemleri(),),
        "/jsonkonusu" : (context) => JsonKonusu(),
        "/basithttp" : (context) => BasitHttp(),
        "/localjsonkonusu" : (context) => LocalJsonKonusu(),
        "/elfeneri" : (context) => ElFeneri(),
      },
    ),
  );

}

