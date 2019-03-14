import 'package:flutter/material.dart';

class AlertVeTextField extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AlertState();
  
}

class AlertState extends State<StatefulWidget> {
 final yaziKontrolcusu=TextEditingController();
 final genelKontrolcu=GlobalKey<FormState>();
 @override
  void dispose() {
    yaziKontrolcusu.dispose();
    super.dispose();
  }

  void selamla(){
    if (genelKontrolcu.currentState.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Selamlama Metni"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text ("Merhaba ${yaziKontrolcusu.text} Bey"),
                  Text("Bugün Nasılsınız?"),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Tamam"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
      );
    }
  }

  @override
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yazı İşleri"),
      ),
      body: Form(
        key: genelKontrolcu,
        child: Padding(padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (yazi) {
                if (yazi.isEmpty) {
                  return "Lütfen bu kısmı boş bırakmayın";
                }
              },
              controller: yaziKontrolcusu,
              decoration: InputDecoration(hintText: "Lütfen isminizi yazınız",),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Colors.tealAccent[200],
                child: Text("Selamla",
                style: TextStyle(color: Colors.black,
                ),
                ),
                onPressed: selamla,
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }

  
}