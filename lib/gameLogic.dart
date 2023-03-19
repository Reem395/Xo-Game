import 'package:flutter/material.dart';
import 'dart:math';

import 'package:xo_game/HomeScreen.dart';


 extension ContainsAll on List{
 bool containsAll(int x , int y, [z]){
  if(z==null){
    return contains(x) && contains(y);
  }
  else {
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


    print("Player X: $playerX");
    print("Player O: $playerO");
    checkWin(context);
  }

  static randomMode(int index, BuildContext context) {
    if (playerO.length + playerX.length < 9) {
      if (!(playerO.contains(index) || playerX.contains(index))) {
      
        playerX.add(index);
        currentPlayer = 'O';

          if (playerO.length + playerX.length < 9) {
            do {
              randomO = Random().nextInt(8);
            } while (playerO.contains(randomO) || playerX.contains(randomO));
            playerO.add(randomO);
              print("randomO: $randomO");
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
    if ((playerO.containsAll(0,1,2)) ||
        (playerO.containsAll(3,4,5)) ||
        (playerO.containsAll(6,7,8)) ||
        // vertical

        (playerO.containsAll(0,3,6))||
        (playerO.containsAll(1,4,7))||
        (playerO.containsAll(2,5,8))||

        //cross
        (playerO.containsAll(0,4,8))||
        (playerO.containsAll(2,4,6))){

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
                      print("OOOOOOOOOO");
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
      if ((playerX.containsAll(0,1,2)) ||
        (playerX.containsAll(3,4,5)) ||
        (playerX.containsAll(6,7,8)) ||
        // vertical

        (playerX.containsAll(0,3,6))||
        (playerX.containsAll(1,4,7))||
        (playerX.containsAll(2,5,8))||

        //cross
        (playerX.containsAll(0,4,8))||
        (playerX.containsAll(2,4,6))){
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
                      print("XXXXXXXXX");
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
    print("RR");
    currentPlayer = 'X';
    playerO.clear();
    playerX.clear();
  }
}
