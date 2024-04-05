import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../models/house_model.dart';
import '../../../../utils/common/constants.dart';
import '../../../../utils/widgets/custom_button.dart';
import 'filter_widget.dart';
import 'house_ad_widget.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({super.key});

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  final filterList = ['<\$100.000', '1 bedroom', '2 bedrooms', '2 bathrooms', 'Favorites'];

  String activeFilter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonWidget(
                  icon: Icons.menu,
                  onBtnTap: () {
                    print('burger meniu apasat');
                  },
                  iconColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
                Text('Imobiliare',
                    style: GoogleFonts.manrope(
                        fontSize: 36,
                        color: ColorConstant.kBlackColor,
                        fontWeight: FontWeight.w500
                    )),
                CustomButtonWidget(
                  icon: Icons.refresh,
                  onBtnTap: () {
                    print('refresh apasat');
                  },
                  iconColor: Colors.black,
                  backgroundColor: Colors.white,
                )
              ],
            ),
            const SizedBox(height: 32),
            Text('City',
                style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: ColorConstant.kGreyColor,
                    fontWeight: FontWeight.w300
                )),
            const SizedBox(height: 16),
            Text('Cluj-Napoca',
                style: GoogleFonts.manrope(
                    fontSize: 36,
                    color: ColorConstant.kBlackColor,
                    fontWeight: FontWeight.w700
                )),
            const Divider(color: ColorConstant.kGreyColor, thickness: 0.2),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filterList.length,
                  itemBuilder: (context, index){
                    return FilterWidget(
                        filterTxt: filterList[index],
                        isActive: activeFilter == filterList[index] ? true : false,
                        onBtnTap: (){
                          setState(() {
                            if(activeFilter == filterList[index]){
                              activeFilter = '';
                            }else{
                              activeFilter = filterList[index];
                            }
                          });
                        }
                    );
                  }),
            ),
            const SizedBox(height: 16),
            Column(
              children: List.generate(Constants.houseList.length, (index) {
                House house = Constants.houseList[index];
                return isFiltered(house.price, house.bedrooms, house.bathrooms, house.isFavorite) ?
                Padding(padding: const EdgeInsets.only(top: 16),
                    child: HouseAdWidget(
                      house: house,
                      imgPathIndex: index,
                    )) :
                const SizedBox();
              }),
            )
          ],
        ),
      ),
    );
  }

  bool isFiltered(price, bedrooms, bathrooms, bool isFavorite) {
    if (activeFilter.isEmpty) return true;
    if (activeFilter.contains('bedroom')) {
      if (activeFilter[0] == '1' && bedrooms == 1) {
        return true;
      } else if (activeFilter[0] == '2' && bedrooms == 2) {
        return true;
      }
    }
    if (activeFilter.contains('bath')) {
      if (activeFilter[0] == '1' && bathrooms == 1) {
        return true;
      } else if (activeFilter[0] == '2' && bathrooms == 2) {
        return true;
      }
    }
    if (activeFilter.contains('\$')) {
      if (price < 100000) {
        return true;
      }
    }
    if (activeFilter.contains('Favorites')) {
      if (isFavorite) {
        return true;
      }
    }
    return false;
  }
}
