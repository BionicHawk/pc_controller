import 'package:flutter/material.dart';
import 'package:pc_controller/Screens/SendPage/send_page.dart';
import 'package:pc_controller/Screens/host_name_screen/host_name_screen.dart';
import 'package:pc_controller/Screens/magic_pointer_screen/magic_pointer_screen.dart';
import 'package:pc_controller/Screens/video_controls/video_controls.dart';
import 'package:pc_controller/components/main_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final buttonsSize = MediaQuery.of(context).size.width * 0.8;
    const buttonsHeight = 45.0;
    const paddingBetweenButtons =
        Padding(padding: EdgeInsets.symmetric(vertical: 8));

    void changeHostname() async {
      await showModalBottomSheet(
          context: context,
          builder: (context) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const HostNameScreen(),
              ));
    }

    void navigateToSendWebPage() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const SendPage()));
    }

    void navigateToVideoControls() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const VideoControl()));
    }

    void navigateToMagicPointerScreen() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MagicPointerScreen()));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("My PC controller"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 64.0),
                child: Text(
                  "Seleccione una de las opciones",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Image.asset("assets/images/wirelessicon.png", width: 300),
            const Expanded(child: Column()),
            MainButton(
                width: buttonsSize,
                height: buttonsHeight,
                function: changeHostname,
                child: const CustomTextButton(text: "Modificar hostname")),
            paddingBetweenButtons,
            MainButton(
              width: buttonsSize,
              height: buttonsHeight,
              function: () {
                navigateToSendWebPage();
              },
              child: const CustomTextButton(text: "Abrir una página web"),
            ),
            paddingBetweenButtons,
            MainButton(
              width: buttonsSize,
              height: buttonsHeight,
              function: navigateToVideoControls,
              child: const CustomTextButton(text: "Controles de vídeo"),
            ),
            paddingBetweenButtons,
            MainButton(
              width: buttonsSize,
              height: buttonsHeight,
              child: const CustomTextButton(text: "Usar Puntero Mágico"),
            ),
            paddingBetweenButtons
          ],
        ));
  }
}
