import 'dart:io';
import 'package:dart_fundamentals/01_variables.dart' as lesson1;
import 'package:dart_fundamentals/02_functions.dart' as lesson2;
import 'package:dart_fundamentals/03_conditionals.dart' as lesson3;
import 'package:dart_fundamentals/04_loops.dart' as lesson4;
import 'package:dart_fundamentals/05_classes.dart' as lesson5;
import 'package:dart_fundamentals/06_lists_maps.dart' as lesson6;
import 'package:dart_fundamentals/07_null_safety.dart' as lesson7;

// ════════════════════════════════════════════════════════════
//  Dart Fundamentals — Interactive Launcher
//  Run with: dart run bin/main.dart
// ════════════════════════════════════════════════════════════

void main() {
  while (true) {
    _showMenu();

    final input = stdin.readLineSync()?.trim();

    if (input == null || input == 'q' || input == '0') {
      print('\n  See you next time! 👋\n');
      break;
    }

    final choice = int.tryParse(input);

    if (choice == null || choice < 1 || choice > 7) {
      print('\n  ⚠  Type a number between 1–7, or q to quit.\n');
      continue;
    }

    switch (choice) {
      case 1:
        lesson1.run();
      case 2:
        lesson2.run();
      case 3:
        lesson3.run();
      case 4:
        lesson4.run();
      case 5:
        lesson5.run();
      case 6:
        lesson6.run();
      case 7:
        lesson7.run();
    }

    print('\n  Press Enter to return to the menu...');
    stdin.readLineSync();
  }
}

void _showMenu() {
  print('''
╔══════════════════════════════════════════════════╗
║         DART FUNDAMENTALS  — by Adila            ║
╠══════════════════════════════════════════════════╣
║                                                  ║
║   1 · Variables & Data Types                     ║
║   2 · Functions                                  ║
║   3 · Conditionals                               ║
║   4 · Loops                                      ║
║   5 · Classes & Objects                          ║
║   6 · Lists & Maps                               ║
║   7 · Null Safety                                ║
║                                                  ║
║   q · Quit                                       ║
║                                                  ║
╚══════════════════════════════════════════════════╝
  Pick a lesson (1–7): ''');
}
