import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Sayfası"),
      ),
      body: Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: new Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        color: Colors.yellow,
        child: new Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Column(
              children: <Widget>[
                new Row (
             mainAxisAlignment: MainAxisAlignment.center,
             mainAxisSize: MainAxisSize.max,
             crossAxisAlignment: CrossAxisAlignment.center,
             textDirection:TextDirection.ltr,
             verticalDirection: VerticalDirection.down,
             textBaseline:TextBaseline.alphabetic,
            children: <Widget>[
              new Container(
                color: Colors.red[400],
                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                child: new Text(
                  "Row 1 Oluşturuldu ",                  
                  textDirection: TextDirection.ltr,
                ),
              ),
              new Container(
                alignment: Alignment.center,
                color: Colors.red.shade900,
                margin: EdgeInsets.all(5.0),
                child: new Text(
                  "Row 1 Oluşturuldu",                  
                  textDirection: TextDirection.ltr,
                ),
              ),
            ],
          ),
          new Row (
             mainAxisAlignment: MainAxisAlignment.center,
             mainAxisSize: MainAxisSize.max,
             crossAxisAlignment: CrossAxisAlignment.center,
             textDirection:TextDirection.ltr,
             verticalDirection: VerticalDirection.down,
             textBaseline:TextBaseline.alphabetic,
            children: <Widget>[
              new Container(
                color: Colors.red,
                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                child: new Text(
                  "Row 2 Oluşturuldu",                  
                  textDirection: TextDirection.ltr,
                ),
              ),
              new Container(
                alignment: Alignment.center,
                color: Colors.red.shade900,
                margin: EdgeInsets.all(5.0),
                child: new Text(
                  "Row 2 Oluşturuldu",                  
                  textDirection: TextDirection.ltr,
                ),
              ),
            ],
          ),
          new Row (
             mainAxisAlignment: MainAxisAlignment.center,
             mainAxisSize: MainAxisSize.max,
             crossAxisAlignment: CrossAxisAlignment.center,
             textDirection:TextDirection.ltr,
             verticalDirection: VerticalDirection.down,
             textBaseline:TextBaseline.alphabetic,
            children: <Widget>[
              new Container(
                color: Colors.red,
                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                child: new Text(
                  "Row 3 Oluşturuldu",                  
                  textDirection: TextDirection.ltr,
                ),
              ),
              new Container(
                alignment: Alignment.center,
                color: Colors.red.shade900,
                margin: EdgeInsets.all(5.0),
                child: new Text(
                  "Row 3 Oluşturuldu",                  
                  textDirection: TextDirection.ltr,
                ),
              ),
               new Container(
                alignment: Alignment.center,
                color: Colors.red.shade900,
                margin: EdgeInsets.all(5.0),
                child: new Text(
                  "Row 3 Oluşturuldu",                  
                  textDirection: TextDirection.ltr,
                ),
              ),
            ],
          ),
              ],
          ),
        ),
      ),
    ),
    );

  }

}
