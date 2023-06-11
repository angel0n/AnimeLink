import 'package:anime_link/components/custom_alert_dialog.dart';
import 'package:anime_link/components/item_rank_component.dart';
import 'package:anime_link/components/navigation_drawer.dart';
import 'package:anime_link/enuns/item_type.dart';
import 'package:anime_link/screens/home/cubit/home_cubit.dart';
import 'package:anime_link/screens/home/cubit/home_state.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeCubit cubit = HomeCubit();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    cubit.buscaAnimeRanked();
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
      drawer: const CustomNavigationDrawer(),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: cubit.stateController,
          initialData: cubit.state,
          builder: (context, snapshot) {
            HomeState state = snapshot.data!;
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

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Rank ${currentIndex == 0 ? "Animes" : "Mangas"} (My Anime List)",
                    style: const TextStyle(
                      fontSize: 25
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.itensRank
                      .map((element){
                        return ItemRankComponent(
                            itemRank: element,
                            type: currentIndex == 0 ? ItemType.animes : ItemType.mangas,
                          );
                      } )
                      .toList(),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Animes"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Mangas"),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          cubit.trocaListaRanked(index);
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
