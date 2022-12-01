import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:userdetail/model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> userList = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  fetchUsers() async {
    // try {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    final decodedResponse = jsonDecode(response.body) as List;
    final users = decodedResponse.map((e) => User.fromJson(e)).toList();

    setState(() {
      userList = users;
    });
    // } catch (e) {
    //   log(e.toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'id: ${userList[index].id}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Name: ${userList[index].name}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Email: ${userList[index].email}',
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      'Address: ${userList[index].address.city}',
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      'Phone Number: ${userList[index].phone}',
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      'Latitude: ${userList[index].address.geo.lat}',
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
