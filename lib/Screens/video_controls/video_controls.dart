
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pc_controller/components/custom_field.dart';
import 'package:pc_controller/components/main_button.dart';
import 'package:pc_controller/settings/connection.dart';

class VideoControl extends StatelessWidget {
  const VideoControl({super.key});

  static var templateVideo = {
    "fromUser": "AndroidDevice",
    "command": "playpause"
  };

  static TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const horizontalGap = Padding(padding: EdgeInsets.symmetric(horizontal: 4));
    const verticalGap = Padding(padding: EdgeInsets.symmetric(vertical: 8));

    void playPause() async {
      var command = templateVideo;
      command["command"] = "playpause";
      await Dio().post(Connection.getVideoControlApiUrl(), data: command);
    }

    void advance() async {
      var command = templateVideo;
      command["command"] = "advance";
      await Dio().post(Connection.getVideoControlApiUrl(), data: command);
    }

    void goBack() async {
      var command = templateVideo;
      command["command"] = "goback";
      await Dio().post(Connection.getVideoControlApiUrl(), data: templateVideo);
    }

    void goNext() async {
      var command = templateVideo;
      command["command"] = "next";
      await Dio().post(Connection.getVideoControlApiUrl(), data: templateVideo);
    }

    void goPrev() async {
      var command = templateVideo;
      command["command"] = "prev";
      await Dio().post(Connection.getVideoControlApiUrl(), data: templateVideo);
    }

    void goEnter() async {
      var command = templateVideo;
      command["command"] = "enter";
      await Dio().post(Connection.getVideoControlApiUrl(), data: templateVideo);
    }

    void usingLB() async {
      var command = templateVideo;
      command["command"] = "lb";
      await Dio().post(Connection.getVideoControlApiUrl(), data: templateVideo);
    }

    void usingRB() async {
      var command = templateVideo;
      command["command"] = "rb";
      await Dio().post(Connection.getVideoControlApiUrl(), data: templateVideo);
    }

    void goFullScreen() async {
      var command = templateVideo;
      command["command"] = "fullscreen";
      await Dio().post(Connection.getVideoControlApiUrl(), data: command);
    }

    void volumeUp() async {
      var command = templateVideo;
      command["command"] = "up";
      await Dio().post(Connection.getSetVolumeApiUrl(), data: command);
    }

    void volumeMute() async {
      var command = templateVideo;
      command["command"] = "mute";
      await Dio().post(Connection.getSetVolumeApiUrl(), data: command);
    }

    void volumeDown() async {
      var command = templateVideo;
      command["command"] = "down";
      await Dio().post(Connection.getSetVolumeApiUrl(), data: command);
    }

    void sendText() async {
      var data = {"fromUser": "AndroidDevice", "query": textController.text};
      await Dio().post(Connection.getTypeApiUrl(), data: data);
      textController.text = "";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Controles de Vídeo"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomField(
              labelText: "Envía un texto: ",
              hintText: "Ej. Vídeos de perros",
              textEditingController: textController,
            ),
            verticalGap,
            MainButton(
              width: double.maxFinite,
              function: sendText,
              child: const CustomTextButton(
                text: "Enviar texto",
              ),
            ),
            const Expanded(
              child: Column(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: goFullScreen,
                  shape: const CircleBorder(),
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.fullscreen_rounded),
                ),
                const Expanded(child: Row()),
                FloatingActionButton(
                  onPressed: volumeMute,
                  shape: const CircleBorder(),
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.volume_mute),
                ),
              ],
            ),
            verticalGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    FloatingActionButton(
                      onPressed: goNext,
                      shape: const CircleBorder(),
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.skip_next),
                    ),
                    verticalGap,
                    FloatingActionButton(
                      onPressed: goPrev,
                      shape: const CircleBorder(),
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.skip_previous),
                    )
                  ],
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: MainButton(
                      width: double.maxFinite,
                      function: goEnter,
                      child: const CustomTextButton(text: "Enter")),
                )),
                Column(
                  children: [
                    FloatingActionButton(
                      onPressed: volumeUp,
                      shape: const CircleBorder(),
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.volume_up),
                    ),
                    verticalGap,
                    FloatingActionButton(
                      onPressed: volumeDown,
                      shape: const CircleBorder(),
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.volume_down),
                    )
                  ],
                )
              ],
            ),
            verticalGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainButton(
                  width: 48,
                  function: goBack,
                  child: const Icon(Icons.fast_rewind),
                ),
                horizontalGap,
                MainButton(
                  width: 48,
                  function: playPause,
                  child: const Icon(Icons.play_arrow),
                ),
                horizontalGap,
                MainButton(
                  width: 48,
                  function: advance,
                  child: const Icon(Icons.fast_forward),
                )
              ],
            ),
            verticalGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainButton(
                  width: 64,
                  function: usingLB,
                  child: const CustomTextButton(text: "LB"),
                ),
                horizontalGap,
                MainButton(
                  width: 64,
                  function: usingRB,
                  child: const CustomTextButton(
                    text: "RB",
                  ),
                )
              ],
            ),
            const Expanded(child: Column())
          ],
        ),
      ),
    );
  }
}
