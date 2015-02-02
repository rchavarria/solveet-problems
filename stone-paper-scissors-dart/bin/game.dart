import 'dart:io';
import 'dart:math';
import 'game_rules.dart';

class Game {
    var random = new Random();
    var rules = new GameRules();
    var choices = ['stone', 'paper', 'scissors'];

    void execute() {
        var userChoice = askUserForChoice();
        var machineChoice = generateRandomChoice();
        var result = rules.play(userChoice, machineChoice);
        outputResult(userChoice, machineChoice, result);
    }

    String askUserForChoice() {
        print('Write your choice (stone, paper, scissors): ');
        String choice = stdin.readLineSync();

        if (!rules.choices.contains(choice)) {
            return askUserForChoice();
        }
        return choice;
    }

    String generateRandomChoice() => choices.elementAt(random.nextInt(choices.length));

    void outputResult(userChoice, machineChoice, result) {
        print('Player 1 choice: ${userChoice}');
        print('Player 2 choice: ${machineChoice}');
        print('Winner: ${result}');
    }

}

