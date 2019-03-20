import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ilk_uygulama/arayuz/sayfalar/arsiv.dart';
import 'package:ilk_uygulama/arayuz/sayfalar/bilgilendirme.dart';
import 'package:ilk_uygulama/arayuz/sayfalar/degerlendirme.dart';
import 'package:ilk_uygulama/arayuz/widgetlar/anasayfa_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScaffoldOgesi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScaffoldState();
}

class ScaffoldState extends State<ScaffoldOgesi> {
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
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                      leading: Icon(Icons.share), title: Text("Paylaş")),
                ),
                PopupMenuItem(
                  child: ListTile(
                      leading: Icon(Icons.star), title: Text("Puan Ver")),
                ),
                PopupMenuItem(
                  child: ListTile(
                      leading: Icon(Icons.contact_mail), title: Text("İletişim")),
                ),
                PopupMenuItem(
                  child: ListTile(
                      leading: Icon(FontAwesomeIcons.amazonPay), title: Text("Bağış Yap")),
                ),
              ];
            },
          ),
        ],
      ),
      body: gecerliSayfa(aktifOge),
      bottomNavigationBar: new BottomNavigationBar(
          currentIndex: aktifOge,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.archive),
              title: new Text("Arşiv"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.info,
                color: Colors.red,
              ),
              title: new Text("Bilgilendirme"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.insert_chart),
              title: new Text("Değerlendirme"),
            ), // items 2 den büyük een az 2 yane dalga mı koymak lazımnen aynen vay sikem kafamı :S
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
