import 'dart:async';

import 'package:anime_link/enuns/item_type.dart';
import 'package:anime_link/models/item_detalhes_model.dart';
import 'package:anime_link/screens/item_detalhes/cubit/item_detalhe_repository.dart';
import 'package:anime_link/screens/item_detalhes/cubit/item_detalhe_state.dart';
import 'package:flutter/material.dart';

class ItemDetalheCubit extends ChangeNotifier{
  
  // ignore: prefer_final_fields
  ItemDetalheState _state = ItemDetalheState(itemDetalhe: ItemDetalheModel.empty());
  final _stateController = StreamController<ItemDetalheState>();
  final ItemDetalheRepository repository = ItemDetalheRepository();
  
  ItemDetalheState get state => _state;
  Stream<ItemDetalheState> get stateController => _stateController.stream;

  @override
  void dispose() {
    _stateController.close();
    super.dispose();
  }

  Future<void> traduzir() async{
    try {
      if(_state.itemDetalhe.synopsis == null){
        return;
      }

     _stateController.add(_state.copyWith(loading: true));

      ItemDetalheModel itemDetalhe = _state.itemDetalhe;

      itemDetalhe.synopsis = await repository.traduzir(itemDetalhe.synopsis!);

      _state = _state.copyWith(loading: false, itemDetalhe: itemDetalhe);
      _stateController.add(_state);
    } catch (error) {
      _stateController.add(_state.copyWith(error: true, loading: false, errorMessage: "Falha ao traduzir a sinopse!"));
    }
  }

  Future<void> buscaDetalhesItem(ItemType type, int id) async{
    if(type == ItemType.mangas){
      buscaDetalhesMangas(id);
    }

    if(type == ItemType.animes){
      buscaDetalhesAnimes(id);
    }
  }

  Future<void> buscaDetalhesAnimes(int id) async{
    try {
     _stateController.add(_state.copyWith(loading: true));

      ItemDetalheModel itemDetalhe = await repository.buscaDetalhesAnimes(id);

      _state = _state.copyWith(loading: false, itemDetalhe: itemDetalhe);
      await traduzir();
      _stateController.add(_state);
    } catch (error) {
      _stateController.add(_state.copyWith(error: true, loading: false, errorMessage: "Falha ao buscar detralhes do Anime!"));
    }
  }

  Future<void> buscaDetalhesMangas(int id) async{
    try {
     _stateController.add(_state.copyWith(loading: true));

      ItemDetalheModel itemDetalhe = await repository.buscaDetalhesMangas(id);

      _state = _state.copyWith(loading: false, itemDetalhe: itemDetalhe);
      await traduzir();
      _stateController.add(_state);
    } catch (error) {
      _stateController.add(_state.copyWith(error: true, loading: false, errorMessage: "Falha ao buscar detalhes do manga!"));
    }
  }
}