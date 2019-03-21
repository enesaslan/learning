import 'package:flutter/material.dart';

class AppBarSayfasi extends StatefulWidget {
  final String gelenDeger;

  AppBarSayfasi({this.gelenDeger});

  @override
  _AppBarSayfasiState createState() => _AppBarSayfasiState();
}

class _AppBarSayfasiState extends State<AppBarSayfasi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              widget.gelenDeger != null ? widget.gelenDeger : "AppBar Sayfası"),
          bottom: TabBar(
            tabs: <Widget>[
              Icon(Icons.face),
              Icon(Icons.add_comment),
              Icon(Icons.art_track),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(color: Colors.amber.shade500),
            Container(color: Colors.red),
            Container(color: Colors.black12),
          ],
        ),
      ),
    );
  }
}
