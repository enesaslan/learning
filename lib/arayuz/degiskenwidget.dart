import 'package:flutter/material.dart';


  class  DegiskenWidget extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => MyHomeState();
  }
  class MyHomeState extends State<DegiskenWidget> {
    int degisenSayi=0;
    int sayacSifirlayici=0;

    void sayiArtir(){
      setState(() {
       degisenSayi++; 
      });
    }

    void sayiyiAzalt(){
      setState(() {
       degisenSayi--; 
      });
    }

    void sayacSifirla(){
      setState(() {
       degisenSayi=0; 
      });
    }

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Sayı Artırma Azaltma"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Sayıyı Artır", style: TextStyle(fontSize: 30.0, fontFamily: "Raleway"),),
                onPressed: sayiArtir,
              ),
              Text("Değişebilen Sayı : $degisenSayi ",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 40.0,
                color: degisenSayi < 0 ? Colors.red : Colors.green,
              ),
              ),
              FlatButton(
                child: Text("Sayıyı Azalt", style: TextStyle(fontSize: 30.0, fontFamily: "Raleway"),),
                onPressed: sayiyiAzalt,
              ),
              FlatButton(
                child: Text("-> Sayacı Sıfırla <-",
                style: TextStyle(fontSize: 30.0, fontFamily: "Raleway"
                ),
                ),
                onPressed: sayacSifirla,
              ),
            ],
          ),
        ),
      );
    }
  }
