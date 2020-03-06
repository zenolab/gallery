import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:online_gallery/data/model/gellary_response.dart';
import 'package:online_gallery/data/utils/avaiablility_network.dart';
import 'package:online_gallery/domain/models/photo.dart';
import 'package:online_gallery/domain/repository/repository.dart';


import '../network_config.dart';

class MainPhotoRepository implements BaseRepository {
  bool _connected;

  @override
  Future<List<Photo>> getData() async {
    await checkConnectivity().then((internet) => _connected = internet);
    if (_connected) {
      return await get(fullUrl).then(_handleResponse).catchError((error) {
        throw "Error connection : " + error;
      }).whenComplete(() => print('-- TaskService completed'));
    } else {
      throw "Not accessible internet";
    }
  }

  FutureOr<List<Photo>> _handleResponse(Response response) {
    if (response.statusCode == 200) {
      List<Photo> list = GalleryResponse.fromJsonArray(json.decode(response.body)).results;
      return list;
    } else {
      throw Exception("Exception. Failed connection. Status code: ${response.statusCode}");
    }
  }
}
