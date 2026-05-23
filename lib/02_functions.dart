// ════════════════════════════════════════════════════════════
//  LESSON 2 — Functions
// ════════════════════════════════════════════════════════════
//
//  A function is a reusable block of code with a name.
//  You define it once, call it as many times as you want.
//
//  Anatomy:
//    returnType  name  ( parameters ) { body }
//       ↓         ↓         ↓            ↓
//      void    greet  (String name)  { print(...); }
//
// ════════════════════════════════════════════════════════════

void run() {
  _header('LESSON 2 — Functions');

  // ── void — function that does something, returns nothing ──
  printDivider();
  greet('Adila');

  // ── return value — function that gives something back ─────
  int result = add(10, 5);
  print('add(10, 5) → $result');

  // ── String return ─────────────────────────────────────────
  String label = buttonLabel(isLoggedIn: true);
  print('button label → $label');

  // ── Named parameters — more readable, order doesn't matter ─
  //  In Flutter, almost ALL widget properties are named params.
  //  e.g. Text('hello', fontSize: 16, color: Colors.blue)
  printUserCard(name: 'Adila', role: 'UX Engineer', level: 2);

  // ── Arrow function — shorthand for one-liners ─────────────
  //  The => replaces { return ...; }
  print('square(4) → ${square(4)}');

  // ── Anonymous function (lambda) ───────────────────────────
  //  A function with no name. Often passed as an argument.
  //  You'll see this constantly in Flutter with onPressed: () { ... }
  List<String> colours = ['purple', 'teal', 'coral'];
  colours.forEach((colour) {
    print('  colour: $colour');
  });

  // ── Same thing with arrow shorthand ───────────────────────
  colours.forEach((colour) => print('  → $colour'));

  _challenge('''
  1. Write a function called fullName(String first, String last)
     that returns the two words joined with a space.
  2. Write a function called isAdult({required int age}) that
     returns true if age >= 18, false otherwise.
  3. Call both functions and print the results.''');
}

// ─────────────────────────────────────────────────────────────
//  Function definitions
// ─────────────────────────────────────────────────────────────

// void — no return value, just does something
void printDivider() {
  print('─' * 40);
}

// Basic parameter
void greet(String name) {
  print('Hello, $name!');
}

// Returns an int
int add(int a, int b) {
  return a + b;
}

// Arrow syntax — shorthand for single-expression functions
int square(int n) => n * n;

// Returns a String based on a condition
String buttonLabel({required bool isLoggedIn}) {
  return isLoggedIn ? 'Log out' : 'Log in';
}

// Named parameters — note the curly braces {}
// required means the caller MUST pass this value
void printUserCard({
  required String name,
  required String role,
  int level = 1, // default value — optional, falls back to 1
}) {
  print('\n  Name:  $name');
  print('  Role:  $role');
  print('  Level: $level\n');
}

// ── Helpers ──────────────────────────────────────────────────
void _header(String title) {
  print('\n${'═' * 52}');
  print('  $title');
  print('${'═' * 52}\n');
}

void _challenge(String text) {
  print('\n┌─ 🎯 CHALLENGE ──────────────────────────────────────');
  for (final line in text.trim().split('\n')) {
    print('│ $line');
  }
  print('└─────────────────────────────────────────────────────\n');
}
