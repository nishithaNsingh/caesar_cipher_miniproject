import 'package:crypto_miniproject/ecryptionscreen.dart';
import 'package:flutter/material.dart';

import 'decryptionscreen.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Choose what to want to do???',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 80,
            ),
            SizedBox(height: 20),
            SizedBox( // Wrap the button with SizedBox to control its size
              width: 200, // Set the width of the button
              height: 60, // Set the height of the button
              child: ElevatedButton.icon( // Use ElevatedButton.icon for adding an icon
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EncryptionScreen()),
                  );
                },
                style: ButtonStyle( // Use ButtonStyle to set background color
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Set background color
                ),
                icon: Icon(Icons.lock_outline), // Add an icon
                label: Text(
                  'Encryption',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            SizedBox( // Wrap the button with SizedBox to control its size
              width: 200, // Set the width of the button
              height: 60, // Set the height of the button
              child: ElevatedButton.icon( // Use ElevatedButton.icon for adding an icon
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DecryptionScreen()),
                  );
                },
                style: ButtonStyle( // Use ButtonStyle to set background color
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Set background color
                ),
                icon: Icon(Icons.lock_open), // Add an icon
                label: Text(
                  'Decryption',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
