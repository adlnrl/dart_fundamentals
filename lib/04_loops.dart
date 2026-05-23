// ════════════════════════════════════════════════════════════
//  LESSON 4 — Loops
// ════════════════════════════════════════════════════════════
//
//  A loop repeats a block of code so you don't have to
//  write the same thing over and over.
//
//  In Flutter, loops are how you turn a list of data into
//  a list of widgets — e.g. one Card() for each item.
//
// ════════════════════════════════════════════════════════════

void run() {
  _header('LESSON 4 — Loops');

  // ── for loop — runs a set number of times ─────────────────
  //  Structure: for (start; condition; step)
  print('Counting up:');
  for (int i = 1; i <= 5; i++) {
    print('  $i');
  }

  // ── for-in — loop through every item in a list ────────────
  //  This is the most common loop you'll write.
  List<String> screens = ['Home', 'Search', 'Profile', 'Settings'];

  print('\nApp screens:');
  for (String screen in screens) {
    print('  → $screen');
  }

  // ── forEach — same as for-in but with a function ─────────
  //  You'll see this in Flutter when building widget lists.
  print('\nForEach version:');
  screens.forEach((screen) {
    print('  • $screen');
  });

  // ── Arrow shorthand ───────────────────────────────────────
  screens.forEach((screen) => print('  ◦ $screen'));

  // ── while — runs as long as a condition is true ───────────
  //  Use when you don't know how many times you'll loop.
  int attempts = 0;

  print('\nRetrying connection:');
  while (attempts < 3) {
    attempts++;
    print('  Attempt $attempts...');
  }
  print('  Gave up after $attempts attempts.');

  // ── map() — transforms each item into something new ───────
  //  Very common in Flutter: map a list of data → list of widgets.
  //  The .toList() at the end converts it back from an iterable.
  List<int> prices = [10, 25, 5, 40];
  List<String> formatted = prices.map((p) => '\$$p').toList();
  print('\nFormatted prices: $formatted');

  // ── where() — filters items that match a condition ─────────
  List<int> expensive = prices.where((p) => p > 15).toList();
  print('Prices over \$15: $expensive');

  // ── break and continue ─────────────────────────────────────
  print('\nBreak at 3:');
  for (int i = 1; i <= 5; i++) {
    if (i == 3) break; // stop the loop entirely
    print('  $i');
  }

  print('\nSkip 3:');
  for (int i = 1; i <= 5; i++) {
    if (i == 3) continue; // skip this iteration, keep going
    print('  $i');
  }

  _challenge('''
  1. Create a List<String> of 4 colour hex values from the
     Milli design system and print each one with for-in.
  2. Use map() to add a "#" prefix to a list of raw numbers:
     [FF5733, 534AB7, 1D9E75] → ["#FF5733", "#534AB7", "#1D9E75"]
  3. Use where() to filter a list of font sizes and keep
     only those >= 16: [12, 14, 16, 18, 24, 32]''');
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
