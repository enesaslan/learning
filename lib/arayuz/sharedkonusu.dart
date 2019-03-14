import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedKonusu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SharedState();

    
  }

class  SharedState extends State<SharedKonusu> {

  final isimController =TextEditingController();
  final soyisimController =TextEditingController();
  final genelController =GlobalKey<FormState>();

  String isim="";
  String soyIsim="";
  bool kayitDurumu=false;
  int kayitNo=0;

  @override
  void dispose(){
    isimController.dispose();
    soyisimController.dispose();
    super.dispose();
  }
  void kayitYap(String gIsim, String gSoyIsim) async {
    final kayitAraci =await SharedPreferences.getInstance();
    if(genelController.currentState.validate()){
      kayitAraci.setBool("durum", true);
      kayitAraci.setInt("kayitno", 1);
      kayitAraci.setString("isim", gIsim);
      kayitAraci.setString("soyisim", gSoyIsim);

      Fluttertoast.showToast(
        msg: "Kayıt Başarılı",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
      );
    }
    
  }

  void kayitGoster() async {
    final kayitAraci = await SharedPreferences.getInstance();

    bool kayitliDurum = kayitAraci.getBool("durum");
    int kayitliNo = kayitAraci.getInt("kayitno");
    String kayitliIsim = kayitAraci.getString("isim");
    String kayitliSoyIsim = kayitAraci.getString("soyisim");

    setState(() {
     isim=kayitliIsim;
     soyIsim=kayitliSoyIsim;
     kayitDurumu=kayitliDurum;
     kayitNo=kayitliNo; 
    });
    Fluttertoast.showToast(
        msg: "Kayıt Başarılı Şekilde Gösterildi",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
      );
  }

  void kayitSil() async {
    final kayitAraci = await SharedPreferences.getInstance();

    kayitAraci.remove("durum");
    kayitAraci.remove("kayitno");
    kayitAraci.remove("isim");
    kayitAraci.remove("soyisim");

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shared Preferences Konusu"),
      ),
      body: Form(
        key: genelController,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (deger) {
                  if (deger.length < 3) {
                    return "Lütfen en az 3 harf olacak şekilde yazınız";
                  }
                },
                controller: isimController,
                decoration: InputDecoration(hintText: "İsminizi Giriniz"),
              ),
              TextFormField(
                validator: (deger) {
                  if (deger.length < 3) {
                    return "Lütfen en az 3 harf olacak şekilde yazınız";
                  }
                },
                controller: soyisimController,
                decoration: InputDecoration(hintText: "Soyisminizi Giriniz"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text("Kayıt Ol", style:TextStyle(color: Colors.white),
                        ),
                        onPressed: () => kayitYap(isimController.text, soyisimController.text),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.grey,
                        child: Text("Getir", style:TextStyle(color: Colors.white),
                        ),
                        onPressed: () => kayitGoster(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.red,
                        child: Text("Sil", style:TextStyle(color: Colors.white),
                        ),
                        onPressed: () => kayitSil(),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("İsim : $isim"),
                      Text("Soyisim : $soyIsim"),
                      Text("Kayıt Durumu : $kayitDurumu"),
                      Text("Kayıt Numarası : $kayitNo "),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
  }
  
}
