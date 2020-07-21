import 'dart:io';
import 'package:anton_sih_app/models/companies.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class External_Database_Manager {
  Database db;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  void Transfer_Data() async {
    String dirPath = await _localPath;
    String path = join(dirPath, "asset_companies.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      //Load database from asset and copy
      print("Creating new copy of the DB");
      ByteData data = await rootBundle.load(join('assets', 'companies.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      //Save copied asset to documents
      await new File(path).writeAsBytes(bytes);
    } else {
      print("Opening existing DB");
    }
  }

  Future<List<Company>> getCompanies() async {
    print('Getting Companies');
    List<Company> companyList = new List<Company>();

    String dirPath = await _localPath;
    String path = join(dirPath, "asset_companies.db");
    db = await openDatabase(path, readOnly: true);
    String TABLE = 'companies';
    List<Map> list = await db.rawQuery('SELECT * FROM $TABLE');
    if (list.length > 0) {
      for (int i = 0; i < list.length; i++) {
        Company newCompany = new Company(
            exchange: list[i]['exchange'],
            name: list[i]['company'],
            code: list[i]['code']);
        companyList.add(newCompany);
      }
      return companyList;
    } else {
      companyList = [];
      return companyList;
    }
  }
}
