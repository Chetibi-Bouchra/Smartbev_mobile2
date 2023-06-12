import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Utils/colors.dart';

class CustomFilledText extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextInputFormatter formatter;
  final double widthProperty;

  const CustomFilledText({
    Key? key,
    required this.label,
    required this.controller,
    required this.formatter,
    required this.widthProperty,
    this.keyboardType = TextInputType.number,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        /*SizedBox(
          height: 20,
          child: TextField(
            // controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            style: const TextStyle(
              color: AppColors.backgroundColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              border: InputBorder.none,
            ),
          ),
        ),*/

        Container(
          constraints: const BoxConstraints(
            minWidth: 400,
            maxWidth: 500,
          ),
          width:
              widthProperty, 
          height: 40,
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.iconColor,
              width: 2,
            ),
          ),

          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: [formatter],
            obscureText: obscureText,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            //textAlign: TextAlign.center,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
