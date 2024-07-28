import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqldatabase/model/notes_model.dart';

class DBhelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      return _db = await initDatabase();
    }
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'notes.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreatedb);
    return db;
  }

  _onCreatedb(Database db, int versiion) async {
    await db.execute("""CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        color TEXT NOT NULL DEFAULT 'grey')""");
  }

  Future<NotesModle> insert(NotesModle notesModle) async {
    var dbClient = await db;
    await dbClient!.insert("notes", notesModle.toMap());

    return notesModle;
  }

  Future<RxList<NotesModle>> getData() async {
    var dbClint = await db;
    final List<Map<String, Object?>> result = await dbClint!.query("notes");
    return RxList.from(result.map((e) => NotesModle.fromMap(e)).toList());
  }

  Future<int> delete(int id) async {
    var dbClint = await db;
    return await dbClint!.delete("notes", where: "id = ?", whereArgs: [id]);
  }

  Future<int> UpdateData(NotesModle notesModle) async {
    var dbClint = await db;
    return await dbClint!.update("notes", notesModle.toMap(),
        where: "id =?", whereArgs: [notesModle.id]);
  }
}
