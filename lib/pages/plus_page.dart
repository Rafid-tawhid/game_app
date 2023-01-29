import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:game_app/utils/helper_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlusPage extends StatefulWidget {
  static const String routeName='/plus';
  const PlusPage({Key? key}) : super(key: key);

  @override
  State<PlusPage> createState() => _PlusPageState();
}

class _PlusPageState extends State<PlusPage> {
  int _score = 0;
  int _higestScore = 0;
  var _sum = 0;
  var _index1 = 0;
  var _index2 = 0;
  var _rand1 = 0;
  var _rand2 = 0;
  var _rand3 = 0;
  var a = 0;
  var b = 0;
  var c = 0;
  var d = 0;
  List<int> list = [];
  final _random = Random.secure();

  @override
  void initState() {
    HelperClass.fetchHigestScoreFromSharedPref("plus").then((value) {
      setState(() {
        _higestScore=value;
      });
    });
    super.initState();
  }

  @override
  Future<void> dispose() async {
    if(_score>=_higestScore){
      HelperClass.saveHigestScoreToSharedPref(_score, "plus");
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    _rollTheDice();

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('images/game_bg.png'),fit: BoxFit.fill)
          ),
          child: Column(
            children: [
              
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset('images/board_characters.png',fit: BoxFit.cover,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('images/board_bg.png'))
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 110,),
                      Text('Higest Score :${_higestScore}', style: GoogleFonts.acme(fontSize: 24,fontWeight: FontWeight.bold,color: Color(0xff20245F))),
                      SizedBox(height: 10,),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('images/score_bg.png',width: width/2.2,),
                          Text('SCORE: ${_score}',style: GoogleFonts.acme(fontSize: 24,fontWeight: FontWeight.normal,color: Colors.white))
                        ],
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,right: 30),
                        child: Row(
                          children: [
                            SizedBox(width: 15,),
                            Expanded(child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset('images/number_bg.png'),
                                Text('${_index1}',style: GoogleFonts.acme(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),)
                              ],
                            )),
                            SizedBox(width: 15,),
                            Expanded(child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset('images/number_bg.png'),
                                const Icon(Icons.add,color: Colors.white,size: 60,)
                              ],
                            )),
                            SizedBox(width: 15,),
                            Expanded(child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset('images/number_bg.png'),
                                Text('${_index2}',style: GoogleFonts.acme(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),)
                              ],
                            )),
                            SizedBox(width: 15,),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.only(left: 45.0,right: 45),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  checkRes(a);
                                },
                                child: Container(
                                  alignment: Alignment.center,

                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage('images/score_bg.png'),fit: BoxFit.fill)
                                ),
                                  child:  Text('$a',style: GoogleFonts.acme(fontSize: 40,fontWeight: FontWeight.normal,color: Colors.white)),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      checkRes(b);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,

                                      decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage('images/score_bg.png'),fit: BoxFit.fill)
                                      ),
                                      child:  Text('$b',style: GoogleFonts.acme(fontSize: 40,fontWeight: FontWeight.normal,color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 45.0,right: 45),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  checkRes(c);
                                },
                                child: Container(
                                  alignment: Alignment.center,

                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage('images/score_bg.png'),fit: BoxFit.fill)
                                  ),
                                  child:  Text('$c',style: GoogleFonts.acme(fontSize: 40,fontWeight: FontWeight.normal,color: Colors.white)),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  checkRes(d);
                                },
                                child: Container(
                                  alignment: Alignment.center,

                                  decoration: const BoxDecoration(
                                      image: DecorationImage(image: AssetImage('images/score_bg.png'),fit: BoxFit.fill)
                                  ),
                                  child:  Text('$d',style: GoogleFonts.acme(fontSize: 40,fontWeight: FontWeight.normal,color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/back.png',height: 40,),
                          SizedBox(width: 20,),
                          Image.asset('images/skip.png',height: 40,)
                        ],
                      ),
                      SizedBox(height: 60,)

                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }

  void _rollTheDice() {
    if (_score > _higestScore) {
      _higestScore = _score;
    }
    setState(() {
      _index1 = _random.nextInt(9);
      _index2 = _random.nextInt(9);
      _rand1 = _random.nextInt(24);
      _rand2 = _random.nextInt(24);
      _rand3 = _random.nextInt(24);

      _sum = _index1 + _index2;

      // _score =_score +_index1 + _index2 + 2;

      suffle(_rand1, _rand2, _rand3, _sum);
    });
  }

  void suffle(int rand1, int rand2, int rand3, int sum) {
    if (rand1 == rand2 || rand2 == rand3) {
      _rand2 = _rand2 + 1;
    }
    if (rand1 == rand3 || rand3 == rand2) {
      _rand3 = _rand3 + 1;
    }
    if (rand1 == rand3 || rand1 == rand2) {
      _rand1 = _rand1 + 1;
    }
    if (_rand1 == sum || _rand2 == sum || _rand3 == sum) {
      _rand1 = _rand1 + 2;
      _rand2 = _rand2 + 3;
      _rand3 = _rand3 + 1;
    }

    list = [_rand1, _rand2, _rand3, sum];
    list.shuffle();
    // print(list);

    a = list[0];
    b = list[1];
    c = list[2];
    d = list[3];
    print("$a" + " " "$b" + " " + "$c" + " " "$d");
  }


  checkRes(int a) {
    print('CLICK $a');
    int aa = a;

    //show congratulations toast

    if (aa == _sum) {
      final player = AudioCache();
      // congrats sound
      player.play('play.wav');
      // final player = AudioCache();
      // // congrats sound
      // player.play('play.wav');
      // Widget toast = CustomCongoToast.showCongratsMsg();
      // fToast.showToast(
      //   child: toast,
      //   gravity: ToastGravity.CENTER,
      //   toastDuration: const Duration(milliseconds: 900),
      // );
      setState(() {});

      _score++;
    } else {
      print("ERROR");
      final player = AudioCache();
      player.play('buzzer.wav');
      showDialog(
          context: context,
        builder: (context)=>AlertDialog(
          content: Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "images/wrong_board.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "images/cancel.png",
                        fit: BoxFit.cover,
                        width: 120,
                      ),
                      onTap: () {

                      },
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "images/again.png",
                        fit: BoxFit.cover,
                        width: 120,
                      ),
                      onTap: () {

                      },
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      );
    }
  }
}
