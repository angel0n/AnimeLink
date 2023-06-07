class GenresModel{
  final int id;
  final String name;

  GenresModel({required this.id, required this.name});
  
  GenresModel.fromJson(Map<String, dynamic> json) : id = json["id"], name = json["name"];

}