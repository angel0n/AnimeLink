import 'package:anime_link/enuns/item_type.dart';
import 'package:anime_link/models/item_rank_model.dart';
import 'package:anime_link/screens/item_detalhes/item_detalhes_screen.dart';
import 'package:flutter/material.dart';

class ItemRankComponent extends StatefulWidget {
  final ItemRankModel itemRank;
  final ItemType type;
  const ItemRankComponent(
      {super.key, required this.itemRank, required this.type});

  @override
  State<ItemRankComponent> createState() => _ItemRankComponentState();
}

class _ItemRankComponentState extends State<ItemRankComponent> {
  @override
  Widget build(BuildContext context) {
    ItemRankModel itemRank = widget.itemRank;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: ListTile(
        leading: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 100,maxWidth: 35),
            child: Image.network(itemRank.mainPictureMedium)),
        title: Text(itemRank.title),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ItemDetalhesScreen(itemId: itemRank.id, type: widget.type),
          ));
        },
      ),
    );
  }
}
