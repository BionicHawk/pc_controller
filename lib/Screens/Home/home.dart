import 'package:flutter/material.dart';
import 'package:pc_controller/Screens/Home/components/main_home_art.dart';
import 'package:pc_controller/Screens/Home/components/main_title.dart';
import 'package:pc_controller/Screens/Home/components/nav_to_button.dart';
import 'package:pc_controller/Screens/SendPage/send_page.dart';
import 'package:pc_controller/Screens/host_name_screen/host_name_screen.dart';
import 'package:pc_controller/Screens/magic_pointer_screen/magic_pointer_screen.dart';
import 'package:pc_controller/Screens/video_controls/video_controls.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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

    // ignore: unused_element
    void navigateToMagicPointerScreen() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MagicPointerScreen()));
    }

    final List<NavToButton> buttons = [
      NavToButton(value: "Modificar Hostname", onPress: changeHostname),
      NavToButton(
          value: "Abrir una página Web", onPress: navigateToSendWebPage),
      NavToButton(
          value: "Controles de vídeo", onPress: navigateToVideoControls),
      NavToButton(value: "Usar Puntero Mágico", onPress: navigateToMagicPointerScreen)
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text("My PC controller"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MainTitle(value: "Seleccione una de las opciones"),
            const MainHomeArt(),
            const Expanded(child: Column()),
            ...buttons
          ],
        ));
  }
}
