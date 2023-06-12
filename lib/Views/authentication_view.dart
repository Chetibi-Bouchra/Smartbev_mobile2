import 'package:flutter/material.dart';
import 'package:smartbevmobile2/Views/Custom_widgets/reclamation_popup.dart';

import 'Custom_widgets/app_bar.dart';

class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Inscription',
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nom',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black, // Set focused border color to blue
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black, // Set border color to black
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.black, // Set label color to black
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Prénom',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black, // Set focused border color to blue
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black, // Set border color to black
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.black, // Set label color to black
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                color: Colors.amber,
                child: Text(
                  'Sexe',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround, // Change to start alignment
              children: [
                Container(
                  child: Row(children: [
                    Radio(
                      value: 'M',
                      groupValue: 'sexe',
                      onChanged: (value) {
                        // Handle male option selected
                      },
                    ),
                    Text('Homme'),
                  ]),
                ),
                Container(
                  child: Row(children: [
                    Radio(
                      value: 'F',
                      groupValue: 'sexe',
                      onChanged: (value) {
                        // Handle female option selected
                      },
                    ),
                    Text('Femme'),
                  ]),
                ),
                SizedBox(width: 16.0),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Mail',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black, // Set focused border color to blue
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black, // Set border color to black
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.black, // Set label color to black
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black, // Set focused border color to blue
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black, // Set border color to black
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.black, // Set label color to black
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Set button color to black
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ReclamationPopup();
                  },
                );
              },
              child: Text('S\'inscrire'),
            ),
            SizedBox(height: 16.0),
            Text('Vous avez déjà un compte ? Inscrivez-vous'),
          ],
        ),
      ),
    );
  }
}
