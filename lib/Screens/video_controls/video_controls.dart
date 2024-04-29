import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pc_controller/components/custom_field.dart';
import 'package:pc_controller/components/main_button.dart';
import 'package:pc_controller/api/connection_strings.dart';

class VideoControl extends StatelessWidget {
  const VideoControl({super.key});

  static TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const horizontalGap = Padding(padding: EdgeInsets.symmetric(horizontal: 4));
    const verticalGap = Padding(padding: EdgeInsets.symmetric(vertical: 8));

    void playPause() async {
      await Dio()
          .post(ConnectionStrings.toggleVideoPlayPauseApiUrl());
    }

    void advance() async {
      await Dio()
          .post(ConnectionStrings.forwardVideoApiUrl());
    }

    void goBack() async {
      await Dio()
          .post(ConnectionStrings.rewindVideoApiUrl());
    }

    void goNext() async {
      await Dio()
          .post(ConnectionStrings.nextTrackApiUrl());
    }

    void goPrev() async {
      await Dio()
          .post(ConnectionStrings.prevTrackApiUrl());
    }

    void goEnter() async {
      await Dio()
          .post(ConnectionStrings.enterApiUrl());
    }

    void usingLB() async {
      await Dio()
          .post(ConnectionStrings.lbApiUrl());
    }

    void usingRB() async {
      await Dio()
          .post(ConnectionStrings.rbApiUrl());
    }

    void goFullScreen() async {
      await Dio()
          .post(ConnectionStrings.toggleFullscreenVideoApiUrl());
    }

    void volumeUp() async {
      await Dio().post(ConnectionStrings.setVolumeUpApiUrl());
    }

    void volumeMute() async {
      await Dio().post(ConnectionStrings.setVolumeMuteApiUrl());
    }

    void volumeDown() async {
      await Dio().post(ConnectionStrings.setVolumeDownApiUrl());
    }

    void sendText() async {
      var data = {"fromUser": "AndroidDevice", "query": textController.text};
      await Dio().post(ConnectionStrings.getTypeApiUrl(), data: data);
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
