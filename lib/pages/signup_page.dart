import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName='/signup';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPass=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.blueAccent)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
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
                      InkWell(
                        child: Image.asset('images/login.png',width: 100,),
                        onTap: (){

                        },
                      ),
                    ],

                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
