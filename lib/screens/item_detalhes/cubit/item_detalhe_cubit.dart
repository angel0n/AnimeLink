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

  Future<void> buscaDetalhesItem(ItemType type, int id) async{
    if(type == ItemType.mangas){
      buscaDetalhesMangas();
    }

    if(type == ItemType.animes){
      buscaDetalhesAnimes(id);
    }
  }

  Future<void> buscaDetalhesAnimes(int id) async{
    try {
     _stateController.add(_state.copyWith(loading: true));

      await repository.buscaDetalhesAnimes(id);

    } catch (error) {
      _stateController.add(_state.copyWith(error: true, loading: false, errorMessage: error.toString().replaceAll("Exception:", "")));
    }
  }

  Future<void> buscaDetalhesMangas() async{
    try {
     
    } catch (error) {
      _stateController.add(_state.copyWith(error: true, loading: false, errorMessage: error.toString().replaceAll("Exception:", "")));
    }
  }
}