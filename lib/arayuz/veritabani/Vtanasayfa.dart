import 'package:flutter/material.dart';
import 'package:ilk_uygulama/arayuz/veritabani/ogrenci.dart';
import 'package:ilk_uygulama/arayuz/veritabani/vtyardimcisi.dart';

class VtAnasayfa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VtState();
}

class VtState extends State<VtAnasayfa> {
  VtYardimcisi vtYardimcisi = new VtYardimcisi();
  List<Ogrenci> ogrenciler = new List();

  bool duzenleMi = false;

  final formKontrolcu = GlobalKey<FormState>();

  final isimKontrolcu = TextEditingController();
  final soyIsimKontrolcu = TextEditingController();
  final sinifKontrolcu = TextEditingController();

  ogrenciEkle() {
    vtYardimcisi
        .ogrenciKaydet(
          new Ogrenci(isimKontrolcu.text, soyIsimKontrolcu.text, sinifKontrolcu.text))
        .then((deger) {
      debugPrint(deger.toString());
      if (deger > 0) {
        setState(() => listeYenile());
        isimKontrolcu.clear();
        soyIsimKontrolcu.clear();
        sinifKontrolcu.clear();
        Navigator.pop(context);
      }
    });
  }

  _ogrenciSil(Ogrenci ogrenci) {
    vtYardimcisi.ogrenciSil(ogrenci).then((cvp) {
      if (cvp > 0) {
        setState(() => listeYenile());
      }
    });
  }

  _ogrenciGuncelle(Ogrenci ogrenci) {
    var ogr = new Ogrenci(isimKontrolcu.text, soyIsimKontrolcu.text, sinifKontrolcu.text);
    ogr.no=ogrenci.no;
    vtYardimcisi.ogrenciGuncelle(ogr).then((cvp) {
      if (cvp) {
        setState(() => listeYenile());
        Navigator.pop(context);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    listeYenile();
  }

  listeYenile() {
    vtYardimcisi.ogrencileriGetir().then((gelen) {
      setState(() {
        ogrenciler = gelen;
      });
      debugPrint(gelen.toString());
    });
  }

  void eklemeEkraniAc({Ogrenci ogrenci}) {
    if (ogrenci != null) {
      duzenleMi = true;
      isimKontrolcu.text = ogrenci.isim;
      soyIsimKontrolcu.text = ogrenci.soyisim;
      sinifKontrolcu.text = ogrenci.sinif;
    } else {
      duzenleMi = false;
      isimKontrolcu.clear();
      soyIsimKontrolcu.clear();
      sinifKontrolcu.clear();
    }
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(duzenleMi ? "Öğrenci Düzenle" : "Öğrenci Ekle"),
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
                onPressed: () =>
                    duzenleMi ? _ogrenciGuncelle(ogrenci) : ogrenciEkle(),
                child: Text(duzenleMi ? "Düzenle" : "Ekle"),
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
      body: ListView.builder(
        itemCount: ogrenciler.length,
        itemBuilder: (BuildContext baglam, int sira) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                      "${ogrenciler[sira].isim} ${ogrenciler[sira].soyisim}"),
                  leading: Text("${ogrenciler[sira].no}"),
                  subtitle: Text("${ogrenciler[sira].sinif}"),
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () =>
                          eklemeEkraniAc(ogrenci: ogrenciler[sira]),
                      child: Text("Öğrenci Güncelle"),
                    ),
                    FlatButton(
                      onPressed: () => _ogrenciSil(ogrenciler[sira]),
                      child: Text("Öğrenci Sil"),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
