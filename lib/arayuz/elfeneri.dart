import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';
import 'dart:async';

class ElFeneri extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => FenerState();

}



class FenerState extends State<ElFeneri>{
  
  bool _flashVarMi = false;
  bool _acikMi = false;
  double _siddeti=1.0;
  String lamba="lampoff", btn="Aç", btnRenk="red";

  @override
  void initState() {
    
    super.initState();
    ilkAcilis();
  }

  ilkAcilis() async {
    bool flashVarMi =await Lamp.hasLamp;
    setState(() {
     _flashVarMi = flashVarMi; 
    });
  }

  Future _feneriAc() async {
    if(_acikMi) {
      Lamp.turnOff();
      lamba="lampoff";
      btn="Aç";      
    }
    else{
      Lamp.turnOn(intensity: _siddeti);
      lamba="lampon";
      btn="Kapat";
    }
    var v =await Lamp.hasLamp;
    setState(() {
     _flashVarMi = v;
     _acikMi = !_acikMi; 
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("El Feneri Uygulaması"),
      ),
      body: new Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/$lamba.png"),
          RaisedButton(
            color: Colors.red,
            child: Text("Feneri $btn", style: TextStyle(color: Colors.white, fontSize: 20.0),),
            onPressed: _feneriAc,
          ),
        ],
      ),
      ),
    );
  }

}