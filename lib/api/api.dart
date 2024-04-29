import 'package:dio/dio.dart';
import 'package:pc_controller/api/connection_strings.dart';

enum ResponseTypeToken { ok, serverError, clientError }

class Api {
  static final Dio _client = Dio();
  static const String _clientType = "MobileDevice";

  static Future<ResponseTypeToken> sendUrl(String value) async {
    final data = {"fromUser": _clientType, "url": value};

    if (ConnectionStrings.getHostName().isEmpty) {
      return ResponseTypeToken.clientError;
    }

    final response =
        await _client.post(ConnectionStrings.getOpenWebApiUrl(), data: data);
    ResponseTypeToken responseType = ResponseTypeToken.clientError;

    final code = response.statusCode;

    if (code != null) {
      if (code >= 200 && code < 400) {
        responseType = ResponseTypeToken.ok;
      }
      if (code >= 400 && code < 500) {
        responseType = ResponseTypeToken.clientError;
      }
      if (code >= 500 && code < 600) {
        responseType = ResponseTypeToken.serverError;
      }
    }

    return responseType;
  }
}
