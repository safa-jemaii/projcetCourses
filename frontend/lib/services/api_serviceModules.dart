import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontend/models/Courses.dart';
import 'package:http/http.dart';

//ALL THE CRUD METHODS WILL BE FOUND HERE
class ApiService {
  final Uri apiUrl = Uri.parse("http://192.168.1.11:3000/modules");

  //GET METHOD (ALL)
  Future<List<Courses>> getCourses() async {
    Response res = await get(
        apiUrl );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Courses> courses =
      body.map((dynamic item) => Courses.fromJson(item)).toList();
      return courses;

    } else {
      throw "Failed to load courses list";
    }

  }

  //GET METHOD (per id)
  Future<Courses> getEventById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Courses.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a courses');
    }
  }

  //POST METHOD
  Future<Courses> createEvent(Courses events) async {
    Map data = {
      'name': events.name,
      'imageUrl': events.imageUrl,
      'date': events.date,
      'duree': events.duree,
      'description': events.description,
      'updated': events.updated
    };

    final Response response = await post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
      return Courses.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post courses');
    }
  }

  //UPDATE METHOD
  Future<Courses> updateCases(String id, Courses courses) async {
    Map data = {
      'name': courses.name,
      'imageUrl': courses.imageUrl,
      'date': courses.date,
      'duree': courses.duree,
      'description': courses.description,
      'updated': courses.updated
    };

    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Courses.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a courses');
    }
  }

  //DELETE METHOD
  Future<void> deleteCase(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      debugPrint("course deleted");
    } else {
      throw "Failed to delete a course.";
    }
  }
}
