import 'package:anime_link/screens/animes_season/animes_season_screen.dart';
import 'package:anime_link/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [buildHeader(context), buildMenuItems(context)],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.star_half_sharp),
          title: const Text("Ranking"),
          onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          )),
        ),
        ListTile(
          leading: const Icon(Icons.collections_bookmark_outlined),
          title: const Text("Temporada"),
          onTap: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const AnimesSeasonScreen(),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.search),
          title: const Text("Busca"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.forum),
          title: const Text("Forum"),
          onTap: () {},
        )
      ],
    );
  }
}
