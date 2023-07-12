import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  int selectedFontSizeIndex = 1;
  List<int> fontSizes = [14, 16, 18, 20];

  void toggleNotifications(bool value) {
    setState(() {
      notificationsEnabled = value;
    });
  }

  void toggleDarkMode(bool value) {
    setState(() {
      darkModeEnabled = value;
    });
  }

  void selectFontSize(int? index) {
    setState(() {
      selectedFontSizeIndex = index!;
    });
  }

  void openPlayStorePage() async {
    const url = 'https://play.google.com/store/apps/details?id=com.example.app';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void openRatingPage() async {
    const url = 'https://play.google.com/store/apps/details?id=com.example.app';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Enable Dark Mode',
                style: TextStyle(fontSize: 18.0),
              ),
              trailing: Switch(
                value: darkModeEnabled,
                onChanged: toggleDarkMode,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: openPlayStorePage,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              ),
              child: Text(
                'Share App',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: openRatingPage,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              ),
              child: Text(
                'Rate App',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
