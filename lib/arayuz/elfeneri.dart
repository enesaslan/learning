import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';
import 'dart:async';

class ElFeneri extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FenerState();

}

class  FenerState extends State<ElFeneri> {

  bool _flashVarmi=false;
  bool _acikmi=false;
  double _siddeti=1.0;
  String labma="lampon";
  String buton="Flash Aç";

  @override
  void initState() {
    
    super.initState();
    ilkAcilis();
  }

  ilkAcilis() async {
    bool flashVarmi=await Lamp.hasLamp;
    setState(() { //geri yapma yeniden hot reload yap he R yapıyom bak ordaki Toast mesaj çııyı sayfa açilmiy benim aklıma gelen benim burada kulalndığım resimin o içerdeki widgete sığmaması _?
     _flashVarmi = flashVarmi; 
    });
  }

  Future _feneriAc() async {
    
    if (_acikmi){
      Lamp.turnOff();
      labma="$labma";
      buton="Aç";
    }
    else {
      Lamp.turnOn(intensity: _siddeti);
      labma="lampoff.png";
      buton="Kapat";
    }
    var v =await Lamp.hasLamp;
    setState(() {
     _flashVarmi = v;
     _acikmi = !_acikmi; 
    });
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("El Feneri"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/lampoff.png"),
          RaisedButton(
            child: Text("Feneri Aç"),
            onPressed: ()=> _feneriAc(),
          ),
        ],
      ),
    );
  } 
}