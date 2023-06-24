import 'package:flutter/material.dart';
import 'package:smartbevmobile2/Utils/colors.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String rightText;
  final String bottomText;

  CustomCard({
    required this.title,
    required this.description,
    required this.rightText,
    required this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add the desired padding values
      child: SizedBox(
        height: 100.0, // Set the desired height
        child: Card(
          color: AppColors.backgroundColor, // Set the desired background color
          elevation: 2, // Add a small shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Add rounded corners
            side: const BorderSide(
              color: AppColors.textColor, // Add a line color
              width: 1, // Set the line width
            ),
          ),
          child: ListTile(
            title: Text(title),
            subtitle: Text(description),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  rightText,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(bottomText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
