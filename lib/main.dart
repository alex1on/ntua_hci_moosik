import 'package:flutter/material.dart';
import 'package:ntua_hci_moosik/Starting_Page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:ntua_hci_moosik/Playlist_Page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moosik',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const PlaylistPage(), // to be changed to starting page
    );
  }
}

// Class for users
class User {
  int? id;
  String username;
  String password;
  String email;
  DateTime? dateOfBirth;
  String? gender;

  // Constructor
  User({this.id, required this.username, required this.password, required this.email, this.dateOfBirth, this.gender});

  // Maps a database record to a user
  User.fromMap(Map<String, dynamic> user)
      : id = user['id'],
        username = user['username'],
        password = user['password'],
        email = user['email'],
        dateOfBirth = user['dateOfBirth'] != null ? DateTime.parse(user['dateOfBirth']) : null,
        gender = user['gender'];

  // Maps a User instance to a database record
  Map<String, dynamic> toMap() {
    final record = {
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'gender': gender,
    };
    return record;
  }
}

/// [SQLiteService] class that implements the application's interface to the DB (SQLite)
class SQLiteService {
  
  // DB initialization
  Future<Database> initDB() async {
    return openDatabase(
      p.join(await getDatabasesPath(), 'moosik.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            password TEXT,
            email TEXT,
            dateOfBirth TEXT,
            gender TEXT
          )
          '''
        );
      },
      version: 1,
    );
  }

  // Retrieve all users from db
  Future<List<User>> getUsers() async {

    // Connection with db
    final db = await initDB();

    final List<Map<String, Object?>> queryResult = await db.query('users');

    // Convert from db records to class instances
    return queryResult.map((e) => User.fromMap(e)).toList();
  }

  /// Add [User] [user] to db. Returns the primary key of the record.
  Future<int> addUser(User user) async {
    
    // Connection with db.
    final db = await initDB();

    // In case there is a duplicate record in the database for some reason, replace it with the current one.
    return db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Delete user with [id] from db
  Future<void> deleteUser(final id) async {
    
    // Connection with db
    final db = await initDB();

    await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  // Update user
  Future<void> updateUser(User user) async {
    
    // Connection with db
    final db = await initDB();

    await db.update(
      'users', 
      where: 'id = ?',
      user.toMap(),
      whereArgs: [user.id],
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  // Delete all user records from db  
  Future<void> deleteAll() async {
    
    // Connection with db
    final db = await initDB();

    await db.delete('users');
  }
}