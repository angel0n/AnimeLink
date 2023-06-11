import 'dart:async';

import 'package:anime_link/enuns/seasons.dart';
import 'package:anime_link/models/item_season_model.dart';
import 'package:anime_link/screens/animes_season/cubit/animes_season_repository.dart';
import 'package:anime_link/screens/animes_season/cubit/animes_season_state.dart';
import 'package:flutter/material.dart';

class AnimesSeasonCubit extends ChangeNotifier {
  // ignore: prefer_final_fields
  AnimesSeasonState _state = AnimesSeasonState(
    listItemSeason: List.empty(),
    season: Seasons.winter,
    year: DateTime.now().year,
    page: 1,
  );
  final _stateController = StreamController<AnimesSeasonState>();
  final AnimesSeasonRepository repository = AnimesSeasonRepository();

  AnimesSeasonState get state => _state;
  Stream<AnimesSeasonState> get stateController => _stateController.stream;

  @override
  void dispose() {
    _stateController.close();
    super.dispose();
  }

  void trocarSeason(String? season) {
    if (season == null) {
      return;
    }
    _state = _state.copyWith(season: Seasons.values.byName(season));
    _stateController.add(_state);

    buscaAnimes();
  }

  void trocarYear(String? year) {
    if (year == null) {
      return;
    }
    _state = _state.copyWith(year: int.parse(year));
    _stateController.add(_state);

    buscaAnimes();
  }

  void buscaAnimes() async {
    try {
      _stateController.add(_state.copyWith(loading: true));

      List<ItemSeasonModel> list =
          await repository.buscaAnimes(_state.season.name, _state.year);

      _state = _state.copyWith(loading: false, listItemSeason: list);
      _stateController.add(_state);
    } catch (error) {
      _stateController.add(_state.copyWith(
          error: true,
          loading: false,
          errorMessage: error.toString().replaceAll("Exception:", "")));
    }
  }

  Future<void> buscaProximosAnimes() async {
    try {
      List<ItemSeasonModel> list = await repository.buscaProximosAnimes(
          _state.season.name, _state.year, _state.page + 1);
      List<ItemSeasonModel> newList = _state.listItemSeason;
      newList.addAll(list);
      if (list.isEmpty) {
        _state = _state.copyWith(lastPage: true);
        _stateController.add(_state);
        return;
      }
      _state = _state.copyWith(page: _state.page + 1, listItemSeason: newList);
      _stateController.add(_state);
    } catch (error) {
      _stateController.add(_state.copyWith(
          error: true,
          errorMessage: error.toString().replaceAll("Exception:", "")));
    }
  }
}
