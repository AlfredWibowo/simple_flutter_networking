import 'dart:convert';

import 'package:networking/class/dataClass.dart';
import 'package:http/http.dart' as http;

class Service {
  String urlAPI1 = 'https://6283762138279cef71d77f41.mockapi.io/api/v1/Data';
  String urlAPI2 = 'https://6283762138279cef71d77f41.mockapi.io/api/v1/data2';

  Future<List<cData>> getAllData() async {
    final response = await http.get(Uri.parse(urlAPI2));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => cData.fromJson(data)).toList();
    }
    else {
      throw Exception('Failed to load Data');
    }
  }

  Future postData(
    String pNama,
    String pAvatar,
    String pAlamat,
    String pEmail,
    String pPekerjaan,
    String pQuote,
  ) async {
    final response = await http.post(Uri.parse(urlAPI2),
      body: {
        'nama': pNama,
        'avatar': pAvatar,
        'alamat': pAlamat,
        'email': pEmail,
        'pekerjaan': pPekerjaan,
        'quote': pQuote
      }
    );

    if (response.statusCode == 201) {
      return true;
    }
    else {
      throw Exception('Failed to post Data');
    }
  }

  Future<cData> getSingleData(String id) async {
    final response = await http.get(Uri.parse(urlAPI2 + '/$id'));

    if (response.statusCode == 200) {
      cData jsonResponse = cData.fromJson(json.decode(response.body));
      return jsonResponse;
    }
    else {
      throw Exception('Failed to get Data');
    }
  }

  Future<bool> deleteData(String id) async {
    final response = await http.delete(Uri.parse(urlAPI2 + '/$id'));

    if (response.statusCode == 200) {
      return true;
    }
    else {
      throw Exception('Failed to get Data');
    }
  }
}