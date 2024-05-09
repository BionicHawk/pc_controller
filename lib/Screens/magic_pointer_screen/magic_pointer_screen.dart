import 'dart:async';
import 'dart:io';
import 'package:pc_controller/components/main_button.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:pc_controller/api/connection_strings.dart';
import 'package:flutter/material.dart';

class GyroPosition {
  double x;
  double y;
  double z;

  GyroPosition(this.x, this.y, this.z);

  void setPosition(double xPos, double yPos, double zPos) {
    x = xPos;
    y = yPos;
    z = zPos;
  }

  @override
  String toString() {
    return "{x:$x} {y:$y} {z:$z}";
  }
}

class MagicPointerScreen extends StatefulWidget {
  const MagicPointerScreen({super.key});

  @override
  State<MagicPointerScreen> createState() => _MagicPointerScreenState();
}

class _MagicPointerScreenState extends State<MagicPointerScreen> {
  final Uri wsUri = Uri.parse(ConnectionStrings.getMouseSocketApiUrl());
  late StreamSubscription<AccelerometerEvent> accEvent;
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

    accEvent = accelerometerEvents.listen((event) {
      current.setPosition(event.x, event.y, event.z);

      double deltaX = current.x - previous.x;
      double deltaY = current.y - previous.y;
      double deltaZ = current.z - previous.z;

      GyroPosition deltaPosition = GyroPosition(deltaX, deltaY, deltaZ);

      socket.writeln("/set_pos ${deltaPosition.toString()}");

      // channel.sink.add("$deltaX,$deltaY,$deltaZ");
      previous.setPosition(current.x, current.y, current.z);
    });
  }

  @override
  void initState() {
    super.initState();
    // channel = IOWebSocketChannel.connect(ConnectionStrings.getMouseSocketApiUrl());
    setListener();
  }

  @override
  void dispose() {
    accEvent.cancel();
    socket.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const verticalPaddingValue = 16.0;

    final mediaQuery = MediaQuery.of(context);
    final buttonWidth = mediaQuery.size.width * 0.3;

    final buttons = [
      MainButton(
        width: buttonWidth,
        function: () {},
        child: const Text("Botón 1"),),
      MainButton(width: buttonWidth,
          function: () {},
          child: const Text("Botón 2"))
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Magic Pointer"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Expanded(child: Column()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: verticalPaddingValue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: buttons,
            ),
          )
        ],
      )
    );
  }
}
