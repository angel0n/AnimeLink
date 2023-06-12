import 'dart:async';

import 'package:anime_link/screens/busca/cubit/busca_repository.dart';
import 'package:anime_link/screens/busca/cubit/busca_state.dart';
import 'package:flutter/material.dart';

class BuscaCubit extends ChangeNotifier{
  BuscaState _state = BuscaState();
  final _stateController = StreamController<BuscaState>();
  final BuscaRepository repository = BuscaRepository();

  @override
  void dispose() {
    _stateController.close();
    super.dispose();
  }
}