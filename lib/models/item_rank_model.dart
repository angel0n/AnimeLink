class ItemRankModel {
  final int id;
  final String title;
  final String mainPictureMedium;
  final String mainPictureLarge;
  final int rank;

  ItemRankModel({
    required this.id,
    required this.title,
    required this.mainPictureMedium,
    required this.mainPictureLarge,
    required this.rank,
  });

  ItemRankModel.fromJson(Map<String, dynamic> json) :
  id = json["node"]["id"],
  mainPictureMedium = json["node"]["main_picture"]["medium"],
  mainPictureLarge = json["node"]["main_picture"]["large"],
  title = json["node"]["title"],
  rank = json["ranking"]["rank"];

}
