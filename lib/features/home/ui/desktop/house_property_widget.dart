import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/common/constants.dart';

class HousePropertyWidget1 extends StatelessWidget {
  final String value, type;

  const HousePropertyWidget1({super.key, required this.value, required this.type,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            color: ColorConstant.kWhiteColor,
            border: Border.all(color: Colors.grey),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              value,
              style: GoogleFonts.notoSans(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          type,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}