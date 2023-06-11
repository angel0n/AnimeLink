
import 'dart:convert';

import 'package:anime_link/models/item_season_model.dart';
import 'package:anime_link/requests/client_request.dart';

class AnimesSeasonRepository {
  Future<List<ItemSeasonModel>> buscaAnimes(String season, int year ) async{
    ClientRequest request = await ClientRequest.create()
    .endPoint("/v2/anime/season/$year/$season")
    .param("limit", 50)
    .get();

    dynamic response = request.getResponse();

    dynamic list = jsonDecode(response);

    List<dynamic> datas = list["data"];

    return datas.map((element) => ItemSeasonModel.fromJson(element)).toList();
  }

  Future<List<ItemSeasonModel>> buscaProximosAnimes(String season, int year, int page ) async{
    ClientRequest request = await ClientRequest.create()
    .endPoint("/v2/anime/season/$year/$season")
    .param("limit", 50)
    .param("offset", 50 * (page - 1))
    .get();

    dynamic response = request.getResponse();

    dynamic list = jsonDecode(response);

    List<dynamic> datas = list["data"];

    return datas.map((element) => ItemSeasonModel.fromJson(element)).toList();
  }
}