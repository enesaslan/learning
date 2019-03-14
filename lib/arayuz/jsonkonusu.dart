import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as baglanti;
import 'dart:convert';

//Fake API - Sahte Jsonlar

/*
{
userId: 1,
id: 1,
title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
body: "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"
}
*/

class Post {
  int userID;
  int id;
  String title;
  String body;

  Post({this.userID, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userID: json["userID"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}

  Future<Post> postuGetir() async {
    final cevap =await baglanti.get("https://jsonplaceholder.typicode.com/posts/1");

    if (cevap.statusCode == 200) {
      return Post.fromJson(json.decode(cevap.body));
    } else {
      throw Exception(
          "Veriler Getirilirken Hata Meydana Geldi. \n Hata Kodu : ${cevap.statusCode}");
    }
  }

class JsonKonusu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basit JSON Konusu"),
      ),
      body: Center(
        child: FutureBuilder<Post> (
          future: postuGetir(),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              int userID =snapshot.data.userID;
              int id =snapshot.data.id;
              String title =snapshot.data.title;
              String body =snapshot.data.body;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Gelen UserID : $userID"),
                  Text("Gelen id : $id"),
                  Text("Gelen title : $title"),
                  Text("Gelen body : $body"),
                ],
              );
            }
            else if (snapshot.hasError){
                return Text("Hata Oluştu. Hata Kodu : ${snapshot.error}");
              }
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
