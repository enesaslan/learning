import 'package:flutter/material.dart';
import 'package:ilk_uygulama/arayuz/widgetlar/anasayfa_card.dart';


class ArsivSayfasi extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return new Center(
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
      );
  }

}