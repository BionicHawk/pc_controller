import 'package:flutter/material.dart';
import 'package:pc_controller/Screens/slide_controls/components/large_button.dart';

class PageSwitcher extends StatelessWidget {
  const PageSwitcher({
    super.key, 
    required this.nextSlideAction,
    required this.prevSlideAction
  });

  final VoidCallback nextSlideAction;
  final VoidCallback prevSlideAction;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xff202020)
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              LargeButton(
                icon: Icons.arrow_drop_up,
                onPressed: nextSlideAction,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4)
              ),
              LargeButton(
                icon: Icons.arrow_drop_down,
                onPressed: prevSlideAction,
              )
            ],
          ),
        ),
      ),
    );
  }
}
