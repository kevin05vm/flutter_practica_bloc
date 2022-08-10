import 'package:http/http.dart' as http;

import 'package:flutter_practica_bloc/models/meme.dart';

class MemesRepository {
  
  final String _urlApi = 'api.imgflip.com';
  final String _endPointMemes = 'get_memes';
  
  Future<List<Meme>>getMemes() async {
    final response = await http.get(Uri.http(_urlApi, _endPointMemes));
    if (response.statusCode == 200) {
      final data = typesFromMap(response.body);
      return data.data.memes;
    }
    else {
      throw Exception("Error in api.imgflip.com");
    }
  }
  
}