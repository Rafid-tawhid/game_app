import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName='/launcher';
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  bool showPass=false;


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double weight=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          height: height,
          width: weight,
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    child: Image.asset('images/launcher_bg.png')
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Image.asset('images/btn_practice.png',width: weight/2.5,)),
                              SizedBox(height: 10,),
                              Align(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                      onTap: (){
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            bool showPass=true;
                                            return StatefulBuilder(
                                              builder: (context, setState) {
                                                return showLoginDialog(showPass, setState);
                                              },
                                            );
                                          },
                                        );


                                      },
                                      child: Image.asset('images/btn_story.png',width: weight/2.5,)),
                              ),
                              SizedBox(height: 40,)
                            ],
                          ),
                          Positioned(
                            right: 10,
                            bottom: 10,
                            child: InkWell(
                              onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return AlertDialog(
                                          contentPadding: EdgeInsets.zero,
                                          content: Container(
                                            color: Colors.blueAccent,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.asset('images/charecter_bg.png'),
                                                SizedBox(height: 10,),

                                                Positioned(
                                                  bottom: 70,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Image.asset('images/albus.png',width: 100,),
                                                      SizedBox(width: 10,),
                                                      Image.asset('images/cristine.png',width: 100,),
                                                    ],

                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset('images/profile.png',height: 50,width: 50,),
                              ),
                            ),
                          )
                        ],
                      ),


                    ],),
                  ),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AlertDialog showLoginDialog(bool showPass, StateSetter setState) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        color: Colors.blueAccent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('images/login_board.png'),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0,right: 40),
                  child: TextFormField(
                    decoration:  const InputDecoration(
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3, color: Colors.orange,
                          ),
                        ),
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(left: 10,right: 5,bottom: 5,top: 5),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3, color: Colors.orange,
                          ),

                          //<-- SEE HERE
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.blueAccent)
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0,right: 40),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: showPass,
                    decoration:   InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: (){
                              showPass =!showPass;
                              setState(() {
                              });
                              print(showPass);
                            }, icon: showPass?Icon(Icons.visibility):
                        Icon(Icons.visibility_off)),
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3, color: Colors.orange,
                          ),
                        ),
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(left: 10,right: 5,bottom: 5,top: 5),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3, color: Colors.orange,
                          ),
                          //<-- SEE HERE
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.blueAccent)
                    ),

                  ),
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/create.png',width: 100,),
                    SizedBox(width: 10,),
                    Image.asset('images/login.png',width: 100,),
                  ],

                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
