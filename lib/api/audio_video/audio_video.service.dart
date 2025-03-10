import 'package:dio/dio.dart';
import 'package:pc_controller/api/connection_strings.dart';
import 'package:pc_controller/api/models/Result.model.dart';

class AudioVideoService {

  late final Dio _client;
  final String _section = "/audio-video";
  
  AudioVideoService() {
    _client = Dio(BaseOptions(baseUrl: ConnectionStrings.resolveHostname()));
  }

  Future<Result<String>> setVolume({bool increase = true}) async {
    try {
      final response = await _client.get("$_section/volume", queryParameters: {"increase": increase});
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

}