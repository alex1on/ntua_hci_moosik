import 'package:flutter/material.dart';
import 'package:ntua_hci_moosik/Starting_Page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:ntua_hci_moosik/wearos/Moosik_Wear.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        debugPrint('Host device screen width: ${constraints.maxWidth}');

        // Watch-sized device
        if (constraints.maxWidth < 300) {
          return const MoosikWear();
        }
        // Phone-sized device
        else {
          return MaterialApp(
            title: 'Moosik',
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
            ),
            home: const StartingPage(), // to be changed to starting page
          );
        }
      },
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
  User(
      {this.id,
      required this.username,
      required this.password,
      required this.email,
      this.dateOfBirth,
      this.gender});

  // Maps a database record to a user
  User.fromMap(Map<String, dynamic> user)
      : id = user['id'],
        username = user['username'],
        password = user['password'],
        email = user['email'],
        dateOfBirth = user['dateOfBirth'] != null
            ? DateTime.parse(user['dateOfBirth'])
            : null,
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

// Class for playlists
class Playlist {
  int? id;
  String title;
  int userID;

  // Constructor
  Playlist({this.id, required this.title, required this.userID});

  // Maps a database record to a playlist
  Playlist.fromMap(Map<String, dynamic> playlist)
      : id = playlist['id'],
        title = playlist['title'],
        userID = playlist['userID'];

  // Maps a Playlist instance to a database record
  Map<String, dynamic> toMap() {
    final record = {
      'id': id,
      'title': title,
      'userID': userID,
    };
    return record;
  }
}

// Class for songs
class Song {
  int? id;
  String title;
  String artist;
  String url;
  String category;
  int? playlistID;

  // Constructor
  Song(
      {this.id,
      required this.title,
      required this.artist,
      required this.url,
      required this.category,
      this.playlistID});

  // Maps a database record to a song
  Song.fromMap(Map<String, dynamic> song)
      : id = song['id'],
        title = song['title'],
        artist = song['artist'],
        url = song['url'],
        category = song['category'],
        playlistID = song['playlistID'];

  // Maps a Song instance to a database record
  Map<String, dynamic> toMap() {
    final record = {
      'id': id,
      'title': title,
      'artist': artist,
      'url': url,
      'category': category,
      'playlistID': playlistID,
    };
    return record;
  }

  // sample data for happy songs
  static List<Song> Happy_songs = [
    Song(
        title: 'Happy',
        artist: 'Pharell Williams',
        url: '../assets/music/happy.mp3',
        category: 'Happy'),
    Song(
        title: 'YMCA',
        artist: 'Village People',
        url: '../assets/music/ymca.mp3',
        category: 'Happy'),
    Song(
        title: 'The Passenger',
        artist: 'Iggy Pop',
        url: '../assets/music/the-passenger.mp3',
        category: 'Happy')
  ];

  // sample data for happy songs
  static List<Song> Sad_songs = [
    Song(
        title: 'Happy',
        artist: 'Pharell Williams',
        url: '../assets/music/happy.mp3',
        category: 'Happy'),
    Song(
        title: 'YMCA',
        artist: 'Village People',
        url: '../assets/music/ymca.mp3',
        category: 'Happy'),
    Song(
        title: 'The Passenger',
        artist: 'Iggy Pop',
        url: '../assets/music/the-passenger.mp3',
        category: 'Happy')
  ];

  // sample data for happy songs
  static List<Song> Excited_songs = [
    Song(
        title: 'Happy',
        artist: 'Pharell Williams',
        url: '../assets/music/happy.mp3',
        category: 'Happy'),
    Song(
        title: 'YMCA',
        artist: 'Village People',
        url: '../assets/music/ymca.mp3',
        category: 'Happy'),
    Song(
        title: 'The Passenger',
        artist: 'Iggy Pop',
        url: '../assets/music/the-passenger.mp3',
        category: 'Happy')
  ];

  // sample data for happy songs
  static List<Song> Angry_songs = [
    Song(
        title: 'Happy',
        artist: 'Pharell Williams',
        url: '../assets/music/happy.mp3',
        category: 'Happy'),
    Song(
        title: 'YMCA',
        artist: 'Village People',
        url: '../assets/music/ymca.mp3',
        category: 'Happy'),
    Song(
        title: 'Enemy',
        artist: 'Imagine Dragons',
        url: '../assets/music/enemy.mp3',
        category: 'Angry')
  ];
}

