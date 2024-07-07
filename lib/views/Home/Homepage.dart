import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/Authentication.dart';
import 'package:flutter_application_1/views/Screens/SettingsPage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF192359),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
            SizedBox(height: 28),
            Text(
              'Use Your Finger To Login To The App',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.white60,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                bool auth = await Authentication.authenticate();
                print('can authenticate: $auth');
                if (auth) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
              icon: Icon(
                Icons.fingerprint,
                color: Colors.white,
              ),
              label: Text(
                'Aunthenticate',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )),
      ),
    );
  }
}
