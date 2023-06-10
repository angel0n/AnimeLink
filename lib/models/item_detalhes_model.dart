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
  static String fieldsAnime = "id,title,main_picture,start_date,end_date,synopsis,rank,num_scoring_users,status,genres,num_episodes,start_season,studios";
  static String fieldsManga = "id,title,main_picture,start_date,end_date,synopsis,rank,num_scoring_users,status,genres,num_volumes,num_chapters";

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

  ItemDetalheModel.fromJson(Map<String, dynamic> json){
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
    
    if(json["start_season"] != null){
      startSeassonYear = json["start_season"]["year"];
      startSeassonSeason = json["start_season"]["season"];
    }

    if(json["genres"] !=null){
      List<dynamic> listaGenres = json["genres"];
      List<GenresModel> teste = listaGenres.map((e) => GenresModel.fromJson(e)).toList();
      genres = teste;
    }
  }
    
}
