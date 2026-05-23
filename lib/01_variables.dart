// ════════════════════════════════════════════════════════════
//  LESSON 1 — Variables & Data Types
// ════════════════════════════════════════════════════════════
//
//  A variable is a named box that holds a value.
//  Every value has a TYPE — it tells Dart what kind of data
//  is inside, so Dart can catch mistakes before you run anything.
//
// ════════════════════════════════════════════════════════════

void run() {
  _header('LESSON 1 — Variables & Data Types');

  // ── String — text, always in quotes ──────────────────────
  String name = 'Adila';
  print('String  →  $name');

  // ── int — whole numbers, no decimals ─────────────────────
  int age = 28;
  print('int     →  $age');

  // ── double — numbers with decimals ───────────────────────
  double height = 1.65;
  print('double  →  $height');

  // ── bool — only true or false, nothing else ──────────────
  bool isDesigner = true;
  print('bool    →  $isDesigner');

  // ── var — Dart figures out the type for you ──────────────
  //  Use this when the type is obvious from what you're assigning.
  var role = 'UX Engineer'; // Dart sees this is a String
  print('var     →  $role');

  // ── const — set at compile time, NEVER changes ───────────
  //  In Flutter you'll see this everywhere on widgets.
  //  It tells Flutter: "this never changes, skip re-rendering it."
  const String appName = 'Milli';
  print('const   →  $appName');

  // ── final — set once at runtime, can't be reassigned ─────
  //  Different from const: the value can be calculated at runtime,
  //  it just can't change after it's first set.
  final String greeting = 'Hello, $name!';
  print('final   →  $greeting');

  // ── String interpolation ─────────────────────────────────
  //  Use $ to drop a variable into a string.
  //  Use ${} for expressions.
  print('\n"My name is $name and I am $age years old."');
  print('"In 5 years I will be ${age + 5}."');

  // ── Type mismatch — Dart catches this ────────────────────
  //  Uncomment the line below to see Dart complain:
  //  String broken = 42; // ← ERROR: A value of type 'int' can't be assigned to 'String'

  _challenge('''
  1. Create a String variable for your job title and print it.
  2. Create an int for the year you started at Genvis and print
     how many years ago that was using \${2026 - yourYear}.
  3. Try using const vs final — what happens if you try to
     reassign either one?''');
}

// ── Shared helpers (used across all lessons) ─────────────────
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
