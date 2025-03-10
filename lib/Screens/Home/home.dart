import 'package:flutter/material.dart';
import 'package:pc_controller/Screens/Home/components/main_home_art.dart';
import 'package:pc_controller/Screens/Home/components/main_title.dart';
import 'package:pc_controller/Screens/Home/components/nav_to_button.dart';
import 'package:pc_controller/Screens/SendPage/send_page.dart';
import 'package:pc_controller/Screens/magic_pointer_screen/magic_pointer_screen.dart';
import 'package:pc_controller/Screens/settings_screen/settings_screen.dart';
import 'package:pc_controller/Screens/slide_controls/slide_controls.dart';
import 'package:pc_controller/Screens/video_controls/video_controls.dart';
import 'package:pc_controller/api/connection_strings.dart';
import 'package:pc_controller/components/alerts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    void changeHostname() {
      Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SettingsScreen()));

      // final mediaQ = MediaQuery.of(context);
      // final width = mediaQ.size.width;  

      // showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //       title: Text("Modificar el hostname"),
      //       content: const HostNameScreen(),
      //     ));
    }

    void navigateToConnectedPage(Widget page) {
      if (ConnectionStrings.serverHostname.isEmpty) {
        errorAlert(context, "IP no seleccionada", "La ip no ha sido configurada y por lo tanto no puede acceder al punto remoto, por favor configurelo");
        return;
      }

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page)
      );
    }

    void navigateToSendWebPage() {
      navigateToConnectedPage(const SendPage());
    }

    void navigateToVideoControls() {
      navigateToConnectedPage(VideoControl());
    }
    
    void navigateToSlideShowControls() {
      navigateToConnectedPage(const SlideControlsScreen());
    }

    void navigateToMagicPointerScreen() {
      navigateToConnectedPage(const MagicPointerScreen());
    }

    final List<NavToButton> buttons = [
      NavToButton(
        value: "Abrir una página Web", 
        onPress: navigateToSendWebPage
      ),
      NavToButton(
        value: "Controles de vídeo", 
        onPress: navigateToVideoControls
      ),
      NavToButton(
        value: "Controles de presentación", 
        onPress: navigateToSlideShowControls
      ),
      NavToButton(
        value: "Usar Puntero Mágico", 
        onPress: navigateToMagicPointerScreen
      ),
      NavToButton(
        value: "Configuración", 
        onPress: changeHostname
      ),
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
            ...buttons,
            const SizedBox(height: 32, width: double.minPositive,)
          ],
        ));
  }
}
