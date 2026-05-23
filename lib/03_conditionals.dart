// ════════════════════════════════════════════════════════════
//  LESSON 3 — Conditionals
// ════════════════════════════════════════════════════════════
//
//  Conditionals let your code make decisions.
//  "If this is true, do X. Otherwise, do Y."
//
//  You'll use these constantly in Flutter to show different
//  widgets depending on state — loading, empty, error, success.
//
// ════════════════════════════════════════════════════════════

void run() {
  _header('LESSON 3 — Conditionals');

  // ── Basic if / else ───────────────────────────────────────
  bool isLoggedIn = true;

  if (isLoggedIn) {
    print('Welcome back!');
  } else {
    print('Please log in.');
  }

  // ── else if — multiple branches ───────────────────────────
  int score = 72;

  if (score >= 90) {
    print('Score $score → Excellent');
  } else if (score >= 60) {
    print('Score $score → Good');
  } else {
    print('Score $score → Keep going');
  }

  // ── Comparison operators ─────────────────────────────────
  //  ==   equal to
  //  !=   not equal to
  //  >    greater than
  //  <    less than
  //  >=   greater than or equal
  //  <=   less than or equal

  // ── Logical operators ─────────────────────────────────────
  //  &&   AND — both must be true
  //  ||   OR  — at least one must be true
  //  !    NOT — flips true to false

  bool hasInternet = true;
  bool isSubscribed = false;

  if (hasInternet && isSubscribed) {
    print('Show premium content');
  } else if (hasInternet && !isSubscribed) {
    print('Show upgrade prompt');
  } else {
    print('Show offline screen');
  }

  // ── Ternary operator — one-line if/else ───────────────────
  //  condition ? valueIfTrue : valueIfFalse
  //
  //  This is the most common pattern in Flutter widget trees.
  //  Example: isLoading ? CircularProgressIndicator() : Content()
  String buttonText = isLoggedIn ? 'Log out' : 'Log in';
  print('Button: $buttonText');

  // ── switch — clean alternative to many else-ifs ──────────
  String status = 'loading';

  switch (status) {
    case 'loading':
      print('Status: showing spinner...');
      break;
    case 'success':
      print('Status: showing data');
      break;
    case 'error':
      print('Status: showing error message');
      break;
    default:
      print('Status: unknown');
  }

  // ── Dart 3 pattern matching (modern switch) ───────────────
  //  Cleaner syntax — no break needed
  String badge = switch (score) {
    >= 90 => 'Gold',
    >= 70 => 'Silver',
    >= 50 => 'Bronze',
    _ => 'Try again', // _ is the default
  };
  print('Badge for score $score: $badge');

  _challenge('''
  1. Write an if/else that checks a String variable called
     connectionStatus. If it equals "wifi", print "Fast connection".
     If it equals "mobile", print "Slow connection". Else print
     "No connection".
  2. Rewrite challenge 1 using a switch statement.
  3. Use the ternary operator to set a String called theme to
     "dark" if a bool isDarkMode is true, else "light".''');
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
