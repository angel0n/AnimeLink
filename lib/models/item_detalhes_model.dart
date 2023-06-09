import 'package:anime_link/models/genres_model.dart';

class ItemDetalheModel {
  int? id;
  String? title;
  String? mainPictureMedium;
  String? mainPictureLarge;
  String? startDate;
  String? endDate;
  String? synopsis;
  int? rank;
  int? numScoringUsers;
  String? status;
  List<GenresModel>? genres;
  int? numVolumes;
  int? numChapters;
  int? numEpisodes;
  int? startSeassonYear;
  String? startSeassonSeason;

  ItemDetalheModel({
    required this.id,
    required this.title,
    required this.mainPictureMedium,
    required this.mainPictureLarge,
    required this.synopsis,
    required this.numScoringUsers,
    required this.status,
    this.startDate,
    this.endDate,
    this.rank,
    this.genres,
    this.numVolumes,
    this.numChapters,
    this.numEpisodes,
    this.startSeassonYear,
    this.startSeassonSeason,
  });

  ItemDetalheModel.empty();

  fromJson(Map<String, dynamic> json){
    id = json["id"];
    title = json["title"];
    mainPictureMedium = json["main_picture"]["medium"];
    mainPictureLarge = json["main_picture"]["large"];
    synopsis = json["synopsis"];
    numScoringUsers = json["num_scoring_users"];
    status = json["status"];
    startDate = json["start_date"];
    endDate = json["end_date"];
    rank = json["rank"];
    numVolumes = json["num_volumes"];
    numChapters = json["num_chapters"];
    numEpisodes = json["num_episodes"];
    
    if(json["start_seasson"] != null){
      startSeassonYear = json["start_seasson"]["year"];
      startSeassonSeason = json["start_seasson"]["season"];
    }

    if(json["genres"] !=null){
      List<dynamic> listaGenres = json["genres"];
      genres = listaGenres.map((e) => GenresModel.fromJson(e)).toList();
    }
  }
    
}
