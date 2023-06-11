import 'package:anime_link/models/item_rank_model.dart';

class ItemSeasonModel {
  final int id;
  final String title;
  final String mainPictureMedium;
  final String mainPictureLarge;

  ItemSeasonModel({
    required this.id,
    required this.title,
    required this.mainPictureMedium,
    required this.mainPictureLarge,
  });

  ItemSeasonModel.fromJson(Map<String, dynamic> json) :
  id = json["node"]["id"],
  mainPictureMedium = json["node"]["main_picture"]["medium"],
  mainPictureLarge = json["node"]["main_picture"]["large"],
  title = json["node"]["title"];

  ItemRankModel toItemRankModel(){
    return ItemRankModel(
      id: id,
      mainPictureLarge: mainPictureLarge,
      mainPictureMedium: mainPictureMedium,
      title: title,
      rank: 0
    );
  }
}
