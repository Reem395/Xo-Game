import 'package:flutter/material.dart';
import 'dart:math';

import 'package:xo_game/HomeScreen.dart';

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    if (z == null) {
      return contains(x) && contains(y);
    } else {
      return contains(x) && contains(y) && contains(z);
    }
  }
}

class GameLogic {
  static List playerX = [];
  static List playerO = [];
  static String currentPlayer = "X";
  static int? randomO;

  static onCellClicked(int index, BuildContext context) {
    //check for available cells
    if (playerO.length + playerX.length < 9) {
      if (!(playerO.contains(index) || playerX.contains(index))) {
        // currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        if (currentPlayer == 'X') {
          playerX.add(index);
          // currentPlayer='X';
        } else {
          playerO.add(index);
          // currentPlayer='O';
        }
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        //check if all cells has been completed
        if (playerO.length + playerX.length == 9) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: const Text("Game Over!"),
                  content: const Text("Nobody Win"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          resetGame();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const HomeScreen()));
                        },
                        child: const Text("OK"))
                  ],
                );
              });
        }
      }
    }

    // print("Player X: $playerX");
    // print("Player O: $playerO");
    checkWin(context);
  }

  static randomMode(int index, BuildContext context) {
    if (playerO.length + playerX.length < 9) {
      if (!(playerO.contains(index) || playerX.contains(index))) {
        // print("index in random $index");
        playerX.add(index);
        currentPlayer = 'O';

        if (playerO.length + playerX.length < 9) {
          /**
           * Attack
           */
          if (playerO.containsAll(1, 2) &&
              !playerO.contains(0) &&
              !playerX.contains(0)) {
            playerO.add(0);
          } else if (playerO.containsAll(0, 2) &&
              !playerO.contains(1) &&
              !playerX.contains(1)) {
            playerO.add(1);
          } else if (playerO.containsAll(0, 1) &&
              !playerO.contains(2) &&
              !playerX.contains(2)) {
            playerO.add(2);
            //3,4,5
          } else if (playerO.containsAll(3, 4) &&
              !playerO.contains(5) &&
              !playerX.contains(5)) {
            playerO.add(5);
          } else if (playerO.containsAll(3, 5) &&
              !playerO.contains(4) &&
              !playerX.contains(4)) {
            playerO.add(4);
          } else if (playerO.containsAll(4, 5) &&
              !playerO.contains(3) &&
              !playerX.contains(3)) {
            playerO.add(3);
            //6,7,8
          } else if (playerO.containsAll(6, 7) &&
              !playerO.contains(8) &&
              !playerX.contains(8)) {
            playerO.add(8);
          } else if (playerO.containsAll(6, 8) &&
              !playerO.contains(7) &&
              !playerX.contains(7)) {
            playerO.add(7);
          } else if (playerO.containsAll(7, 8) &&
              !playerO.contains(6) &&
              !playerX.contains(6)) {
            playerO.add(6);
            //0,3,6
          } else if (playerO.containsAll(0, 3) &&
              !playerO.contains(6) &&
              !playerX.contains(6)) {
            playerO.add(6);
          } else if (playerO.containsAll(3, 6) &&
              !playerO.contains(0) &&
              !playerX.contains(0)) {
            playerO.add(0);
          } else if (playerO.containsAll(0, 6) &&
              !playerO.contains(3) &&
              !playerX.contains(3)) {
            playerO.add(3);
            //1,4,7
          } else if (playerO.containsAll(1, 4) &&
              !playerO.contains(7) &&
              !playerX.contains(7)) {
            playerO.add(7);
          } else if (playerO.containsAll(4, 7) &&
              !playerO.contains(1) &&
              !playerX.contains(1)) {
            playerO.add(1);
          } else if (playerO.containsAll(1, 7) &&
              !playerO.contains(4) &&
              !playerX.contains(4)) {
            playerO.add(4);
            //2,5,8
          } else if (playerO.containsAll(2, 5) &&
              !playerO.contains(8) &&
              !playerX.contains(8)) {
            playerO.add(8);
          } else if (playerO.containsAll(2, 8) &&
              !playerO.contains(5) &&
              !playerX.contains(5)) {
            playerO.add(5);
          } else if (playerO.containsAll(5, 8) &&
              !playerO.contains(2) &&
              !playerX.contains(2)) {
            playerO.add(2);
            //0,4,8
          } else if (playerO.containsAll(0, 4) &&
              !playerO.contains(8) &&
              !playerX.contains(8)) {
            playerO.add(8);
          } else if (playerO.containsAll(4, 8) &&
              !playerO.contains(0) &&
              !playerX.contains(0)) {
            playerO.add(0);
          } else if (playerO.containsAll(0, 8) &&
              !playerO.contains(4) &&
              !playerX.contains(4)) {
            playerO.add(4);
            //2,4,6
          } else if (playerO.containsAll(2, 4) &&
              !playerO.contains(6) &&
              !playerX.contains(6)) {
            playerO.add(6);
          } else if (playerO.containsAll(4, 6) &&
              !playerO.contains(2) &&
              !playerX.contains(2)) {
            playerO.add(2);
          } else if (playerO.containsAll(2, 6) &&
              !playerO.contains(4) &&
              !playerX.contains(4)) {
            playerO.add(4);
          }
          //Defense
          else if (playerX.containsAll(1, 2) &&
              !playerO.contains(0) &&
              !playerX.contains(0)) {
            playerO.add(0);
          } else if (playerX.containsAll(0, 2) &&
              !playerO.contains(1) &&
              !playerX.contains(1)) {
            playerO.add(1);
          } else if (playerX.containsAll(0, 1) &&
              !playerO.contains(2) &&
              !playerX.contains(2)) {
            playerO.add(2);
            //3,4,5
          } else if (playerX.containsAll(3, 4) &&
              !playerO.contains(5) &&
              !playerX.contains(5)) {
            playerO.add(5);
          } else if (playerX.containsAll(3, 5) &&
              !playerO.contains(4) &&
              !playerX.contains(4)) {
            playerO.add(4);
          } else if (playerX.containsAll(4, 5) &&
              !playerO.contains(3) &&
              !playerX.contains(3)) {
            playerO.add(3);
            //6,7,8
          } else if (playerX.containsAll(6, 7) &&
              !playerO.contains(8) &&
              !playerX.contains(8)) {
            playerO.add(8);
          } else if (playerX.containsAll(6, 8) &&
              !playerO.contains(7) &&
              !playerX.contains(7)) {
            playerO.add(7);
          } else if (playerX.containsAll(7, 8) &&
              !playerO.contains(6) &&
              !playerX.contains(6)) {
            playerO.add(6);
            //0,3,6
          } else if (playerX.containsAll(0, 3) &&
              !playerO.contains(6) &&
              !playerX.contains(6)) {
            playerO.add(6);
          } else if (playerX.containsAll(3, 6) &&
              !playerO.contains(0) &&
              !playerX.contains(0)) {
            playerO.add(0);
          } else if (playerX.containsAll(0, 6) &&
              !playerO.contains(3) &&
              !playerX.contains(3)) {
            playerO.add(3);
            //1,4,7
          } else if (playerX.containsAll(1, 4) &&
              !playerO.contains(7) &&
              !playerX.contains(7)) {
            playerO.add(7);
          } else if (playerX.containsAll(4, 7) &&
              !playerO.contains(1) &&
              !playerX.contains(1)) {
            playerO.add(1);
          } else if (playerX.containsAll(1, 7) &&
              !playerO.contains(4) &&
              !playerX.contains(4)) {
            playerO.add(4);
            //2,5,8
          } else if (playerX.containsAll(2, 5) &&
              !playerO.contains(8) &&
              !playerX.contains(8)) {
            playerO.add(8);
          } else if (playerX.containsAll(2, 8) &&
              !playerO.contains(5) &&
              !playerX.contains(5)) {
            playerO.add(5);
          } else if (playerX.containsAll(5, 8) &&
              !playerO.contains(2) &&
              !playerX.contains(2)) {
            playerO.add(2);
            //0,4,8
          } else if (playerX.containsAll(0, 4) &&
              !playerO.contains(8) &&
              !playerX.contains(8)) {
            playerO.add(8);
          } else if (playerX.containsAll(4, 8) &&
              !playerO.contains(0) &&
              !playerX.contains(0)) {
            playerO.add(0);
          } else if (playerX.containsAll(0, 8) &&
              !playerO.contains(4) &&
              !playerX.contains(4)) {
            playerO.add(4);
            //2,4,6
          } else if (playerX.containsAll(2, 4) &&
              !playerO.contains(6) &&
              !playerX.contains(6)) {
            playerO.add(6);
          } else if (playerX.containsAll(4, 6) &&
              !playerO.contains(2) &&
              !playerX.contains(2)) {
            playerO.add(2);
          } else if (playerX.containsAll(2, 6) &&
              !playerO.contains(4) &&
              !playerX.contains(4)) {
            playerO.add(4);
          } else {
            do {
              randomO = Random().nextInt(8);
            } while (playerO.contains(randomO) || playerX.contains(randomO));
            playerO.add(randomO);
          }
          // print("randomO: $randomO");
          currentPlayer = 'X';
        }

        if (playerO.length + playerX.length == 9) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text("Game Over!"),
                  content: Text("Nobody Win"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          resetGame();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeScreen()));
                        },
                        child: Text("OK"))
                  ],
                );
              });
        }
      }
    }
    checkWin(context);
  }

  static checkWin(BuildContext context) {
    if ((playerO.containsAll(0, 1, 2)) ||
        (playerO.containsAll(3, 4, 5)) ||
        (playerO.containsAll(6, 7, 8)) ||
        // vertical

        (playerO.containsAll(0, 3, 6)) ||
        (playerO.containsAll(1, 4, 7)) ||
        (playerO.containsAll(2, 5, 8)) ||

        //cross
        (playerO.containsAll(0, 4, 8)) ||
        (playerO.containsAll(2, 4, 6))) {
      // Fluttertoast.showToast(msg: "Player O Win!",toastLength: Toast.LENGTH_LONG);
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text("Congratulations!"),
              content: Text("Player O Wins!"),
              actions: [
                TextButton(
                    onPressed: () {
                      // print("OOOOOOOOOO");
                      Navigator.pop(context);
                      resetGame();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomeScreen()));
                    },
                    child: Text("OK"))
              ],
            );
          });
    }

    //Check X
    if ((playerX.containsAll(0, 1, 2)) ||
        (playerX.containsAll(3, 4, 5)) ||
        (playerX.containsAll(6, 7, 8)) ||
        // vertical

        (playerX.containsAll(0, 3, 6)) ||
        (playerX.containsAll(1, 4, 7)) ||
        (playerX.containsAll(2, 5, 8)) ||

        //cross
        (playerX.containsAll(0, 4, 8)) ||
        (playerX.containsAll(2, 4, 6))) {
      // Fluttertoast.showToast(msg: "Player X Win!",toastLength: Toast.LENGTH_LONG);
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text("Congratulations!"),
              content: Text("Player X Wins!"),
              actions: [
                TextButton(
                    onPressed: () {
                      // print("XXXXXXXXX");
                      Navigator.pop(context);
                      resetGame();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomeScreen()));
                    },
                    child: Text("OK"))
              ],
            );
          });
      //  resetGame();
    }
  }

  static resetGame() {
    currentPlayer = 'X';
    playerO.clear();
    playerX.clear();
  }
}
