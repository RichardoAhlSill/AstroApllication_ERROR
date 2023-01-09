import 'dart:async';
import 'dart:convert';

import 'package:astroapp/domain/nasa.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NasaApi {

  Future<Nasa> listarApi() async {
    var uri = "https://api.nasa.gov/planetary/apod?api_key=dYsZcaxdFDf8x9NrPrLTEDaX3zYesaz4T8OgYjih";
    var url = Uri.parse(uri);
    var response = await http.get(url);
    print("Response:${response.body}");

    List<Nasa> lista = <Nasa>[];
    print("Teste Lista1: ${lista}");

    late Nasa nasa;

    try {
      print("Response Status: ${response.statusCode}");
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        print(result);
        nasa = Nasa.fromApiNasaJson(result);
        print(nasa);
      }
    } catch (e) {
      throw Exception("Erro");
    }


    return nasa;

  }
}