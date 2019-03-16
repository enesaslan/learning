import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AnaCard extends StatelessWidget{
  final String rota;
  
  final String baslik;

  AnaCard(this.rota, this.baslik);

  @override
  Widget build(BuildContext context) {
    
    return new GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, rota);
                Fluttertoast.showToast(
                    msg: "Text Field Örnek Kullanım Sayfası",
                    gravity: ToastGravity.BOTTOM,
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.black45,
                    textColor: Colors.white);
              },
              child: Card(
                child: Container(
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(5.0),
              child: new Text(
                baslik,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
              ),
            );
  }

}