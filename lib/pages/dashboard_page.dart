import 'package:flutter/material.dart';
import 'package:game_app/pages/minus_page.dart';
import 'package:game_app/pages/multiplication_page.dart';
import 'package:game_app/pages/plus_page.dart';

import 'division_page.dart';

class DashboardPage extends StatelessWidget {
  static const String routeName='/dashboard';
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/dashboard_bg.png'))
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, PlusPage.routeName);
                        },
                        child: Image.asset('images/plus.png',height: 120,fit: BoxFit.contain,)),
                    SizedBox(width: 40,),
                    InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, MinusPage.routeName);
                        },
                        child: Image.asset('images/minus.png',height: 120,fit: BoxFit.contain,)),

                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, MultiplicationPage.routeName);
                        },
                        child: Image.asset('images/mup.png',height: 120,fit: BoxFit.contain,)),
                    SizedBox(width: 40,),
                    InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, DivisionPage.routeName);
                        },
                        child: Image.asset('images/div.png',height: 120,fit: BoxFit.contain,)),


                  ],
                ),
                SizedBox(height: 140,)
              ],
            ),
          ),
      ),
    );
  }
}
