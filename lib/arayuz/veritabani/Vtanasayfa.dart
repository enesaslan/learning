import 'package:flutter/material.dart';
import 'package:ilk_uygulama/arayuz/veritabani/ogrenci.dart';
import 'package:ilk_uygulama/arayuz/veritabani/vtyardimcisi.dart';

class VtAnasayfa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VtState();
}

class VtState extends State<VtAnasayfa> {
  VtYardimcisi vtYardimcisi = new VtYardimcisi();

  final formKontrolcu = GlobalKey<FormState>();

  final isimKontrolcu = TextEditingController();
  final soyIsimKontrolcu = TextEditingController();
  final sinifKontrolcu = TextEditingController();

  _ogrenciEkle() {
    vtYardimcisi
        .ogrenciKaydet(new Ogrenci(
            isimKontrolcu.text, soyIsimKontrolcu.text, sinifKontrolcu.text))
        .then((deger) {
      debugPrint(deger.toString());
      if (deger > 0) {
        Navigator.pop(context);
      }
    });
  }

  _ogrenciSil(int oNo) {}
  _ogrenciGuncelle(int oNo) {}

  void eklemeEkraniAc() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Öğrenci Ekle"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Form(
                    key: formKontrolcu,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: isimKontrolcu,
                          decoration: InputDecoration(
                            hintText: "Öğrencinin İsmini Girin",
                          ),
                        ),
                        TextFormField(
                          controller: soyIsimKontrolcu,
                          decoration: InputDecoration(
                            hintText: "Öğrencinin Soyismini Girin",
                          ),
                        ),
                        TextFormField(
                          controller: sinifKontrolcu,
                          decoration: InputDecoration(
                            hintText: "Öğrencinin Sınıfını Girin",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: _ogrenciEkle,
                child: Text("Öğrenci Ekle"),
              ),
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text("İptal Et"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Veri Tabanı İşlemleri"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => eklemeEkraniAc(),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("Öğrencinin Adı Soyadı"),
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
