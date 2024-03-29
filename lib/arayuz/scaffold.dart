import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ilk_uygulama/arayuz/sayfalar/appbarsayfasi.dart';
import 'package:ilk_uygulama/arayuz/sayfalar/arsiv.dart';
import 'package:ilk_uygulama/arayuz/sayfalar/bilgilendirme.dart';
import 'package:ilk_uygulama/arayuz/sayfalar/degerlendirme.dart';
import 'package:ilk_uygulama/arayuz/widgetlar/anasayfa_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScaffoldOgesi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScaffoldStatemiz();
}

class ScaffoldStatemiz extends State<ScaffoldOgesi> {
  GlobalKey<ScaffoldState> _keyScaffold = new GlobalKey<ScaffoldState>();

  int aktifOge = 0;

  gecerliSayfa(int aktif) {
    switch (aktif) {
      case 0:
        return ArsivSayfasi();
        break;
      case 1:
        return BilgilendirmeSayfasi();
        break;
      case 2:
        return DegerlendirmeSayfasi();
        break;
    }
  }

  void _ornekFonksiyon(int i) {
    _keyScaffold.currentState.showSnackBar(
      new SnackBar(
        content: Text("Selam Ben Bir Snackbar ım, değerim : $i"),
      ),
    );
    debugPrint(_keyScaffold.currentState.toString());
  }

  void _ornekBottomSheet() {
    _keyScaffold.currentState.showBottomSheet((BuildContext ctx) {
      return Container(
        height: 250.0,
        color: Colors.amber.shade800,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.place),
              title: Text("AppBar Sayfasına Git"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => AppBarSayfasi(gelenDeger: "AnaSayfadan Geldim"),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text("Alarmlar"),
              trailing: Icon(Icons.arrow_right),
              onTap: () => Navigator.pop(context),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.place),
              title: Text("Uygulamalar"),
              trailing: Icon(Icons.android),
              onTap: () => Navigator.pop(context),
            ),
            Divider(),
            ExpansionTile(
              leading: Icon(Icons.adjust),
              title: Text("Hakkımızda"),
              trailing: Icon(Icons.arrow_right),
              children: <Widget>[
                ListTile(
                  onTap: () => Navigator.pop(context),
                  title: Text("Biz Kimiz"),
                ),
                ListTile(
                  onTap: () => Navigator.pop(context),
                  title: Text("Sertifikalarımız"),
                ),
                ListTile(
                  onTap: () => Navigator.pop(context),
                  title: Text("Misyonumuz"),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _keyScaffold,
      backgroundColor: Colors.white10,
      appBar: new AppBar(
        title: Text('cCc 58 cCc'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_play),
            tooltip: 'Air it',
            onPressed: _ornekBottomSheet,
          ),
          PopupMenuButton(
            onSelected: (secilen) {
              debugPrint("Seçilen Menü Value : " + secilen.toString());
              switch (secilen) {
                case 0:
                  _ornekFonksiyon(secilen);
                  break;
                case 1:
                  _ornekFonksiyon(secilen);
                  break;
                case 2:
                  _ornekFonksiyon(secilen);
                  break;
                case 3:
                  _ornekFonksiyon(secilen);
                  break;
                default:
                  _ornekFonksiyon(secilen);
                  break;
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  value: 0,
                  child: ListTile(
                      leading: Icon(Icons.share), title: Text("Paylaş")),
                ),
                PopupMenuItem(
                  value: 1,
                  child: ListTile(
                      leading: Icon(Icons.star), title: Text("Puan Ver")),
                ),
                PopupMenuItem(
                  value: 2,
                  child: ListTile(
                      leading: Icon(Icons.contact_mail),
                      title: Text("İletişim")),
                ),
                PopupMenuItem(
                  value: 3,
                  child: ListTile(
                      leading: Icon(FontAwesomeIcons.amazonPay),
                      title: Text("Bağış Yap")),
                ),
              ];
            },
          ),
        ],
      ),
      body: gecerliSayfa(aktifOge),
      bottomNavigationBar:
          /* BottomAppBar(
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              color: Colors.white,
              icon: new Icon(Icons.archive),
              onPressed: (){},
            ),
            IconButton(
              color: Colors.white,
              icon: new Icon(Icons.archive),
              onPressed: (){},
            ),
          ],
        ),
      ), */
          new BottomNavigationBar(
              currentIndex: aktifOge,
              items: [
                new BottomNavigationBarItem(
                  backgroundColor: Colors.blueAccent,
                  icon: new Icon(Icons.archive),
                  title: new Text("Arşiv"),
                ),
                new BottomNavigationBarItem(
                  backgroundColor: Colors.blueAccent,
                  icon: new Icon(
                    Icons.info,
                    color: Colors.red,
                  ),
                  title: new Text("Bilgilendirme"),
                ),
                new BottomNavigationBarItem(
                  backgroundColor: Colors.blueAccent,
                  icon: new Icon(Icons.insert_chart),
                  title: new Text("Değerlendirme"),
                ),
                new BottomNavigationBarItem(
                  backgroundColor: Colors.blueAccent,
                  icon: new Icon(Icons.airplanemode_active),
                  title: new Text("Diğer 1"),
                ),
                new BottomNavigationBarItem(
                  backgroundColor: Colors.blueAccent,
                  icon: new Icon(Icons.spa),
                  title: new Text("Diğer 2"),
                ),
                new BottomNavigationBarItem(
                  backgroundColor: Colors.blueAccent,
                  icon: new Icon(Icons.hearing),
                  title: new Text("Diğer 3"),
                ),
              ],
              onTap: (int i) {
                aktifOge = i;
                setState(() {});
              }),
      drawer: Container(
        margin: EdgeInsets.only(top: 8.0),
        child: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.blue.shade50,
                height: 70.0,
                width: double.maxFinite, //Logonun olduğu mavi alan
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    child: FlutterLogo(
                      size: 50.0,
                    ),
                    alignment: Alignment.bottomLeft,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.place),
                      title: Text("Yerlerimiz"),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () => Navigator.pop(context),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.alarm),
                      title: Text("Alarmlar"),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () => Navigator.pop(context),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.place),
                      title: Text("Uygulamalar"),
                      trailing: Icon(Icons.android),
                      onTap: () => Navigator.pop(context),
                    ),
                    Divider(),
                    ExpansionTile(
                      leading: Icon(Icons.adjust),
                      title: Text("Hakkımızda"),
                      trailing: Icon(Icons.arrow_right),
                      children: <Widget>[
                        ListTile(
                          onTap: () => Navigator.pop(context),
                          title: Text("Biz Kimiz"),
                        ),
                        ListTile(
                          onTap: () => Navigator.pop(context),
                          title: Text("Sertifikalarımız"),
                        ),
                        ListTile(
                          onTap: () => Navigator.pop(context),
                          title: Text("Misyonumuz"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
