import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BasitHttp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HttpState();
}

class HttpState extends State<BasitHttp> {
  var veri;
  var veriUzunluk;

  getIslemiYap() {
    http.get("https://jsonplaceholder.typicode.com/todos/1").then((cevap) {
      print(cevap.statusCode);
      print(cevap.body);

      setState(() {
        veri = cevap.body;
        veriUzunluk =cevap.contentLength;
      });
    });
    print("Get Butonuna Bastınız");
  }

  postIslemiYap() {
    http.post("https://jsonplaceholder.typicode.com/posts", body: {
      "title":"Uygulamadan Geldim",
      "body":"buna karşılık cevap gelecek",
      "userId":"58",
      "id": "13432"
    }).then((cevap){
      print(cevap.statusCode);
      print(cevap.body);
      setState(() {
       veri=cevap.body; 
      });
    });
    print("Post Butonuna Bastınız");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basit Http İşlemleri"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  padding: EdgeInsets.all(30.0),
                  color: Colors.red.shade400,
                  child: Text("GET"),
                  onPressed: getIslemiYap,
                ),
              ),
              Expanded(
                child: RaisedButton(
                  padding: EdgeInsets.all(30.0),
                  color: Colors.amber.shade200,
                  child: Text("POST"),
                  onPressed: postIslemiYap,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Text("Gelen Veri Karakter Uzunluğu : $veriUzunluk", style: TextStyle(fontSize: 25.0),),
                Text("Gelen Veri : ",  style: TextStyle(fontSize: 25.0),),
                Text("$veri", style: TextStyle(fontSize: 15.0),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
