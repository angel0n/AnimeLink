import 'package:anime_link/models/item_detalhes_model.dart';

class ItemDetalheState {
  final ItemDetalheModel itemDetalhe;
  final bool loading;
  final bool error;
  final String? errorMessage;

  ItemDetalheState({
    required this.itemDetalhe,
    this.loading = false,
    this.error = false,
    this.errorMessage,
  });

  copyWith({
    ItemDetalheModel? itemDetalhe,
    bool? loading,
    bool? error,
    String? errorMessage,
  }) {
    return ItemDetalheState(
      itemDetalhe: itemDetalhe ?? this.itemDetalhe,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
