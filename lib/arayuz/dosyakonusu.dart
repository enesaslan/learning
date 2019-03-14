import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class KayitIslemleri {
  // Uygulamanın dosya kayıt yolunu alma
  Future<String> get dosyaYolu async {
    final konum = await getApplicationDocumentsDirectory();
    return konum.path;
  }

  // Dosya oluşturuluyor
  Future<File> get yerelDosya async {
    final yol = await dosyaYolu;
    return File("$yol/yenidosya.txt");
  }

  // Dosya okuma işlemi
  Future<String> dosyaOku() async {
    try {
      final dosya = await yerelDosya;
      String icerik = await dosya.readAsString();
      return icerik;
    } catch (h) {
      return "Dosya okunurken hata ile karşılaşıldı : $h";
    }
  }

  // Dosya yazma işlemleri

  Future<File> dosyaYaz(String gelenIcerik) async {
    final dosya = await yerelDosya;
    return dosya.writeAsString("$gelenIcerik");
  }
}

class DosyaIslemleri extends StatefulWidget {
  final KayitIslemleri kayitislemi;

  const DosyaIslemleri({Key key, this.kayitislemi}) : super(key: key);
  @override
  State<StatefulWidget> createState() => DosyaState();
}

class DosyaState extends State<DosyaIslemleri> {
  final yaziController = TextEditingController();
  String veri = "";

  Future<File> veriKaydet() async {
    setState(() {
      veri = yaziController.text;
    });
    return widget.kayitislemi.dosyaYaz(veri);
  }

  @override
  void initState() {
    super.initState();

    widget.kayitislemi.dosyaOku().then((String deger) {
      setState(() {
        veri = deger;
      });
    });
  }

  void veriOku() {
    widget.kayitislemi.dosyaOku().then((String deger) {
      setState(() {
        veri = deger;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dosya İşlemleri")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                hintText: "Dosyaya Yazmak İstediğiniz Verileri Buraya Yazın"),
            controller: yaziController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: veriKaydet,
                    child: Text(
                      "Kayıt Et",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.orange,
                    onPressed: veriOku,
                    child: Text(
                      "Oku",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Kayıt Edilen yazı : \n $veri"),
            ),
          ),
        ],
      ),
    );
  }
}