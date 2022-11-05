import 'dart:io';

import 'dart:math';

enum moves { Rock, Paper, Scissors }
void main() {
  final rng = Random();
  while (true) {
    stdout.write('Rock,Paper and Scissors? (r/p/s)  ');
    var input = stdin.readLineSync();
    // print(input);
    if (input == 'r' || input == 'p' || input == 's') {
      var playermove;
      if (input == 'r') {
        playermove = moves.Rock;
        input = "Rock";
      } else if (input == 'p') {
        playermove = moves.Paper;
        input = "Paper";
      } else {
        playermove = moves.Scissors;
        input = "Scissors";
      }
      var random = rng.nextInt(2);
      final aiMove = moves.values[random];
      print('SELECTED : $input');
      print('AI Move : ${aiMove.name}');
      if (playermove == aiMove) {
        print('Match Draw');
      } else if (playermove == moves.Rock && aiMove == moves.Scissors ||
          playermove == moves.Scissors && aiMove == moves.Paper ||
          playermove == moves.Paper && aiMove == moves.Rock) {
        print('YOU WON THE MATCH');
      } else {
        print('YOU lost THE MATCH');
      }
    } else if (input == 'q') {
      break;
    } else {
      print('ENTERED INVALID INPUT');
    }
  }
}
