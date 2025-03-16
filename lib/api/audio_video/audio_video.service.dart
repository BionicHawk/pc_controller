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

  Future<Result<String>> setMute() async {
    try {
      final response = await _client.get("$_section/volume/mute");
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

  Future<Result<String>> playPause() async {
    try {
      final response = await _client.get("$_section/play-pause");
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

  Future<Result<String>> setTrack({bool next = true}) async {
    try {
      final response = await _client.get("$_section/track", queryParameters: {"next": next});
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

  Future<Result<String>> setForwardRewind({bool forward = true}) async {
    try {
      final response = await _client.get("$_section/forward-rewind", queryParameters: {"forward": forward});
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

  Future<Result<String>> setFullscreen() async {
    try {
      final response = await _client.get("$_section/fullscreen");
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

}