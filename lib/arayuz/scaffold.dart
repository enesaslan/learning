import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ilk_uygulama/arayuz/widgetlar/anasayfa_card.dart';

class ScaffoldOgesi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white10,
      appBar: new AppBar(
        title: Text('cCc 58 cCc'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.playlist_play),
              tooltip: 'Air it',
              onPressed: () => Navigator.popAndPushNamed(context, "/ilksayfa")),
          IconButton(
            icon: Icon(Icons.phone_locked),
            tooltip: 'Restitch it',
            onPressed: () => print("Restitch it"),
          ),
          IconButton(
            icon: Icon(Icons.format_clear),
            tooltip: 'Repair it',
            onPressed: () => print("Repair it"),
          ),
        ],
      ),
      body: new Center(
        // child: new Text("Merhaba Scaffold", textDirection:TextDirection.ltr),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 10.0,
          crossAxisCount: 3,
          children: <Widget>[
            AnaCard("/ilksayfa", "Sayı Artırma Örneği"),
            AnaCard("/degiskenwidget", "Sayı Artır Azalt Sıfırla"),
            AnaCard("/ilksayfa", """ Uzan Bas \n ilk Sayfaya Git"""),
            AnaCard("/alertvetext", "Text Field Örneği"),
            AnaCard("/sharedkonusu", "Shared Preferences"),
            AnaCard("/dosyakonusu", "Dosya İşlemleri"),
            AnaCard("/jsonkonusu", "JSON İşlemleri"),
            AnaCard("/localjsonkonusu", "Local JSON İşlemleri"),
            AnaCard("/basithttp", "Basit Http İşlemleri"),
            AnaCard("/elfeneri", "El Feneri Uygulaması"),
            AnaCard("/Vtanasayfa", "VeriTabanı İşlemleri"),
          ],
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.refresh),
              title: new Text("Yenile"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.delete),
              title: new Text("Sil"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.inbox),
              title: new Text("Gelen Kutusu"),
            ), // items 2 den büyük een az 2 yane dalga mı koymak lazımnen aynen vay sikem kafamı :S
          ],
          onTap: (int i) {
            switch (i) {
              case 0:
                debugPrint("Tıkladığınız Buton Sayfayı Yeniler");
                break;
              case 1:
                debugPrint("Tıkladığınız Buton Seçtiğiniz Ögeyi Siler");
                break;
              case 2:
                debugPrint("Tıkladığınız Buton Gelen Kutusunu Açar");
                break;
              default:
                debugPrint("Tıkladığınız Butonun İşlevi Bulunamadı");
                break;
            }
          }),
      drawer: new Drawer(
        child: new ListTile(
          leading: Icon(Icons.computer),
          title: Text('Test Menü Başlığı'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
