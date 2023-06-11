import 'package:anime_link/components/custom_alert_dialog.dart';
import 'package:anime_link/components/item_rank_component.dart';
import 'package:anime_link/components/navigation_drawer.dart';
import 'package:anime_link/components/season_filter.dart';
import 'package:anime_link/components/year_filter.dart';
import 'package:anime_link/enuns/item_type.dart';
import 'package:anime_link/enuns/seasons.dart';
import 'package:anime_link/models/item_rank_model.dart';
import 'package:anime_link/screens/animes_season/cubit/animes_season_cubit.dart';
import 'package:anime_link/screens/animes_season/cubit/animes_season_state.dart';
import 'package:flutter/material.dart';

class AnimesSeasonScreen extends StatefulWidget {
  const AnimesSeasonScreen({super.key});

  @override
  State<AnimesSeasonScreen> createState() => _AnimesSeasonScreenState();
}

class _AnimesSeasonScreenState extends State<AnimesSeasonScreen> {
  final AnimesSeasonCubit cubit = AnimesSeasonCubit();
  @override
  void initState() {
    super.initState();
    cubit.buscaAnimes();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimeLink"),
      ),
      drawer: const CustomNavigationDrawer(),
      body: StreamBuilder(
        stream: cubit.stateController,
        initialData: cubit.state,
        builder: (context, snapshot) {
          AnimesSeasonState state = snapshot.data!;

          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.error) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              customAlertDialog(
                context: context,
                title: "Ops...",
                descricao: state.errorMessage!,
              );
            });
          }

          return ListView.builder(
            itemCount: state.listItemSeason.length + 1,
            itemBuilder: (context, index) {
              if(index == 0){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: SeasonFilter(
                              season: state.season,
                              onChanged: cubit.trocarSeason)),
                      Expanded(
                        child: YearFilter(
                            year: state.year, onChanged: cubit.trocarYear),
                      ),
                    ],
                  ),
                );
              }

              if((index >= state.listItemSeason.length) && !state.lastPage ){
                cubit.buscaProximosAnimes();
                return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
              }
              return ItemRankComponent(
                itemRank: state.listItemSeason[index - 1].toItemRankModel(),
                type: ItemType.animes,
              );
            },
          );
        },
      ),
    );
  }
}
