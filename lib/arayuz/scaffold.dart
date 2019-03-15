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
            new GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/ilksayfa");
                Fluttertoast.showToast(
                    msg: "Tek Tık İle İlk Sayfa isimli Sayfayı Açtınız",
                    gravity: ToastGravity.BOTTOM,
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.black45,
                    textColor: Colors.white);
              },
              child: Card(
                child: Container(
                alignment: Alignment.center,
                color: Colors.amber,
                margin: EdgeInsets.all(7.5),
                child: new Text(
                  "Sayı Artırma Örneği",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
                ),
              ),
              ),
            ),
            new GestureDetector(
              onDoubleTap: () {
                Navigator.pushNamed(context, "/degiskenwidget");
                Fluttertoast.showToast(
                    msg: "Çift Tıklayarak Bu Sayfaya Ulaştınız",
                    gravity: ToastGravity.BOTTOM,
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.black45,
                    textColor: Colors.white);
              },                  
              child: Card(
                child: Container(
                alignment: Alignment.center,
                color: Colors.amber,
                margin: EdgeInsets.all(7.5),
                child: new Text(
                  "Sayı Artır Azalt Sıfırla",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
                ),
              ),
              ),
            ),
            new GestureDetector(
              onLongPress: () {
                Navigator.pushNamed(context, "/ilksayfa");
                Fluttertoast.showToast(
                    msg: "Uzun Süre Basılı Tutarak Bu Sayfaya Ulaştınız",
                    gravity: ToastGravity.BOTTOM,
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.black45,
                    textColor: Colors.white);
              },
              child: Card(
                child: Container(
                alignment: Alignment.center,
                color: Colors.amber,
                margin: EdgeInsets.all(7.5),
                child: new Text(
                  """ Uzan Bas \n ilk Sayfaya Git""",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
                ),
              ),
              )
            ),
            new GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/alertvetext");
                Fluttertoast.showToast(
                    msg: "Text Field Örnek Kullanım Sayfası",
                    gravity: ToastGravity.BOTTOM,
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.black45,
                    textColor: Colors.white);
              },
              child: Card(
                child: Container(
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Text Field Örneği",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
              ),
            ),
            // Aşağıdakilerin CARD içine alınması için önce GesturesDedector içerisine alınması lazım. Daha sonra CARD içine alınır.
            new GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/sharedkonusu");
                Fluttertoast.showToast(
                  msg: "Shared Konusu Sayfasındasınız",
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_LONG,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                );
              },
              child: Card(
                child: Container(  
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Shared Preferences",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
              ),
            ),
            new GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/dosyakonusu");
                Fluttertoast.showToast(
                  msg: "Dosya Konusu Sayfasındasınız",
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_LONG,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                );
              },
              child: Card(
                child: Container(  
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Dosya İşlemleri",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
              ),
            ),
            new GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/jsonkonusu");
                Fluttertoast.showToast(
                  msg: "JSON Konusu Sayfasındasınız",
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_LONG,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                );
              },
              child: Card(
                child: Container(  
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "JSON İşlemleri",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
              ),
            ),
            new GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/localjsonkonusu");
                Fluttertoast.showToast(
                  msg: "Local JSON Konusu Sayfasındasınız",
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_LONG,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                );
              },
              child: Card(
                child: Container(  
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Local JSON İşlemleri",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
              ),
            ),
            new GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/basithttp");
                Fluttertoast.showToast(
                  msg: "Basit Http İşlemleri Konusu Sayfasındasınız",
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_LONG,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                );
              },
              child: Card(
                child: Container(  
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Basit Http İşlemleri",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
              ),
            ),
            new GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/elfeneri");
                Fluttertoast.showToast(
                  msg: "El Feneri Uygulaması Açıldı",
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_LONG,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                );
              },
              child: Card( // bi sn
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.amber,
                  margin: EdgeInsets.all(7.5),
                  child: new Text("El Feneri Uygulaması",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
                  ),
                ),
              ),
            ),
            AnaCard("/elfeneri", "El Feneri Uygulaması"),
            new Container(
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Yeni Container 12",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
            new Container(
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Yeni Container 13",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
            new Container(
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Yeni Container 14",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
            new Container(
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Yeni Container 15",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
            new Container(
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Yeni Container 16",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
            new Container(
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Yeni Container 17",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
            new Container(
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Yeni Container 18",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
            new Container(
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Yeni Container 19",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
            new Container(
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Yeni Container 20",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
            new Container(
              alignment: Alignment.center,
              color: Colors.amber,
              margin: EdgeInsets.all(7.5),
              child: new Text(
                "Yeni Container 21",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Raleway", fontSize: 22.0),
              ),
            ),
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
