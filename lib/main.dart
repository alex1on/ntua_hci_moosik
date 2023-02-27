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
  String? type;
  String? tag2;
  String? tag3;
  int? playlistID;

  // Constructor
  Song(
      {this.id,
      required this.title,
      required this.artist,
      required this.url,
      this.type,
      this.tag2,
      this.tag3,
      this.playlistID});

  // Maps a database record to a song
  Song.fromMap(Map<String, dynamic> song)
      : id = song['id'],
        title = song['title'],
        artist = song['artist'],
        url = song['url'],
        type = song['type'],
        tag2 = song['tag2'],
        tag3 = song['tag3'],
        playlistID = song['playlistID'];

  // Maps a Song instance to a database record
  Map<String, dynamic> toMap() {
    final record = {
      'id': id,
      'title': title,
      'artist': artist,
      'url': url,
      'type': type,
      'tag2': tag2,
      'tag3': tag3,
      'playlistID': playlistID,
    };
    return record;
  }

  static List<Song> Songs = [
    Song(
      title: 'The winner takes it all',
      artist: 'ABBA',
      url: '../assets/music/ABBA - The Winner Takes It All.mp3',
      type: 'Pop',
      tag2: 'Regret',
      tag3: 'Heartbreak',
    ),
    Song(
      title: 'Someone Like You',
      artist: 'Adele',
      url: '../assets/music/Adele - Rolling in the Deep.mp3',
      type: 'Pop',
      tag2: 'Reflective',
      tag3: 'Heartbreak',
    ),
    Song(
      title: 'Rolling in the Deep',
      artist: 'Adele',
      url: '../assets/music/Adele - Someone Like You.mp3',
      type: 'Pop',
      tag2: 'Soulful',
      tag3: 'Heartbreak',
    ),
    Song(
      title: 'Respect',
      artist: 'Aretha Franklin',
      url: '../assets/music/Aretha Franklin - Respect.mp3',
      type: 'Soul',
      tag2: 'Empowerment',
      tag3: 'Classic',
    ),
    Song(
      title: 'Therefore I Am',
      artist: 'Bilie Eilish',
      url: '../assets/music/Billie Eilish - Therefore I Am.mp3',
      type: 'Alternative',
      tag2: 'Catchy',
      tag3: 'Confident',
    ),
    Song(
      title: 'The Scientist',
      artist: 'Coldplay',
      url: '../assets/music/Coldplay - Fix You.mp3',
      type: 'Pop',
      tag2: 'Love',
      tag3: 'Heartbreak',
    ),
    Song(
      title: 'Fix You',
      artist: 'Coldplay',
      url: '../assets/music/Coldplay - The Scientist.mp3',
      type: 'Alternative',
      tag2: 'Melancholy',
      tag3: 'Uplifting',
    ),
    Song(
      title: 'Take Five',
      artist: 'Dave Brubeck',
      url: '../assets/music/Dave Brubeck - Take Five.mp3',
      type: 'Jazz',
      tag2: 'Soulful',
      tag3: 'Smooth',
    ),
    Song(
      title: 'You Never Even Called Me by My Name',
      artist: 'David Allen Coe',
      url:
          '../assets/music/David Allen Coe You Never Even Called Me by My Name.mp3',
      type: 'Country',
      tag2: 'Storytelling',
      tag3: 'Heartbreak',
    ),
    Song(
      title: 'Golden Years',
      artist: 'David Bowie',
      url: '../assets/music/David Bowie - Golden Years.mp3',
      type: 'Pop',
      tag2: 'Danceable',
      tag3: 'Classic',
    ),
    Song(
      title: 'Down With The Sickness',
      artist: 'Disturbed',
      url: '../assets/music/Disturbed - Down With The Sickness.mp3',
      type: 'Heavy Metal',
      tag2: 'Aggression',
      tag3: 'Darkness',
    ),
    Song(
      title: 'The Sound of Silence',
      artist: 'Disturbed',
      url: '../assets/music/Disturbed - The Sound Of Silence.mp3',
      type: 'Folk ',
      tag2: 'Reflective',
      tag3: 'Melancholy',
    ),
    Song(
      title: 'Bodies',
      artist: 'Drowning Pool',
      url: '../assets/music/Drowning Pool - Bodies.mp3',
      type: 'Heavy Metal',
      tag2: 'Aggression',
      tag3: 'Raw',
    ),
    Song(
      title: 'Levitating',
      artist: 'Dua Lipa ft. DaBaby',
      url: '../assets/music/Dua Lipa - Levitating Featuring DaBaby.mp3',
      type: 'Pop',
      tag2: 'Danceable',
      tag3: 'Fun',
    ),
    Song(
      title: 'The Way I am',
      artist: 'Eminem',
      url: '../assets/music/Eminem - The Way I Am.mp3',
      type: 'Hip-Hop',
      tag2: 'Aggression',
      tag3: 'Introspective',
    ),
    Song(
      title: 'Mockingbird',
      artist: 'Eminem',
      url: '../assets/music/Eminem - Mockingbird.mp3',
      type: 'Hip-Hop',
      tag2: 'Emotional',
      tag3: 'Storytelling',
    ),
    Song(
      title: 'Lose Yourself',
      artist: 'Eminem',
      url: '../assets/music/Eminem - Lose Yourself.mp3',
      type: 'Hip-Hop',
      tag2: 'Inspirational',
      tag3: 'Motivational',
    ),
    Song(
      title: 'Stan',
      artist: 'Eminem ft. Dido',
      url: '../assets/music/Eminem - Stan (Long Version) ft. Dido.mp3',
      type: 'Hip-Hop',
      tag2: 'Emotional',
      tag3: 'Storytelling',
    ),
    Song(
      title: 'Tears in Heaven',
      artist: 'Eric Clapton',
      url: '../assets/music/Eric Clapton - Tears In Heaven.mp3',
      type: 'Rock',
      tag2: 'Grief ',
      tag3: 'Loss',
    ),
    Song(
      title: 'My Immortal',
      artist: 'Evanescence',
      url: '../assets/music/Evanescence - My Immortal.mp3',
      type: 'Rock',
      tag2: 'Sadness',
      tag3: 'Introspective',
    ),
    Song(
      title: 'Dreams',
      artist: 'Fleetwood Mac',
      url: '../assets/music/Fleetwood Mac - Dreams.mp3',
      type: 'Rock',
      tag2: 'Emotional',
      tag3: 'Power Ballad',
    ),
    Song(
      title: 'Landslide',
      artist: 'Fleetwood Mac',
      url: '../assets/music/Fleetwood Mac - Landslide.mp3',
      type: 'Folk',
      tag2: 'Nostalgia',
      tag3: 'Melancholy',
    ),
    Song(
      title: 'The Pretender',
      artist: 'Foo Fighters',
      url: '../assets/music/Foo Fighters - The Pretender.mp3',
      type: 'Alternative Rock',
      tag2: 'Aggression',
      tag3: 'Rebellion',
    ),
    Song(
      title: 'Pumped Up Kicks',
      artist: 'Foster The People',
      url: '../assets/music/Foster The People - Pumped Up Kicks.mp3',
      type: 'Indie Pop',
      tag2: 'Catchy',
      tag3: 'Social Commentary',
    ),
    Song(
      title: 'Crazy',
      artist: 'Gnarls Barkley',
      url: '../assets/music/Gnarls Barkley - Crazy.mp3',
      type: 'Neo Soul',
      tag2: 'Catchy',
      tag3: 'Quirky',
    ),
    Song(
      title: 'The Message',
      artist: 'Grandmaster Flash & The Furious Five',
      url:
          '../assets/music/Grandmaster Flash & The Furious Five - The Message.mp3',
      type: 'Old School Hip Hop',
      tag2: 'Social Commentary',
      tag3: 'Classic',
    ),
    Song(
      title: 'November Rain',
      artist: 'Guns N\' Roses',
      url: '../assets/music/Guns N\' Roses - November Rain.mp3',
      type: 'Rock',
      tag2: 'Epic',
      tag3: 'Hope',
    ),
    Song(
      title: 'It Was A Good Day',
      artist: 'Ice Cube',
      url: '../assets/music/Ice Cube - It Was A Good Day.mp3',
      type: 'West Coast Hip Hop',
      tag2: 'Storytelling',
      tag3: 'Classic',
    ),
    Song(
      title: 'Hallelujah',
      artist: 'Jeff Buckey',
      url: '../assets/music/Jeff Buckley - Hallelujah.mp3',
      type: 'Folk',
      tag2: 'Melancholy',
      tag3: 'Spiritual',
    ),
    Song(
      title: 'Don\'t Stop Believin\'',
      artist: 'Journey',
      url: '../assets/music/Journey - Don\'t Stop Believin\'.mp3',
      type: 'Rock',
      tag2: 'Hope',
      tag3: 'Motivational',
    ),
    Song(
      title: 'HUMBLE',
      artist: 'Kendrick Lamar',
      url: '../assets/music/Kendrick Lamar - HUMBLE..mp3',
      type: 'Hip-Hop',
      tag2: 'Aggression',
      tag3: 'Confident',
    ),
    Song(
      title: 'All I Want',
      artist: 'Kodaline',
      url: '../assets/music/Kodaline - All I Want (Part 1).mp3',
      type: 'Indie Folk',
      tag2: 'Yearning',
      tag3: 'Heartbreak',
    ),
    Song(
      title: 'Summertime Sadness',
      artist: 'Lana Del Rey',
      url: '../assets/music/Lana Del Rey - Summertime Sadness.mp3',
      type: 'Pop',
      tag2: 'Melancholy',
      tag3: 'Love',
    ),
    Song(
      title: 'Video Games',
      artist: 'Lana Del Rey',
      url: '../assets/music/Lana Del Rey - Video Games.mp3',
      type: 'Pop',
      tag2: 'Melancholy',
      tag3: 'Dreamy',
    ),
    Song(
      title: 'Born To Die',
      artist: 'Lana Del Rey',
      url: '../assets/music/Lana Del Rey - Born To Die.mp3',
      type: 'Pop',
      tag2: 'Melancholy',
      tag3: 'Fatalistic',
    ),
    Song(
      title: 'Kashmir',
      artist: 'Led Zeppelin',
      url: '../assets/music/Kashmir - Led Zeppelin.mp3',
      type: 'Rock',
      tag2: 'Epic',
      tag3: 'Exotic',
    ),
    Song(
      title: 'Stairway To Heaven',
      artist: 'Led Zeppelin',
      url: '../assets/music/Led Zeppelin - Stairway To Heaven.mp3',
      type: 'Rock',
      tag2: 'Epic',
      tag3: 'Classic',
    ),
    Song(
      title: 'Break Stuff',
      artist: 'Limp Bizkit',
      url: '../assets/music/Limp Bizkit - Break Stuff.mp3',
      type: 'Nu metal',
      tag2: 'Aggression',
      tag3: 'Dissatisfaction',
    ),
    Song(
      title: 'Numb',
      artist: 'Linkin Park',
      url: '../assets/music/Linkin Park - Numb.mp3',
      type: 'Alternative Rock',
      tag2: 'Numbness',
      tag3: 'Despair',
    ),
    Song(
      title: 'The Night We Met',
      artist: 'Lord Huron',
      url: '../assets/music/Lord Huron - The Night We Met.mp3',
      type: 'Indie Rock',
      tag2: 'Melancholy',
      tag3: 'Romantic',
    ),
    Song(
      title: 'Weightless',
      artist: 'Marconi Union',
      url: '../assets/music/Marconi Union - Weightless.mp3',
      type: 'Ambient',
      tag2: 'Calming',
      tag3: 'Relaxing',
    ),
    Song(
      title: "What's Going On",
      artist: 'Marvin Gaye',
      url: '../assets/music/Marvin Gaye - What\'s Going On.mp3',
      type: 'Soul',
      tag2: 'Protest',
      tag3: 'Classic',
    ),
    Song(
      title: 'Thriller',
      artist: 'Michael Jackson',
      url: '../assets/music/Michael Jackson - Thriller.mp3',
      type: 'Pop',
      tag2: 'Smooth',
      tag3: 'Classic',
    ),
    Song(
      title: 'Porcelain',
      artist: 'Moby',
      url: '../assets/music/Moby - Porcelain.mp3',
      type: 'Electronic',
      tag2: 'Calming',
      tag3: 'Ambient',
    ),
    Song(
      title: 'Sweet Caroline',
      artist: 'Neil Diamond',
      url: '../assets/music/Neil Diamond - Sweet Caroline.mp3',
      type: 'Pop',
      tag2: 'Sing-Along',
      tag3: 'Feel-Good',
    ),
    Song(
      title: 'Feeling Good',
      artist: 'Nina Simone',
      url: '../assets/music/Nina Simone  Feeling Good.mp3',
      type: 'Jazz',
      tag2: 'Soulful',
      tag3: 'Powerful',
    ),
    Song(
      title: "Driver's License",
      artist: 'Olivia Rodrigo',
      url: '../assets/music/Olivia Rodrigo - drivers license.mp3',
      type: 'Pop',
      tag2: 'Heartfelt',
      tag3: 'Heartbreak',
    ),
    Song(
      title: 'Bohemian Rhapsody',
      artist: 'Queen',
      url: '../assets/music/Queen  Bohemian Rhapsody.mp3',
      type: 'Rock',
      tag2: 'Epic',
      tag3: 'Nostalgia',
    ),
    Song(
      title: 'Everybody Hurts',
      artist: 'R.E.M.',
      url: '../assets/music/R.E.M. - Everybody Hurts.mp3',
      type: 'Rock',
      tag2: 'Sadness',
      tag3: 'Hope',
    ),
    Song(
      title: 'How To Disappear Completely',
      artist: 'Radiohead',
      url: '../assets/music/Radiohead - How To Disappear Completely.mp3',
      type: 'Alternative Rock',
      tag2: 'Existential',
      tag3: 'Despair',
    ),
    Song(
      title: 'Bulls On Parade',
      artist: 'Rage Against The Machine',
      url: '../assets/music/Rage Against The Machine - Bulls On Parade.mp3',
      type: 'Rock',
      tag2: 'Rage',
      tag3: 'Protest',
    ),
    Song(
      title: 'Killing In The Name',
      artist: 'Rage Against The Machine',
      url: '../assets/music/Rage Against The Machine - Killing In the Name.mp3',
      type: 'Rock',
      tag2: 'Rage',
      tag3: 'Rebellion',
    ),
    Song(
      title: 'Unchained Melody',
      artist: 'Righteous Brothers',
      url: '../assets/music/Righteous Brothers - Unchained Melody.mp3',
      type: 'Pop',
      tag2: 'Love',
      tag3: 'Longing',
    ),
    Song(
      title: 'Dancing On My Own',
      artist: 'Robyn',
      url: '../assets/music/Robyn - Dancing On My Own.mp3',
      type: 'Pop',
      tag2: 'Empowerment',
      tag3: 'Heartbreak',
    ),
    Song(
      title: 'The Sound of Silence',
      artist: 'Simon & Garfunkel',
      url: '../assets/music/Simon & Garfunkel - The Sounds of Silence.mp3',
      type: 'Folk',
      tag2: 'Melancholy',
      tag3: 'Nostalgia',
    ),
    Song(
      title: 'Nothing Compares 2 U',
      artist: 'Sinéad O\'Connor',
      url: '../assets/music/Sinéad O\'Connor - Nothing Compares 2 U.mp3',
      type: 'Pop',
      tag2: 'Melancholy',
      tag3: 'Heartbreak',
    ),
    Song(
      title: 'Saturn',
      artist: 'Sleeping At Last',
      url: '../assets/music/Sleeping At Last - Saturn.mp3',
      type: 'Indie Pop',
      tag2: 'Calming',
      tag3: 'Emotional',
    ),
    Song(
      title: 'Before I Forget',
      artist: 'Slipknot',
      url: '../assets/music/Slipknot - Before I Forget.mp3',
      type: 'Alternative Rock',
      tag2: 'Rage',
      tag3: 'Fury',
    ),
    Song(
      title: 'Gin & Juice',
      artist: 'Snoop Dogg',
      url: '../assets/music/Snoop Dogg - Gin & Juice.mp3',
      type: 'West Coast Hip Hop',
      tag2: 'Party',
      tag3: 'Classic',
    ),
    Song(
      title: 'Superstition',
      artist: 'Stevie Wonder',
      url: '../assets/music/Stevie Wonder Superstition.mp3',
      type: 'Funk',
      tag2: 'Upbeat',
      tag3: 'Groovy',
    ),
    Song(
      title: 'Chop Suey!',
      artist: 'System Of A Down ',
      url: '../assets/music/System Of A Down - Chop Suey!.mp3',
      type: 'Alternative Metal',
      tag2: 'Aggression',
      tag3: 'Intensity',
    ),
    Song(
      title: 'I Want To Hold Your Hand',
      artist: 'The Beatles',
      url: '../assets/music/The Beatles - I Want To Hold Your Hand.mp3',
      type: 'Pop',
      tag2: 'Catchy',
      tag3: 'Love',
    ),
    Song(
      title: 'Hey Jude',
      artist: 'The Beatles',
      url: '../assets/music/The Beatles - Hey Jude.mp3',
      type: 'Pop',
      tag2: 'Sing-Along',
      tag3: 'Hope',
    ),
    Song(
      title: 'How to Save a Life',
      artist: 'The Fray',
      url: '../assets/music/The Fray - How to Save a Life.mp3',
      type: 'Alternative',
      tag2: 'Introspective',
      tag3: 'Emotional',
    ),
    Song(
      title: 'Juicy',
      artist: 'The Notorious B.I.G.',
      url: '../assets/music/The Notorious B.I.G. - Juicy.mp3',
      type: 'Hip-Hop',
      tag2: 'Nostalgia',
      tag3: 'Inspirational',
    ),
    Song(
      title: 'Hypnotize',
      artist: 'The Notorious B.I.G.',
      url: '../assets/music/The Notorious B.I.G. - Hypnotize.mp3',
      type: 'Hip-Hop',
      tag2: 'Smooth',
      tag3: 'Classic',
    ),
    Song(
      title: 'Hypnotize',
      artist: 'The Notorious B.I.G.',
      url: '../assets/music/The Notorious B.I.G. - Hypnotize.mp3',
      type: 'Hip-Hop',
      tag2: 'Smooth',
      tag3: 'Classic',
    ),
    Song(
      title: 'Save Your Tears',
      artist: 'The Weeknd',
      url: '../assets/music/The Weeknd - Save Your Tears.mp3',
      type: 'Pop',
      tag2: 'Heartfelt',
      tag3: 'Emotional',
    ),
    Song(
      title: 'Blinding Lights',
      artist: 'The Weeknd',
      url: '../assets/music/The Weeknd - Blinding Lights.mp3',
      type: 'Pop',
      tag2: 'Upbeat',
      tag3: '80s-Inspired',
    ),
    Song(
      title: 'Regulate',
      artist: 'Warren G',
      url: '../assets/music/Warren G - Regulate ft. Nate Dogg.mp3',
      type: 'Hip-Hop',
      tag2: 'Smooth',
      tag3: 'Protest',
    ),
    Song(
      title: 'I Will Always Love You',
      artist: 'Whitney Houston',
      url: '../assets/music/Whitney Houston - I Will Always Love You.mp3',
      type: 'Pop',
      tag2: 'Love',
      tag3: 'Heartbreak',
    ),
    Song(
      title: 'Unsteady',
      artist: 'X Ambassadors',
      url: '../assets/music/X Ambassadors - Unsteady.mp3',
      type: 'Alternative Rock',
      tag2: 'Uplifting',
      tag3: 'Emotional',
    ),
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
            type TEXT,
            tag2 TEXT,
            tag3 TEXT,
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
  Future<List<Song>> getPlaylistSongs(Playlist playlist) async {
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
  Future<int> getPlaylistID(int? userID, String title) async {
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
  Future<int> getSongID(String? title, String? artist, String? url,
      String? category, int? playlistID) async {
    final db = await initDB();

    final List<Map<String, dynamic>> queryResult = await db.query(
      'songs',
      where:
          'title = ? AND artist = ? AND url = ? AND category = ? AND playlistID = ?',
      whereArgs: [title, artist, url, category, playlistID],
    );

    if (queryResult.isNotEmpty) {
      return queryResult.first['id'];
    } else {
      return -1;
    }
  }

  List<String> Tags = [
    'Heavy Metal',
    'Hip-Hop',
    'Nu metal',
    'Electronic',
    'Ambient',
    'Indie Pop',
    'Neo Soul',
    'Pop',
    'Alternative Metal',
    'Alternative',
    'Rock',
    'Soul',
    'Alternative Rock',
    'Folk',
    'Indie Rock',
    'West Coast Hip Hop',
    'Old School Hip Hop',
    'Jazz',
    'Country',
    'Indie Folk ',
    'Aggression',
    '80s-Inspired',
    'Ambient',
    'Classic',
    'Calming',
    'Confident',
    'Catchy',
    'Darkness',
    'Chaos',
    'Despaire',
    'Collaboration',
    'Dissatisfaction',
    'Cool',
    'Dreamy',
    'Danceable',
    'Exotic',
    'Emotional',
    'Fatalistic',
    'Empowerment',
    'Feel-Good',
    'Epic',
    'Fun',
    'Existential',
    'Fury',
    'Frustration',
    'Groovy',
    'Grief',
    'Heartbreak',
    'Heartfelt',
    'Halloween',
    'Hope',
    'Intensity',
    'Inspirational',
    'Longing',
    'Introspective',
    'Loss',
    'Love',
    'Motivational',
    'Melancholy',
    'Power Ballad',
    'Melodramatic',
    'Powerful',
    'Nostalgia',
    'Quirky',
    'Numbness',
    'Raw',
    'Party',
    'Rebellion',
    'Protest',
    'Relaxing',
    'Rage',
    'Romantic',
    'Reflective',
    'Spiritual',
    'Regret',
    'Sadness',
    'Sing-Along',
    'Smooth',
    'Social Commentary',
    'Soulful',
    'Storytelling',
    'Thriller',
    'Upbeat',
    'Uplifting',
    'Violence',
    'Yearning'
  ];

  // Affective Computing
  Future<void> AffectiveComputing(List<Song> selectedSongs, int playlistID) async {
    List<int> indexes = List.generate(Tags.length, (index) => 0);
    List<int> SongScores = List.generate(Song.Songs.length, (index) => 0);
    for (int i = 0; i < selectedSongs.length - 1; i++) {
      String? type = selectedSongs[i].type;
      String? tag2 = selectedSongs[i].tag2;
      String? tag3 = selectedSongs[i].tag3;
      int index1 = Tags.indexOf(type!);
      int index2 = Tags.indexOf(tag2!);
      int index3 = Tags.indexOf(tag3!);
      
      indexes[index1]++;
      indexes[index2]++;
      indexes[index3]++;
    }
    for (int i = 0; i < Song.Songs.length - 1; i++) {
      String? type = Song.Songs[i].type;
      String? tag2 = Song.Songs[i].tag2;
      String? tag3 = Song.Songs[i].tag3;

      int index1 = Tags.indexOf(type!);
      int index2 = Tags.indexOf(tag2!);
      int index3 = Tags.indexOf(tag3!);

      if(index1 != -1 && index2 != -1 && index3 != -1){
        SongScores[i] += indexes[index1] + indexes[index2] + indexes[index3];
      } else {
        print('##############################################\n#########################\n##################');
      }
    }
    List<int> sortedSongScores = List.from(SongScores); // create a copy of the original list
    sortedSongScores.sort((a, b) => b.compareTo(a)); // sort the copied list in descending order
    List<int> BestSongScores = sortedSongScores.sublist(0, 5); // get the sublist of the first 5 elements
    List<int> BestoSongScoresIndexes = BestSongScores.map((number) => SongScores.indexOf(number)).toList(); // map each element to its index in the original list
    print('BEST SONG SCORES INDEXES');
    print(BestoSongScoresIndexes); 

    print('BEST SONG SCORES');
    print(BestSongScores);

    for(int i = 0; i < BestoSongScoresIndexes.length-1; i++) {
      final db = await initDB();
      Song.Songs[BestoSongScoresIndexes[i]].playlistID = playlistID;
    db.insert('songs', Song.Songs[BestoSongScoresIndexes[i]].toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }
}