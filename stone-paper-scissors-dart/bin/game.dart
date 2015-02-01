import 'dart:io';
import 'game_rules.dart';

class Game {
    var rules = new GameRules();

    void execute() {
        var userChoice = askUserForChoice();
        var machineChoice = rules.generateRandomChoice();
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

    void outputResult(userChoice, machineChoice, result) {
        print('Player 1 choice: ${userChoice}');
        print('Player 2 choice: ${machineChoice}');
        print('Winner: ${result}');
    }

}

