import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xo_game/GameLogic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// String currentPlayer = "X";

int score = 0;
String? currentPlayer;
bool twoPlayersMode = true;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(232, 68, 5, 39),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: MediaQuery.of(context).orientation==Orientation.portrait? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...firstSection(screenSize),
              gameGrid(),
              ...bottom_Section(screenSize)
            ],
          ):
          //Grid if orientation is landscape
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...firstSection(screenSize),
                    ...bottom_Section(screenSize),
                  ],
                ),
              ),
              gameGrid(),
            ],
          )
        ),
      ),
    );
  }

  List<Widget> firstSection(Size screenSize) {
    return [
      SwitchListTile.adaptive(
        value: twoPlayersMode,
        onChanged: (newValue) {
          setState(() {
            if (newValue) {
              Fluttertoast.showToast(
                  msg: "You're playing On 2 players mode!",
                  toastLength: Toast.LENGTH_SHORT);
              GameLogic.playerO.clear();
              GameLogic.playerX.clear();
            } else {
              Fluttertoast.showToast(
                  msg: "You Switched on Auto mode!",
                  toastLength: Toast.LENGTH_SHORT);
              GameLogic.playerO.clear();
              GameLogic.playerX.clear();
            }
            twoPlayersMode = newValue;
          });
        },
        title: const Text(
          "Turn on/off 2 players",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
       SizedBox(
        height:screenSize.height*0.02,
      ),
      Text(
        // "It's ${currentPlayer = GameLogic.CP == 'X' ? 'O' : 'X'} turn"
        "It's ${GameLogic.currentPlayer} turn".toUpperCase(),
        style: const TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: screenSize.height*0.04,
      ),
    ];
  }

  Widget gameGrid() {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 3,
        mainAxisSpacing: 9.0,
        crossAxisSpacing: 9.0,
        childAspectRatio: 1.0,
        children: List.generate(9, (index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
            child: InkWell(
              onTap: () {
                print(index);
                setState(() {
                  if (twoPlayersMode) {
                    GameLogic.onCellClicked(index, context);
                  } else {
                    print("RandomMode On");
                    GameLogic.randomMode(index, context);
                  }
                  // currentPlayer= currentPlayer=='X'?'O':'X';
                });
              },
              child: Center(
                  child: Text(
                GameLogic.playerX.contains(index)
                    ? 'X'
                    : GameLogic.playerO.contains(index)
                        ? 'O'
                        : '',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: GameLogic.playerX.contains(index)
                        ? Colors.black
                        : Color.fromARGB(232, 68, 5, 39)),
              )),
            ),
          );
        }),
      ),
    );
  }

  List<Widget> bottom_Section(Size screenSize) {
    return [
      ElevatedButton.icon(
        onPressed: () {
          setState(() {
            GameLogic.resetGame();
          });
        },
        label: Text("Repeat the game"),
        icon: const Icon(Icons.replay_outlined),
      ),
      SizedBox(
        height: screenSize.height*0.02,
      )
    ];
  }
}
