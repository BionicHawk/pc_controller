import 'package:flutter/material.dart';
import 'package:pc_controller/components/custom_field.dart';
import 'package:pc_controller/components/main_button.dart';
import 'package:dio/dio.dart';
import 'package:pc_controller/settings/connection.dart';

class SendPage extends StatelessWidget {
  const SendPage({super.key});

  static final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    void sendUrl() async {
      const deviceName = "AndroidDevice";
      final data = {"fromUser": deviceName, "url": textEditingController.text};
      await Dio().post(Connection.getOpenWebApiUrl(), data: data);
      textEditingController.text = "";
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
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
