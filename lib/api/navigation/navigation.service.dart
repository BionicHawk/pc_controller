import 'package:dio/dio.dart';
import 'package:pc_controller/api/connection_strings.dart';
import 'package:pc_controller/api/models/Result.model.dart';

class Navigation {

  late final Dio _client;
  final String _section = "/navigation";

  Navigation() {
    _client = Dio(BaseOptions(baseUrl: ConnectionStrings.resolveHostname()));
  }

  Future<Result<String>> setEnter() async {
    try {
      final response = await _client.get("$_section/enter");
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

  Future<Result<String>> setBack() async {
    try {
      final response = await _client.get("$_section/go-back");
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

  Future<Result<String>> moveDown() async {
    try {
      final response = await _client.get("$_section/move-down");
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

  Future<Result<String>> moveLeft() async {
    try {
      final response = await _client.get("$_section/move-left");
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

  Future<Result<String>> moveRight() async {
    try {
      final response = await _client.get("$_section/move-right");
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

  Future<Result<String>> moveUp() async {
    try {
      final response = await _client.get("$_section/move-up");
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

  Future<Result<String>> selectItem({bool next = true}) async {
    try {
      final response = await _client.get("$_section/select-item", queryParameters: {"next": next});
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

  Future<Result<String>> movePage({bool up = true}) async {
    try {
      final response = await _client.get("$_section/move-page", queryParameters: {"up": up});
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

  Future<Result<String>> sendText(String text) async {
    try {
      final response = await _client.post("$_section/send-text", data: text);
      return Result.fromJson(response.data);
    } catch (e) {
      return Result(success: false, message: e.toString());
    }
  }

}