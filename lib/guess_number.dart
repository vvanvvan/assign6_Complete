// ignore_for_file: avoid_print

import 'dart:io';
import 'game.dart';
import 'main.dart';

/*
void main() {
  while (true) {
    //playGame();
    String? input;

    do {
      stdout.write('Play again? (Y/N): ');
      input = stdin.readLineSync();
    } while (input!.toLowerCase() != 'y' && input.toLowerCase() != 'n');

    if (input.toLowerCase() == 'n') break;
  }

  print('\n\nYou\'ve played ${Game.guessCountList.length} games');
  for (var i = 0; i < Game.guessCountList.length; i++) {
    print('🚀 Game #${i + 1}: ${Game.guessCountList[i]} guesses');
  }

  /*var myList = [];
  myList.add(1);
  myList.add('hello');
  myList.add(false);
  for (var i = 0; i < myList.length; i++) {
    print(myList[i]);
  }
  myList.forEach((item) {
    print(item);
  });*/
}*/



String playGame(var input, var game) {
  // int? maxRandom;
  /*do {
    stdout.write('\nEnter a maximum number to random: ');
    var input = stdin.readLineSync();
    maxRandom = int.tryParse(input!);
  } while (maxRandom == null);*/

  //var game = Game();
  var isCorrect = false;
  var textShow = "";

  do {

    var new_input = input;
    var guess = int.tryParse(new_input!);
    if (guess == null) {
      textShow  = 'กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น';
      return textShow ;
      continue;
    }

    var result = game.doGuess(guess);

    if (result == 1) {
      textShow  =  '$guess มากเกินไป กรุณาลองใหม่ ❤';
      return textShow ;
    } else if (result == -1) {
      textShow  =  '$guess น้อยเกินไป กรุณาลองใหม่ ❤';
      return textShow ;
    } else if (result == 0) {
      textShow  =  '$guess ถูกต้องนะครับ ❤, คุณทายทั้งหมด : ${game.guessCount} ครั้ง';
      return textShow ;
      //Game.guessCountList.add(game.guessCount);
      //Game().addCountList();
    }else if (result == 4) {
      textShow  = 'กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น';
      isCorrect = true;
      return textShow ;
    }
  } while (!isCorrect);
  return textShow ;

}