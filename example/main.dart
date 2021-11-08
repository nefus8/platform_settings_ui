import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_settings_ui/platform_settings_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Platform Settings UI Demo',
      home: PlatformUiExample(),
    );
  }
}

class PlatformUiExample extends StatefulWidget {
  const PlatformUiExample({Key? key}) : super(key: key);

  @override
  _PlatformUiExampleState createState() => _PlatformUiExampleState();
}

class _PlatformUiExampleState extends State<PlatformUiExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SettingsList(
        children: [
          SettingsSection(
            title: "Common",
            children: [
              SettingsTile(
                title: "Language",
                icon: const Icon(Icons.language),
                onTap: () => print("Tapped"),
                subTitle: "English",
              ),
              SettingsTile(
                title: "Theme",
                icon: const Icon(Icons.add_to_home_screen),
                onTap: () => print("Tapped"),
                subTitle: "light",
              )
            ]
          ),
          SettingsSection(
              title: "Account",
              children: [
                SettingsTile(
                  title: "Name",
                  icon: const Icon(Icons.person),
                  onTap: () => print("Tapped"),
                  subTitle: "John Doe",
                ),
                SettingsSwitchTile(
                  title: "Theme",
                  icon: const Icon(Icons.add_to_home_screen),
                  value: true,
                  onChanged: (value) => print(value),
                  activeColor: Colors.red,
                ),
                SettingsSliderTile(
                  onChanged: (value) => print(value),
                  value: 0.2,
                  leadingIcon: Icon(Icons.volume_mute_rounded),
                  trailingIcon: Icon(Icons.volume_up),
                  title: "Volume",
                  titleAndroidOnly: true,
                  trailingIconIosOnly: true,
                )
              ]
          )
        ],
      ),
    );
  }
}
