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
        return 'scissors';
    }

    void outputResult(userChoice, machineChoice, result) {
        print('Result: ${result}');
    }

}

