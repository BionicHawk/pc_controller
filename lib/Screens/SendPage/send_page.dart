import 'package:flutter/material.dart';
import 'package:pc_controller/api/api.dart';
import 'package:pc_controller/components/custom_field.dart';
import 'package:pc_controller/components/main_button.dart';
import 'package:pc_controller/components/alerts.dart';

class SendPage extends StatelessWidget {
  const SendPage({super.key});

  static final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    void sendUrl() async {
      switch (await Api.sendUrl(textEditingController.text)) {
        case ResponseTypeToken.ok:
          textEditingController.text = "";
          Navigator.of(context).pop();
          break;
        case ResponseTypeToken.serverError:
          errorAlert(context, "No se pudo enviar", "blblblb");
          break;
        case ResponseTypeToken.clientError:
          errorAlert(context, "No se pudo enviar", "blblblb");
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Enviar una página web"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomField(
                labelText: "Ingrese una url:",
                hintText: "EJ. https://www.youtube.com/",
                textEditingController: textEditingController),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: MainButton(
              width: screenWidth * 0.8,
              function: sendUrl,
              child: const CustomTextButton(text: "Enviar página"),
            ),
          )
        ],
      ),
    );
  }
}
