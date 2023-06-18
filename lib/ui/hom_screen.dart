import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/game_screen.dart';
import 'package:tic_tac_toe/utils/colors.dart';
import 'package:tic_tac_toe/widgets/w_back.dart';
import 'package:tic_tac_toe/widgets/w_button.dart';
import 'package:tic_tac_toe/widgets/w_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: WBack(
            child: Stack(
              alignment: Alignment.center,
              children:[
                Column(
        children: [
                 Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: width,
                  child: Image.asset("assets/images/back.png"),
                ),
                const Center(
                  child: WTittle(title: "TIC-TAC-TOE"),
                )
              ],
          ),
          Column(
              children: [
                 SizedBox(
                  height: 200/950*height,
                ),
                const Text(
                  "Pick who goes first?",
                  style:
                      TextStyle(fontSize: 24, color: AppColors.white, shadows: [
                    Shadow(
                      color: AppColors.shadow,
                      blurRadius: 15,
                    )
                  ]),
                ),
                 SizedBox(
                  height: 21/950*height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WButton(
                      icon: "assets/svg/cross.svg",
                      onTab: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const GameScreen(currentPlayer: "x",)));
                      },
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    WButton(icon: "assets/svg/circle.svg", onTab: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const GameScreen(currentPlayer: "0",)));
                    }),
                  ],
                ),
              ],
          )
        ],
      ),
                const Align(
                   alignment: Alignment.bottomCenter,
                   child: Text("Farrux Madaminov",style: TextStyle(fontSize: 24,color: Colors.black45,shadows: [
                    Shadow(
                      color: AppColors.shadow,
                      blurRadius: 15,
                    )
                ]),),
                 ),
              ]
            ),
    ));
  }
}
