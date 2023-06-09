import 'dart:async';

import 'package:anime_link/models/item_rank_model.dart';
import 'package:anime_link/screens/home/cubit/home_repository.dart';
import 'package:anime_link/screens/home/cubit/home_state.dart';
import 'package:flutter/material.dart';

class HomeCubit extends ChangeNotifier{
  // ignore: prefer_final_fields
  HomeState _state = HomeState(itensRank: List.empty());
  final _stateController = StreamController<HomeState>();
  final HomeRepository repository = HomeRepository();

  HomeState get state => _state;
  Stream<HomeState> get stateController => _stateController.stream;

  @override
  void dispose() {
    _stateController.close();
    super.dispose();
  }

  void trocaListaRanked(int index){
    if(index == 0){
      buscaAnimeRanked();
    }

    if(index == 1){
      buscaMangaRanked();
    }

  }

  Future<void> buscaAnimeRanked() async{
    try {
      _stateController.add(_state.copyWith(loading: true));
      
      List<ItemRankModel> list = await repository.buscaAnimeRanked();
      
      _state = _state.copyWith(itensRank: list);
      _stateController.add(_state);
    } catch (error) {
      _stateController.add(_state.copyWith(error: true, loading: false, errorMessage: error.toString().replaceAll("Exception:", "")));
    }
  }

  Future<void> buscaMangaRanked() async{
    try {
      _stateController.add(_state.copyWith(loading: true));
      
      List<ItemRankModel> list = await repository.buscaMangaRanked();
      
      _state = _state.copyWith(itensRank: list);
      _stateController.add(_state);
    } catch (error) {
      _stateController.add(_state.copyWith(error: true, loading: false, errorMessage: error.toString().replaceAll("Exception:", "")));
    }
  }
}