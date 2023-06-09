
import 'package:anime_link/models/item_rank_model.dart';

class HomeState {
  final List<ItemRankModel> itensRank;
  final bool loading;
  final bool error;
  final String? errorMessage;

  HomeState({
    required this.itensRank,
    this.loading = false,
    this.error = false,
    this.errorMessage,
  });

  copyWith({
    List<ItemRankModel>? itensRank,
    bool? loading,
    bool? error,
    String? errorMessage,
  }) {
    return HomeState(
      itensRank: itensRank ?? this.itensRank,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
