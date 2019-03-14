import 'package:flutter/material.dart';
import 'dart:convert';

class LocalJsonKonusu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LocalState();
}

class LocalState extends State<LocalJsonKonusu> {
  List ogrenci;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local JSON Konusu"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("assets/veriler/sinif.json"),
            builder: (context, cevap) {
              ogrenci = jsonDecode(cevap.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                 return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Adı: " + ogrenci[index]['adi']),
                        Text("Soyadı: " + ogrenci[index]['soyadi']),
                        Text("Cinsiyeti: " + ogrenci[index]['cinsiyet']),
                        Text("Veli Adı : " + ogrenci[index]['veli']["adi"]),
                        Text("Veli Yakınlık : " + ogrenci[index]['veli']["yakinlik"]),
                      ],
                    ),
                  );
                },
                itemCount: ogrenci == null ? 0 : ogrenci.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
