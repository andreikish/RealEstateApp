import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/common/constants.dart';

class FilterWidget extends StatefulWidget {
  final String filterTxt;
  final Function()? onBtnTap;
  final bool isActive;
  const FilterWidget({Key? key, required this.filterTxt, this.onBtnTap, required this.isActive,}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onBtnTap!();
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: widget.isActive ? ColorConstant.kBlackColor : Colors.white70,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Text(
                widget.filterTxt,
                style: GoogleFonts.notoSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: widget.isActive ? ColorConstant.kWhiteColor : ColorConstant.kBlackColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}