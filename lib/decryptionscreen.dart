import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import Clipboard class
class DecryptionScreen extends StatefulWidget {
  const DecryptionScreen({Key? key}) : super(key: key);
  @override
  _DecryptionScreenState createState() => _DecryptionScreenState();}
class _DecryptionScreenState extends State<DecryptionScreen> {
  TextEditingController _plainTextController = TextEditingController();
  TextEditingController _keyController = TextEditingController();
  String _cipherText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Caesar Cipher"),
        centerTitle: true,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0), // Added spacing between AppBar and first TextField
          child: Column(
            children: [
              TextField(
                controller: _plainTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a cipher text',),),
              SizedBox(height: 10),
              TextField(
                controller: _keyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a key (number)',),
                keyboardType: TextInputType.number,),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String plainText = _plainTextController.text;
                  int key = int.tryParse(_keyController.text) ?? 0; // If parsing fails, default to 0
                  setState(() {
                    _cipherText = _decrypt(plainText, key);});},
                child: Text('Decrypt'),),
              SizedBox(height: 20),
              if (_cipherText.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Cipher Text:',
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 5),
                    Row(children: [
                        Expanded(
                          child: SelectableText(_cipherText,
                            style: TextStyle(fontSize: 16),),),
                        IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: _cipherText));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Copied to clipboard')),);},
                          icon: Icon(Icons.content_copy),),],),],),],),),),);}
  String _decrypt(String cipherText, int key) {
    String plainText = '';
    for (int i = 0; i < cipherText.length; i++) {
      int charCode = cipherText.codeUnitAt(i);
      if (charCode >= 65 && charCode <= 90) { // Check if it's an uppercase letter
        charCode = ((charCode - 65 - key) % 26 + 26) % 26 + 65; // Apply the Caesar Cipher decryption formula for uppercase letters
      } else if (charCode >= 97 && charCode <= 122) { // Check if it's a lowercase letter
        charCode = ((charCode - 97 - key) % 26 + 26) % 26 + 97; // Apply the Caesar Cipher decryption formula for lowercase letters
      }
      plainText += String.fromCharCode(charCode);
    }
    return plainText;
  }}
