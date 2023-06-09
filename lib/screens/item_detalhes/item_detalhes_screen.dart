import 'package:anime_link/components/item_detalhe_body.dart';
import 'package:anime_link/components/item_detalhe_header.dart';
import 'package:anime_link/enuns/item_type.dart';
import 'package:anime_link/screens/item_detalhes/cubit/item_detalhe_cubit.dart';
import 'package:anime_link/screens/item_detalhes/cubit/item_detalhe_state.dart';
import 'package:flutter/material.dart';

class ItemDetalhesScreen extends StatefulWidget {
  final int itemId;
  final ItemType type;

  const ItemDetalhesScreen({super.key, required this.itemId, required this.type});

  @override
  State<ItemDetalhesScreen> createState() => _ItemDetalhesScreenState();
}

class _ItemDetalhesScreenState extends State<ItemDetalhesScreen> {
  ItemDetalheCubit cubit = ItemDetalheCubit();

  @override
  void initState() {
    super.initState();
    cubit.buscaDetalhesItem(widget.type, widget.itemId);
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimeLink"),
      ),
      body: StreamBuilder(
        stream: cubit.stateController,
        initialData: cubit.state,
        builder: (context, snapshot) {
          ItemDetalheState state = snapshot.data!;
          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.error) {
            return Center(
              child: Text(state.errorMessage!),
            );
          }

          return ListView(
            children: [
              ItemDetalheHeader(
                pictureMedium: state.itemDetalhe.mainPictureMedium ?? "",
                title: state.itemDetalhe.title ?? "",
                rank: state.itemDetalhe.rank,
                status: state.itemDetalhe.status ?? "",
                dateStart: state.itemDetalhe.startDate,
                dateEnd: state.itemDetalhe.endDate,
                startSeason: state.itemDetalhe.startSeassonSeason,
                startSeasonYear: state.itemDetalhe.startSeassonYear,
                numEpisodes: state.itemDetalhe.numEpisodes,
              ),
              ItemDetalheBody(
                genres: state.itemDetalhe.genres,
                sinopse: state.itemDetalhe.synopsis ?? "",
              ),
            ],
          );
        },
      ),
    );
  }
}
