import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:game_app/utils/helper_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryGameMode extends StatefulWidget {
  static const String routeName='/plus';
  const StoryGameMode({Key? key}) : super(key: key);

  @override
  State<StoryGameMode> createState() => _StoryGameModeState();
}

class _StoryGameModeState extends State<StoryGameMode> with SingleTickerProviderStateMixin {
  int _score = 0;
  int _level = 1;
  bool showLevel = false;
  int _higestScore = 0;
  var _res = 0;
  var _index1 = 0;
  var _index2 = 0;
  var _rand1 = 0;
  var _rand2 = 0;
  var _rand3 = 0;
  var a = 0;
  var b = 0;
  var c = 0;
  var d = 0;
  final int level=0;
  String signImg='images/plus.png';

  List<int> list = [];
  final _random = Random.secure();

  @override
  void initState() {
    // HelperClass.fetchHigestScoreFromSharedPref("plus").then((value) {
    //   setState(() {
    //     _higestScore=value;
    //   });
    // });
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
        body: Stack(
          children: [

            Container(
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
                          Text('Level : ${ _level}', style: GoogleFonts.acme(fontSize: 24,fontWeight: FontWeight.bold,color: Color(0xff20245F))),
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
                                    Image.asset(signImg),
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
            if(showLevel) Center(
              child: TweenAnimationBuilder(
                curve: Curves.bounceOut,
                onEnd: (){
                    setState(() {
                      showLevel=false;
                    });
                },
                duration: Duration(seconds: 2),
                tween: Tween<double>(begin: 0.0,end: 30.0),
                builder: (BuildContext context, double value, Widget? child){
                  return Text('Level Up $_level',style: TextStyle(fontWeight: FontWeight.bold,fontSize: value));
                },

              ),
            ),

          ],
        ),
      ),
    );
  }

  void _rollTheDice() {
    if (_score > _higestScore) {
      _higestScore = _score;
    }
    print('LEVEL IS $_level');
    if(_level==1){
      int _randFun=_random.nextInt(2);
      print('_randFun _randFun $_randFun');
      switch(_randFun)
      {
        case 0:plusFunction();
        break;
        case 1:minFunction();
        break;
      }
    }
    if(_level==2){
      int _randFun=_random.nextInt(2);
      print('LEVEL 2 IS CALLED');
      switch(_randFun)
      {
        case 0:plusFunction();
        break;
        case 1:mupFunction();
        break;
      }
    }
    if(_level==3){
      print('LEVEL 3 IS CALLED');
      int _randFun=_random.nextInt(2);
      switch(_randFun)
      {
        case 0:divFunction();
        break;
        case 1:mupFunction();
        break;
      }
    }
    if(_level==4){
      int _randFun=_random.nextInt(2);
      switch(_randFun)
      {
        case 0:divFunction();
        break;
        case 1:minFunction();
        break;
      }
    }
    if(_level==5){
      int _randFun=_random.nextInt(2);
      switch(_randFun)
      {
        case 0:mupFunction();
        break;
        case 1:minFunction();
        break;
      }
    }
    if(_level==6){
      int _randFun=_random.nextInt(2);
      switch(_randFun)
      {
        case 0:mupFunction();
        break;
        case 1:minFunction();
        break;
      }
    }

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
    print( "MY LIST"+"$a" + " " "$b" + " " + "$c" + " " "$d");
  }


  checkRes(int a) {
    print('CLICK $a');
    int aa = a;
    //show congratulations toast
    if (aa == _res) {
      final player = AudioCache();
      // congrats sound
      player.play('play.wav');

      setState(() {});

      _score++;
    } else {
      print("ERROR");
      final player = AudioCache();
      player.play('buzzer.wav');
      WrongMsgDialoge();
    }


    //set level
    if(_score>=5&&_score<=10){
      _level=2;
     if(_score==5){
       setState(() {
         showLevel=true;
       });
     }
    }
    if(_score>=10&&_score<15){
      _level=3;
      if(_score==10){
        setState(() {
          showLevel=true;
        });

      }
    }
    if(_score>=15&&_score<20){
      _level=4;
      if(_score==15){
        setState(() {
          showLevel=true;
        });

      }
    }
  }

  Future<dynamic> WrongMsgDialoge() {
    return showDialog(context: context, builder: (context)=>AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height / 2,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage(
              "images/wrong_board.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: Image.asset(
                      "images/cancel.png",
                      fit: BoxFit.fill,
                      width: 90,
                      height: 40,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    child: Image.asset(
                      "images/again.png",
                      fit: BoxFit.fill,
                      width: 125,
                      height: 40,
                    ),
                    onTap: () {

                      Navigator.pop(context);
                      setState(() {
                        _score=0;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              SizedBox(height: 70,)
            ],
          ),
        ),
      ),
    ));
  }

  void plusFunction() {
    setState(() {
       signImg='images/plus.png';
      _index1 = _random.nextInt(9);
      _index2 = _random.nextInt(9);
      _rand1 = _random.nextInt(24);
      _rand2 = _random.nextInt(24);
      _rand3 = _random.nextInt(24);

      _res = _index1 + _index2;

      print('PLUS $_res');
      // _score =_score +_index1 + _index2 + 2;

      suffle(_rand1, _rand2, _rand3, _res);
    });
  }

  void minFunction() {
    setState(() {
      signImg='images/minus.png';
      _index1 = _random.nextInt(9);
      _index2 = _random.nextInt(9);
      if(_index2>_index1)
      {
        setState(() {
          _index1=_index2;
          _index2=_index1-1;
        });
      }
      print(_index1.toString()+"=="+_index2.toString());

      _rand1 = _random.nextInt(9);
      _rand2 = _random.nextInt(9);
      _rand3 = _random.nextInt(9);

      _res = _index1 - _index2 ;

      // _score =_score +_index1 + _index2 + 2;
      print('MINUS $_res');
      suffle(_rand1, _rand2, _rand3, _res);
    });
  }

  void mupFunction() {
    setState(() {
      signImg='images/mup.png';
      _index1 = _random.nextInt(9);
      _index2 = _random.nextInt(9);
      _rand1 = _random.nextInt(81);
      _rand2 = _random.nextInt(50);
      _rand3 = _random.nextInt(81);

      _res = (_index1) * (_index2) ;

      // _score =_score +_index1 + _index2 + 2;

      suffle(_rand1, _rand2, _rand3, _res);
    });
  }
  void divFunction() {
    setState(() {
      signImg='images/div.png';
      int aa = (_random.nextInt(8) & -2);
      int bb = (_random.nextInt(8) & -2);

      if(aa<bb)
      {
        bb=aa;
        aa=bb;
      }
      _index1=aa;
      _index2=bb;
      try {
        while(_index1 % _index2 != 0)
        {
          _index2 = _random.nextInt(4);
        }
        print(_index1.toString()+" : "+_index2.toString());
      } on IntegerDivisionByZeroException {
        _res=1;
        print("Cannot divide by Zero");
      }

      _res = ((_index1+1) ~/ (_index2+1));

      print('$_index1+": "+$_index2 " : "$_res');
      _rand1 = _random.nextInt(9);
      _rand2 = _random.nextInt(8);
      _rand3 = _random.nextInt(9);
      suffle(_rand1, _rand2, _rand3, _res);
    });
  }

}
