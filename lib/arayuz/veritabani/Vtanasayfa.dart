import 'package:flutter/material.dart';

class VtAnasayfa extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => VtState();
  }



class VtState extends State<VtAnasayfa>{
  _ogrenciEkle() {}
  _ogrenciSil(int oNo) {}
  _ogrenciGuncelle(int oNo) {}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Veri Tabanı İşlemleri"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _ogrenciEkle,
        ),
      ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                ListTile(title: Text("Öğrencinin Adı Soyadı"),
                leading: Text("0"),
                subtitle: Text("Öğrencinin Sınıfı"),
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: _ogrenciGuncelle(1),
                      child: Text("Öğrenci Güncelle"),
                    ),
                    FlatButton(
                      onPressed: _ogrenciSil(1),
                      child: Text("Öğrenci Sil"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}