import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Facts {
  String text;
  String baseUrl = 'https://cat-fact.herokuapp.com';
  
  Future <void> getFacts() async {
    Response response = await get('$baseUrl/facts/random?animal_type=cat&amount=1');
    Map data = jsonDecode(response.body);
    text = data['text'];
  }
}


