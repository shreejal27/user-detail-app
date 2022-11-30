import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:userdetail/model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Map<String, dynamic>? data;

//   @override
//   void initState() {
//     super.initState();
//     fetchPhotos();
//   }

//   fetchPhotos() async {
//     try {
//       var url = Uri.https(
//         'jsonplaceholder.typicode.com',
//         'photos',
//       );
//       final response = await http.get(url);
//       // print(response.statusCode);
//       // print(response.body.runtimeType);

//       final decodedResponse = jsonDecode(response.body);

//       // print("decoded Response: ${decodedResponse.runtimeType}");
//       // decodedResponse[0] as Map<String, dynamic>;
//        final photoList = decodedResponse.map((e) => Photo.fromJson(e)).toList();
//        photos = photoList;
//     } catch (e) {
//       print('error $e');
//     }
//   }

class _HomePageState extends State<HomePage> {
  List<Note> _notes = List<Note>();

  Future<List<Note>> fetchNotes() async {
    var url = 'https://jsonplaceholder.typicode.com/users';
    var response = await http.get(url);

    var notes = List<Note>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(User.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      _notes[index].title,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    _notes[index].text,
                  ],
                ),
              ),
            );
          },
          itemCount: _notes.length,
        ));
  }
}
