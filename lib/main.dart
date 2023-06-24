import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartbevmobile2/Utils/colors.dart';

import 'package:smartbevmobile2/Views/welcome_view.dart';
import 'package:smartbevmobile2/routes/routes.dart';
import 'ViewModels/commande_view_model.dart';
import 'Views/Auth_provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CommandeViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mobile 2',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          fontFamily: 'HelveticaNeue',
          iconTheme: const IconThemeData(color: AppColors.iconColor),
          primaryColor: AppColors.backgroundColor,
          buttonTheme: ButtonThemeData(
            buttonColor: AppColors.backgroundColor,
            textTheme: ButtonTextTheme.accent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            // Set the borderRadius property
          ),
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: AppColors.iconColor,
            ),
            backgroundColor: AppColors.backgroundColor,
            titleTextStyle: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor),
          ),
        ),
        home: const Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body:  WelcomeView(),
        ),
        initialRoute: '/',
        routes: getRoutes(),
      ),
    );
  }
}
