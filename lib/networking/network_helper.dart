import 'package:flutter_unsplash/models/sample_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

 static const String url = 'https://api.unsplash.com';
 static const String apiKey = 'ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';
  Map<String, String> _headers = {
    'Authorization' : 'Client-ID $apiKey'
  };

  Future<List<SampleImage>> getImagesList() async{
    http.Response response = await http.get('$url/photos?per_page=30', headers: _headers);
    if(response.statusCode == 200){
      final List imagesList = json.decode(utf8.decode(response.bodyBytes));
      return imagesList.map<SampleImage>((json) => SampleImage.fromJson(json)).toList();
    }else{
      print(response.statusCode);
      return null;
    }
  }
}