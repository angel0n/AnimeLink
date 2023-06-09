import 'dart:convert';
import 'package:http/http.dart' as http;

class ClientRequest {
  final String _baseUrl = "https://api.myanimelist.net";
  late String _endPoint;
  late String _body;
  late http.Response _response;
  late final Map<String, dynamic> _params = {};

  final Map<String, String> _headers = {
    "Content-type": "application/json",
    "X-MAL-CLIENT-ID": "3f4582e9dccf68fb742a8e498dd7bd38"
  };

  ClientRequest();

  static ClientRequest create() => ClientRequest();

  ClientRequest endPoint(String endPoint) {
    _endPoint = endPoint;
    return this;
  }

  ClientRequest param(String chave, dynamic valor) {
    _params[chave] = valor.toString();
    return this;
  }

  ClientRequest parseBody(Object obj) {
    _body = jsonEncode(obj);
    return this;
  }

  Uri _buildUri() {
    if (_baseUrl.startsWith("https://")) {
      String _url = _baseUrl.replaceAll("https://", "");
      return Uri.https(_url, _endPoint, _params);
    } else {
      return Uri.http(_baseUrl.replaceAll("http://", ""), _endPoint, _params);
    }
  }

  Future<ClientRequest> get() async {
    final uri = _buildUri();
    _response = await http.get(uri, headers: _headers).timeout(
          const Duration(seconds: 120),
          onTimeout: () => throw Exception('Falha ao conectar ao servidor'),
        );
    return this;
  }

  Future<ClientRequest> put() async {
    final uri = _buildUri();
    _response = await http.put(uri, headers: _headers, body: _body).timeout(
          const Duration(seconds: 120),
          onTimeout: () =>
              throw http.ClientException('Falha ao conectar ao servidor'),
        );
    return this;
  }

  Future<ClientRequest> post() async {
    Uri uri = _buildUri();
    _response = await http.post(uri, headers: _headers, body: _body).timeout(
          const Duration(seconds: 120),
          onTimeout: () =>
              throw http.ClientException('Falha ao conectar ao servidor'),
        );
    return this;
  }

  Future<ClientRequest> delete() async {
    Uri uri = _buildUri();
    _response = await http.delete(uri, headers: _headers).timeout(
          const Duration(seconds: 120),
          onTimeout: () =>
              throw http.ClientException('Falha ao conectar ao servidor'),
        );
    return this;
  }

  Future<ClientRequest> patch() async {
    Uri uri = _buildUri();
    _response = await http.patch(uri, headers: _headers, body: _body).timeout(
          const Duration(seconds: 120),
          onTimeout: () =>
              throw http.ClientException('Falha ao conectar ao servidor'),
        );
    return this;
  }

  // ignore: prefer_null_aware_operators, unnecessary_null_comparison
  dynamic getResponse() => _response.body;
}
