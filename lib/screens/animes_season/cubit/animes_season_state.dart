import 'package:anime_link/enuns/seasons.dart';
import 'package:anime_link/models/item_season_model.dart';

class AnimesSeasonState {
  final Seasons season;
  final int year;
  final List<ItemSeasonModel> listItemSeason;
  final int page;
  final bool loading;
  final bool error;
  final bool lastPage;
  final String? errorMessage;

  AnimesSeasonState({
    this.loading = false,
    this.error = false,
    this.lastPage = false,
    this.errorMessage,
    required this.season,
    required this.year,
    required this.listItemSeason,
    required this.page,

  });

  copyWith({
    bool? loading,
    bool? error,
    bool? lastPage,
    String? errorMessage,
    Seasons? season,
    int? year,
    int? page,
    List<ItemSeasonModel>? listItemSeason,
  }) {
    return AnimesSeasonState(
      listItemSeason: listItemSeason ?? this.listItemSeason,
      season: season ?? this.season,
      year: year ?? this.year,
      page: page ?? this.page,
      error: error ?? this.error,
      lastPage: lastPage ?? this.lastPage,
      errorMessage: errorMessage ?? this.errorMessage,
      loading: loading ?? this.loading,
    );
  }
}
