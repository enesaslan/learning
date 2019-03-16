import 'package:ilk_uygulama/arayuz/veritabani/ogrenci.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class VtYardimcisi{
  static final VtYardimcisi _yardimci = new  VtYardimcisi.icislem();

  factory VtYardimcisi() => _yardimci;
  VtYardimcisi.icislem();

  static Database _vt;

  Future<Database> get veriTabani async {
    if (_vt != null) return _vt;
    _vt = await olusturVt();
    return _vt;
  }
  olusturVt() async{
    io.Directory dosyaKonumu = await getApplicationDocumentsDirectory();
    String yol = join(dosyaKonumu.path, "okul.db");
    var veriTabani =await openDatabase(yol, version: 1, onCreate: _ilkAcilis);
    return veriTabani;
  }

  _ilkAcilis(Database vt, int versiyon) async {
    await vt.execute("CREATE TABLE Ogrenci(no INTEGER PRIMARY KEY, isim TEXT, soyisim TEXT, sinif TEXT)");
  }

  Future<int> ogrenciKaydet(Ogrenci ogrenci) async{
    var veritab=await _vt;
    int cevap =await veritab.insert("Öğrenci", ogrenci.haritaYap());
    return cevap;
  }

  Future<List<Ogrenci>> ogrencileriGetir() async {
    var veritab =await _vt;

    List<Map> liste =await veritab.rawQuery("SELECT * FROM Ogrenci");
    List<Ogrenci> ogrenciler = new List();

    for (int i=0; i<liste.length; i++) {
      var ogrenci = new Ogrenci(liste[i]["isim"],liste[i]["soyisim"],liste[i]["sinif"]);
      ogrenci.numaraVer(liste[i]["no"]);
      ogrenciler.add(ogrenci);
    }
    return ogrenciler;
  }

  Future<int> ogrenciSil(Ogrenci ogrnci) async {
    var veritab =await _vt;
    int cevap =await veritab.rawDelete("DELETE FROM Ogrenci WHERE no = ?", [ogrnci.no]);
    return cevap;
  }

  Future<bool> ogrenciGuncelle(Ogrenci ogrnci) async{
    var veritab =await _vt;
    int cevap=await veritab.update("Ogrenci", ogrnci.haritaYap(), where: "no =?", whereArgs: <int>[ogrnci.no]);
    return cevap > 0 ? true : false;
  }
}