import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/Themes/ProviderTheme.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    IconData iconData = isDarkMode
        ? CupertinoIcons.brightness
        : CupertinoIcons.brightness_solid;
    Color iconColor = isDarkMode ? Colors.white : Colors.amber;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: themeProvider.themeData.colorScheme.primary,
              ),
              child: InkWell(
                onTap: themeProvider.toggleTheme,
                child: Container(
                  height: 200,
                  width: 200,
                  color: themeProvider.themeData.colorScheme.secondary,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          iconData,
                          color: iconColor,
                          size: 60,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Tap',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
