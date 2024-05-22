import 'package:flutter/material.dart';
import 'package:pc_controller/Screens/slide_controls/components/page_switcher.dart';
import 'package:pc_controller/Screens/slide_controls/components/secondary_buttons.dart';

class SlideControlsScreen extends StatelessWidget {
  const SlideControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("Controles de Presentación"),
    );
    
    void nextSlide() {

    }

    void prevSlide() {

    }

    void onNextElement() {

    }

    void onPrevElement() {

    }

    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PageSwitcher(
            nextSlideAction: nextSlide,
            prevSlideAction: prevSlide,
          ),
          const SizedBox(height: 60,),
          SecondaryButtons(
            onNext: onNextElement,
            onPrev: onPrevElement,
          )
        ],
      ),
    );
  }
}