import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mithra/JsonModels/users.dart';
import 'package:mithra/JsonModels/seed.dart';

class DatabaseHelper {
  final databaseName = "mithra.db";

  // SQL commands for creating tables
  String usersTable =
      "CREATE TABLE users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT UNIQUE, usrPassword TEXT)";
  String seedsTable =
      "CREATE TABLE seeds (id INTEGER PRIMARY KEY AUTOINCREMENT, seedName TEXT, quantity INTEGER)";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(usersTable);
      await db.execute(seedsTable);
    });
  }

  Future<List<Seed>> getAllSeeds() async {
    final Database db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query('seeds');

    return List.generate(maps.length, (i) {
      return Seed.fromMap(maps[i]);
    });
  }

  Future<bool> login(Users user) async {
    final Database db = await initDB();
    var result = await db.rawQuery(
        "SELECT * FROM users WHERE usrName = '${user.usrName}' AND usrPassword = '${user.usrPassword}'");
    return result.isNotEmpty;
  }

  Future<int> signup(Users user) async {
    final Database db = await initDB();
    return db.insert('users', user.toMap());
  }

  Future<int> insertAdmin(String adminName, String adminPassword) async {
    final Database db = await initDB();
    Map<String, dynamic> adminData = {
      'usrName': adminName,
      'usrPassword': adminPassword,
    };
    return db.insert('users', adminData);
  }

  Future<int> insertSeed(Seed seed) async {
    final Database db = await initDB();
    return db.insert('seeds', seed.toMap());
  }

  Future<List<Users>> getAllUsers() async {
    final Database db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return Users.fromMap(maps[i]);
    });
  }
}
