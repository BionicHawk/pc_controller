import 'dart:async';
import 'dart:io';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:pc_controller/api/connection_strings.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class GyroPosition {
  double x;
  double y;
  double z;

  GyroPosition(this.x, this.y, this.z);

  void setPosition(double x_pos, double y_pos, double z_pos) {
    x = x_pos;
    y = y_pos;
    z = z_pos;
  }
}

class MagicPointerScreen extends StatefulWidget {
  const MagicPointerScreen({super.key});

  @override
  State<MagicPointerScreen> createState() => _MagicPointerScreenState();
}

class _MagicPointerScreenState extends State<MagicPointerScreen> {
  final Uri wsUri = Uri.parse(ConnectionStrings.getMouseSocketApiUrl());
  late StreamSubscription<GyroscopeEvent> gyroSubscription;
  late StreamSubscription channelSubscription;

  final GyroPosition current = GyroPosition(0, 0, 0);
  final GyroPosition previous = GyroPosition(0, 0, 0);

  late Socket socket;

  // late IOWebSocketChannel channel;

  String positionStr = "";

  void sendPos(Map<String, dynamic> data) async {

  }

  void setListener() async {
    socket = await Socket.connect(ConnectionStrings.serverHostname,
        ConnectionStrings.mouseTrackerPort);

    gyroSubscription = gyroscopeEvents.listen((event) {
      current.setPosition(event.x, event.y, event.z);

      double deltaX = current.x - previous.x;
      double deltaY = current.y - previous.y;
      double deltaZ = current.z - previous.z;

      socket.write("${event.x},${event.y},${event.z}<|EOM|>");

      // channel.sink.add("$deltaX,$deltaY,$deltaZ");
      previous.setPosition(current.x, current.y, current.z);
    });
    // channelSubscription = channel.stream.listen((event) {
    //   print(event);
    // });


  }

  @override
  void initState() {
    super.initState();
    // channel = IOWebSocketChannel.connect(ConnectionStrings.getMouseSocketApiUrl());
    setListener();
  }

  @override
  void dispose() {
    gyroSubscription.cancel();
    // channelSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Magic Pointer"),
        centerTitle: true,
      ),
      body: const Placeholder()
    );
  }
}
