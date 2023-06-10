import 'dart:convert';

import 'package:anime_link/models/item_detalhes_model.dart';
import 'package:anime_link/requests/client_request.dart';
import 'package:translator/translator.dart';

class ItemDetalheRepository{
  Future<ItemDetalheModel> buscaDetalhesAnimes(int id) async{
    ClientRequest request = await ClientRequest.create()
    .endPoint("/v2/anime/$id")
    .param("fields", ItemDetalheModel.fieldsAnime)
    .get();

    Map<String, dynamic> response = jsonDecode(request.getResponse());

    ItemDetalheModel itemDetalhe = ItemDetalheModel.fromJson(response);

    return itemDetalhe;
  }

  Future<ItemDetalheModel> buscaDetalhesMangas(int id) async{
    ClientRequest request = await ClientRequest.create()
    .endPoint("/v2/manga/$id")
    .param("fields", ItemDetalheModel.fieldsManga)
    .get();

    Map<String, dynamic> response = jsonDecode(request.getResponse());

    ItemDetalheModel itemDetalhe = ItemDetalheModel.fromJson(response);
    
    return itemDetalhe;
  }

  Future<String> traduzir(String synopsis ) async{
    final translator = GoogleTranslator();
    Translation traduzido = await translator.translate(synopsis, from: 'en', to: 'pt');
    return traduzido.text.replaceAll("[Escrito por Mal Rewrite]", "");
  }
}