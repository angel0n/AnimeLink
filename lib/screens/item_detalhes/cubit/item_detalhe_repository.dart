import 'package:anime_link/requests/client_request.dart';

class ItemDetalheRepository{
  Future<void> buscaDetalhesAnimes(int id) async{
    ClientRequest request = await ClientRequest.create()
    .endPoint("/v2/anime/$id")
    .get();

    dynamic response = request.getResponse();
    String teste = "";
  }
}