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
  int groupValue = 1;
  List<String> subTitle = ["French", "English", "Spanish"];
  String name = "John";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SettingsList(children: [
        SettingsSection(
          title: "Common",
          children: [
            SettingsTile(
              title: "Language",
              subTitle: subTitle[groupValue],
              icon: const Icon(Icons.language),
              showChevron: true,
              editType: EditType.list,
              listEditTypeView: ListEditTypeView(
                title: "Language",
                groupValue: groupValue,
                onChanged: (value) => setState(() {
                  groupValue = value;
                }),
                children: [
                  ListEditTile<int>(
                      title: Text("🇫🇷 ${subTitle[0]}"), value: 0),
                  ListEditTile<int>(
                      title: Text("🇬🇧 ${subTitle[1]}"), value: 1),
                  ListEditTile<int>(
                      title: Text("🇪🇸 ${subTitle[2]}"), value: 2),
                ],
              ),
            ),
            SettingsSwitchTile(
              onChanged: (value) => print(value),
              title: "Send notifications",
              value: true,
              icon: const Icon(Icons.notifications),
            )
          ],
        ),
        SettingsSection(
          title: "Account",
          children: [
            SettingsTile(
              title: "Nickname",
              subTitle: name,
              icon: const Icon(Icons.edit),
              onChanged: (value) => setState(() => name = value),
            ),
            const SettingsTile(
              title: "Name",
              subTitle: "John Doe",
              icon: Icon(Icons.person),
              showChevron: false,
              editType: EditType.uneditable,
            ),
            const SettingsTile(
              title: "Email",
              subTitle: "john.doe@example.com",
              icon: Icon(Icons.email),
              showChevron: false,
              editType: EditType.uneditable,
            ),
            SettingsSliderTile(
              onChanged: (value) => print(value),
              value: 0.2,
              leadingIcon: Icon(Icons.volume_mute_rounded),
              trailingIcon: Icon(Icons.volume_up),
              title: "Volume",
              titleAndroidOnly: true,
              trailingIconIosOnly: true,
            ),
          ],
        ),
      ]),
    );
  }
}
