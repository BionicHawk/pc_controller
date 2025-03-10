import 'package:flutter/material.dart';
import 'package:pc_controller/api/connection_strings.dart';
import 'package:pc_controller/api/settings/settings.service.dart';
import 'package:pc_controller/components/custom_field.dart';
import 'package:pc_controller/components/messages.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static TextEditingController hostnameLabel = TextEditingController();

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeModeOption selectedThemeMode = SettingsService.themeModeOption;

  Future<void> saveConfiguration(BuildContext context) async {
    SettingsService.setServerHostname(SettingsScreen.hostnameLabel.text);
    SettingsService.setThemeMode(selectedThemeMode);
    await SettingsService.savePreferences();

    if (context.mounted) {
      okMessage(context, "La configuración ha sido guardada, algunos cambios surtirán efecto al reiniciar la aplicación");
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    SettingsScreen.hostnameLabel.text = ConnectionStrings.serverHostname;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuración"),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              titleSection("Configuración del escritorio", Icons.computer),
              CustomField(
                labelText: "Dirección IP del escritorio", 
                hintText: "Ej. 127.0.0.1",
                textEditingController: SettingsScreen.hostnameLabel,
              ),
              titleSection("Configuración General", Icons.settings),
              Column(
                children: [
                  ListTile(
                    leading: Radio<ThemeModeOption>(
                      value: ThemeModeOption.light,
                      groupValue: selectedThemeMode,
                      onChanged: (ThemeModeOption? value) {
                        setState(() {
                          if (value != null) {
                            selectedThemeMode = value;
                          }
                        });
                      },
                    ),
                    title: const Text("Claro"),
                  ),
                  ListTile(
                    leading: Radio<ThemeModeOption>(
                      value: ThemeModeOption.dark,
                      groupValue: selectedThemeMode,
                      onChanged: (ThemeModeOption? value) {
                        setState(() {
                          if (value != null) {
                            selectedThemeMode = value;
                          }
                        });
                      },
                    ),
                    title: const Text("Oscuro")
                  ),
                  ListTile(
                    leading: Radio<ThemeModeOption>(
                      value: ThemeModeOption.system,
                      groupValue: selectedThemeMode,
                      onChanged: (ThemeModeOption? value) {
                        setState(() {
                          if (value != null) {
                            selectedThemeMode = value;
                          }
                        });
                      },
                    ),
                    title: const Text("Sistema")
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: const Row()),
                FloatingActionButton(
                  onPressed: () async { await saveConfiguration(context); }, 
                  shape: CircleBorder(),
                  backgroundColor: Colors.cyan,
                  child: const Icon(Icons.save, color: Colors.white,),
                ),
              ],
            ),
          ),
        ]
      )
    );
  }

  Widget titleSection(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon),
            title: Text(title),
          ),
          Divider()
        ],
      ),
    );
  }
}