/// [SQLiteService] class that implements the application's interface to the DB (SQLite)
class SQLiteService {
  // DB initialization
  Future<Database> initDB() async {
    return openDatabase(
      p.join(await getDatabasesPath(), 'moosik.db'),
      onCreate: (db, version) async {
        // Create users table
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            password TEXT,
            email TEXT,
            dateOfBirth TEXT,
            gender TEXT
          )
          ''');

        // Create playlists table
        await db.execute('''
          CREATE TABLE playlists (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            userID INTEGER,
            FOREIGN KEY (userID) REFERENCES users(id)
          )
          ''');
        // Create songs table
        await db.execute('''
          CREATE TABLE songs (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            artist TEXT,
            url TEXT,
            category TEXT,
            playlistID INTEGER,
            FOREIGN KEY (playlistID) REFERENCES playlists(id)
          )
          ''');
      },
      version: 1,
    );
  }

  /*
  ############### USERS ###############
  */

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

  /// Delete the [User] with [id] from the  db
  Future<void> deleteUser(final id) async {
    // Connection with db
    final db = await initDB();

    await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  /// Update [User]
  Future<void> updateUser(User user) async {
    // Connection with db
    final db = await initDB();

    await db.update(
        'users',
        where: 'id = ?',
        user.toMap(),
        whereArgs: [user.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Delete all [User] records from db
  Future<void> deleteAllUsers() async {
    // Connection with db
    final db = await initDB();
    await db.delete('users');
  }

  /*
  ############### PLAYLISTS ###############
  */

  // Retrieve all playlists from db
  Future<List<Playlist>> getPlaylists() async {
    // Connection with db
    final db = await initDB();

    final List<Map<String, Object?>> queryResult = await db.query('playlists');

    // Convert from db records to class instances
    return queryResult.map((e) => Playlist.fromMap(e)).toList();
  }

  /// Add [Playlist] [playlist] to db. Returns the primary key of the record.
  Future<int> addPlaylist(Playlist playlist) async {
    // Connection with db.
    final db = await initDB();

    // In case there is a duplicate record in the database for some reason, replace it with the current one.
    return db.insert('playlists', playlist.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Delete the [Playlist] with [id] from the db.
  Future<void> deletePlaylist(final id) async {
    // Connection with db.
    final db = await initDB();

    await db.delete('playlists', where: 'id = ?', whereArgs: [id]);
  }

  /// Update [Playlist]
  Future<void> updatePlaylist(Playlist playlist) async {
    // Connection with db
    final db = await initDB();

    await db.update(
        'playlists',
        where: 'id = ?',
        playlist.toMap(),
        whereArgs: [playlist.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Delete all [Playlist] records from db
  Future<void> deleteAllPlaylists() async {
    // Connection with db
    final db = await initDB();
    await db.delete('playlists');
  }

  /*
  ############### SONGS ###############
  */

  // Retrieve all songs from db
  Future<List<Playlist>> getSongs() async {
    // Connection with db
    final db = await initDB();

    final List<Map<String, Object?>> queryResult = await db.query('songs');

    // Convert from db records to class instances
    return queryResult.map((e) => Playlist.fromMap(e)).toList();
  }

  /// Add [Song] [song] to db. Returns the primary key of the record.
  Future<int> addSong(Song song) async {
    // Connection with db.
    final db = await initDB();

    // In case there is a duplicate record in the database for some reason, replace it with the current one.
    return db.insert('songs', song.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Delete the [Song] with [id] from the db.
  Future<void> deleteSong(final id) async {
    // Connection with db.
    final db = await initDB();

    await db.delete('songs', where: 'id = ?', whereArgs: [id]);
  }

  /// Update [Song]
  Future<void> updateSong(Song song) async {
    // Connection with db
    final db = await initDB();

    await db.update(
        'songs',
        where: 'id = ?',
        song.toMap(),
        whereArgs: [song.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Delete all [Song] records from db
  Future<void> deleteAllSongs() async {
    // Connection with db
    final db = await initDB();
    await db.delete('songs');
  }

  /*
  ############### EXTRAS ###############
  */

  // returns a list of user's playlists
  Future<List<Playlist>> getUserPlaylists(User user) async {
    final db = await initDB();

    final List<Map<String, Object?>> queryResult = await db.query(
      'playlists',
      where: 'userID = ?',
      whereArgs: [user.id],
    );

    return queryResult.map((e) => Playlist.fromMap(e)).toList();
  }

  // returns a list of playlist's songs
  Future<List<Song>> getPlaylistSongs (Playlist playlist) async {
    final db = await initDB();

    final List<Map<String, Object?>> queryResult = await db.query(
      'songs',
      where: 'playlistID = ?',
      whereArgs: [playlist.id],
    );

    return queryResult.map((e) => Song.fromMap(e)).toList();
  }

  /// searchs for playlist with userID = [userID] and title = [title] 
  /// if such a playlist exists, then it returns its id. Otherwise, -1 is returned
  Future<int> getPlaylistID(int ?userID, String title) async {
    final db = await initDB();

    final List<Map<String, dynamic>> queryResult = await db.query(
      'playlists',
      where: 'userID = ? AND title = ?',
      whereArgs: [userID, title],
    );

    if (queryResult.isNotEmpty) {
      return queryResult.first['id'];
    } else {
      return -1;
    }
  }

  /// searchs for a specific song
  /// if such a song exists, then it returns its id. Otherwise, -1 is returned
  Future<int> getSongID(String ?title, String ?artist, String ?url, String ?category, int ?playlistID) async {
    final db = await initDB();

    final List<Map<String, dynamic>> queryResult = await db.query(
      'songs',
      where: 'title = ? AND artist = ? AND url = ? AND category = ? AND playlistID = ?',
      whereArgs: [title, artist, url, category, playlistID],
    );

    if (queryResult.isNotEmpty) {
      return queryResult.first['id'];
    } else {
      return -1;
    }
  }

}

