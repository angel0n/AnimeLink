import 'dart:convert';

import 'package:anime_link/models/item_rank_model.dart';
import 'package:anime_link/requests/client_request.dart';

class HomeRepository {
  Future<List<ItemRankModel>> buscaAnimeRanked() async {
    ClientRequest request = await ClientRequest.create()
    .endPoint("/v2/anime/ranking")
    .param("limit", 50)
    .get();

    dynamic response = request.getResponse();

    dynamic list = jsonDecode(response);

    List<dynamic> datas = list["data"];

    return datas.map((element) => ItemRankModel.fromJson(element)).toList();
  }

  Future<List<ItemRankModel>> buscaMangaRanked() async {
    ClientRequest request = await ClientRequest.create()
    .endPoint("/v2/manga/ranking")
    .param("limit", 50)
    .get();

    dynamic response = request.getResponse();

    dynamic list = jsonDecode(response);

    List<dynamic> datas = list["data"];

    return datas.map((element) => ItemRankModel.fromJson(element)).toList();
  }
}
