import 'package:flutter/material.dart';
import './Custom_widgets/filled_button.dart';
import '../Utils/colors.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 4, 16, 64),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/bigLogo.png',
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/images/firstPage.png',
                ),
              ),
              CustomFilledButton(
                text: 'Commencer',
                onPressed: () async {
                  //print(CommandesAPI().fetchCommandByid("1"));
                  Navigator.pushNamed(context, '/paiement');

                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaiementInfoPage(
                              title: 'Paiement',
                            )),
                  );*/
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
