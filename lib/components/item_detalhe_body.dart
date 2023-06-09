import 'package:anime_link/models/genres_model.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ItemDetalheBody extends StatelessWidget {
  const ItemDetalheBody({
    super.key,
    required this.genres,
    required this.sinopse,
  });

  final List<GenresModel>? genres;
  final String sinopse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildGeneros(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(sinopse.replaceAll("[Written by MAL Rewrite]", "")),
          )
        ],
      ),
    );
  }

  Widget buildGeneros() {
    List<GenresModel> generos = List.empty();
    if(genres != null){
      generos = genres!;
    }
    List<Widget> badges = [];

    for (var genero in generos) {
      Widget badge = buildItemBadge(genero.name);
      badges.add(badge);
    }

    return Wrap(
      runSpacing: 3.0,
      spacing: 3.0,
      alignment: WrapAlignment.center,
      children: badges,
    );
  }

  Widget buildItemBadge(String text) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -10, end: -12),
        showBadge: true,
        ignorePointer: false,
        onTap: () {},
        badgeContent: Text(text),
        badgeStyle: badges.BadgeStyle(
          shape: badges.BadgeShape.square,
          padding: const EdgeInsets.all(7.0),
          borderRadius: BorderRadius.circular(7),
          badgeColor: Colors.grey.shade300,
        ),
      ),
    );
  }
}
