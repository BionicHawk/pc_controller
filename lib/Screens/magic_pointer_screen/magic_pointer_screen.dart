import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:pc_controller/settings/connection.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MagicPointerScreen extends StatefulWidget {
  const MagicPointerScreen({super.key});

  @override
  State<MagicPointerScreen> createState() => _MagicPointerScreenState();
}

class _MagicPointerScreenState extends State<MagicPointerScreen> {
  late StreamSubscription<UserAccelerometerEvent> accelerometerSubscription;
  String pos = "";

  List<double> currentPos = List.empty(growable: true);
  List<double> prevPos = List.empty(growable: true);

  void sendPos(Map<String, dynamic> data) async {
    String url = Connection.getMouseSetterApiUrl();
    accelerometerSubscription.pause();
    await Dio().post(url, data: data);
    accelerometerSubscription.resume();
  }

  void setListener() {
    accelerometerSubscription = userAccelerometerEvents.listen((event) {
      if(prevPos.isEmpty) {
        prevPos = [event.x, event.y, event.z];
      }
      currentPos.clear();
      currentPos = [event.x, event.y, event.z];
      var movement = [
        currentPos[0] - prevPos[0],
        currentPos[1] - prevPos[1],
        currentPos[2] - prevPos[2]
      ];

      var data = {
        "fromUser": "AndroidDevice",
        "x": movement[0],
        "y": movement[1],
        "z": movement[3]
      };

      sendPos(data);

      prevPos.clear();
      prevPos = currentPos;
    }, onError: (object) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: const Text("El sensor no se ha detectado"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("ok"))
                ],
              ));
    }, cancelOnError: true);
  }

  @override
  void initState() {
    super.initState();
    setListener();
  }

  @override
  void dispose() {
    accelerometerSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Magic Pointer"),
        centerTitle: true,
      ),
      body: const Placeholder(),
    );
  }
}
