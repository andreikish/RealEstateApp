import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final Function()? onBtnTap;
  final Color iconColor, backgroundColor; //borderColor
  const CustomButtonWidget({Key? key, required this.icon, this.onBtnTap, required this.iconColor, required this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onBtnTap!();
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
                color: Colors.white
            ),
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}