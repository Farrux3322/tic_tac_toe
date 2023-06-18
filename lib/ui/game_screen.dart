import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/ui/hom_screen.dart';
import 'package:tic_tac_toe/utils/colors.dart';
import 'package:tic_tac_toe/widgets/w_back.dart';
import 'package:tic_tac_toe/widgets/w_title.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key, required this.currentPlayer}) : super(key: key);

  final String currentPlayer;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> _board = [];

  String _currentPlayer = "";
  String winner = "";

  @override
  void initState() {
    _currentPlayer = widget.currentPlayer;
    _board = List.filled(9, "");
    super.initState();
  }

  void _switchPlayer() {
    _currentPlayer = _currentPlayer == "x" ? "0" : "x";
  }

  void _playMove(int index) {
    if (_board[index] == "" && winner == "") {
      setState(() {
        _board[index] = _currentPlayer;
        _switchPlayer();
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    var lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var line in lines) {
      var a = _board[line[0]];
      var b = _board[line[1]];
      var c = _board[line[2]];

      if (a == b && a == c && a != "") {
        winner = a;
        break;
      }
    }

    if (winner == "" && !_board.contains("")) {
      winner = "Draw !!!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WBack(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WTittle(
                  title: winner == ""
                      ? "Player - $_currentPlayer"
                      : "Winner - $winner"),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 324,
                height: 324,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 5,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GridView.count(
                    padding: EdgeInsets.zero,
                    crossAxisCount: 3,
                    children: [
                      ...List.generate(
                          9,
                          (index) => ZoomTapAnimation(
                                onTap: () => _playMove(index),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.shadow, width: 1)),
                                  child: _board[index] != ""
                                      ? Center(
                                          child: SvgPicture.asset(
                                          _board[index] == "0"
                                              ? "assets/svg/circle.svg"
                                              : "assets/svg/cross.svg",
                                          width: 36,
                                          height: 36,
                                        ))
                                      : const SizedBox(),
                                ),
                              ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (winner != "") ...{
                ZoomTapAnimation(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: Container(
                    width: 150,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "Reset",
                      style: TextStyle(fontSize: 24, color: AppColors.white),
                    ),
                  ),
                )
              },

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
      ),
    );
  }
}
