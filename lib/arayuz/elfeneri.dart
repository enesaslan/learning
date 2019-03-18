import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';
import 'dart:async';

class ElFeneri extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => FenerState();

}



class FenerState extends State<ElFeneri>{
  
  bool flashVarMi = false;
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
     flashVarMi = flashVarMi; 
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
     flashVarMi = v;
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
          new RaisedButton(onPressed: () async => await Lamp.flash(new Duration(seconds: 2)), child:  new Text("Flash for 2 seconds")),
          Slider(value: _siddeti, onChanged: _acikMi ? _siddetiDegistir: null,),
          Text("Işık Şiddetini Ayarla", style: TextStyle(fontSize: 28.0),),
        ],
      ),
      ),
    ); 
  }
_siddetiDegistir(double siddet){
  Lamp.turnOn(intensity: siddet);
  setState(() {
   _siddeti =siddet; 
  });
}
}