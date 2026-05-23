// ════════════════════════════════════════════════════════════
//  LESSON 5 — Classes & Objects
// ════════════════════════════════════════════════════════════
//
//  A CLASS is a blueprint. An OBJECT is something built from it.
//
//  This is the single most important concept for Flutter.
//  EVERYTHING in Flutter is a class.
//
//    Text('hello')         ← creating an object from the Text class
//    Container(width: 100) ← creating an object from the Container class
//    your own widgets      ← classes you define yourself
//
// ════════════════════════════════════════════════════════════

void run() {
  _header('LESSON 5 — Classes & Objects');

  // ── Creating objects from a class ────────────────────────
  //  DesignToken is defined below. We create two instances.
  DesignToken primaryColour = DesignToken(
    name: 'primary',
    value: '#534AB7',
    type: 'colour',
  );

  DesignToken bodyFont = DesignToken(
    name: 'body',
    value: '16',
    type: 'fontSize',
  );

  // ── Accessing properties ──────────────────────────────────
  print('Token name:  ${primaryColour.name}');
  print('Token value: ${primaryColour.value}');

  // ── Calling methods ───────────────────────────────────────
  primaryColour.describe();
  bodyFont.describe();

  // ── Inheritance — a class can extend another ─────────────
  //  The child gets all the parent's properties and methods,
  //  and can add or override its own.
  ColourToken brand = ColourToken(
    name: 'brand',
    value: '#534AB7',
    isDark: true,
  );

  brand.describe();
  print('Is dark: ${brand.isDark}');
  print('Text colour: ${brand.textColour()}');

  // ── toString override ─────────────────────────────────────
  //  When you print an object, Dart calls toString() on it.
  //  If you don't override it, you get something useless like
  //  "Instance of 'DesignToken'". Override it to get something helpful.
  print('\nPrinting object: $primaryColour');
  print('Printing colour: $brand');

  // ── Immutable classes with const constructors ─────────────
  //  In Flutter, widgets are often const — they never change.
  //  A const constructor means all properties must be final.
  const AppTheme light = AppTheme(name: 'light', background: '#FFFFFF');
  const AppTheme dark = AppTheme(name: 'dark', background: '#1E1E2E');

  print('\nThemes:');
  print('  $light');
  print('  $dark');

  _challenge('''
  1. Create a class called Screen with properties:
       String name, String route, bool requiresAuth
     Add a method called describe() that prints all three.
  2. Create two Screen objects: one for Home ("/", no auth)
     and one for Profile ("/profile", requires auth).
  3. Call describe() on both.''');
}

// ─────────────────────────────────────────────────────────────
//  Class definitions
// ─────────────────────────────────────────────────────────────

// A basic class with properties, a constructor, and a method
class DesignToken {
  // Properties — what this object knows about itself
  String name;
  String value;
  String type;

  // Constructor — called when you create a new DesignToken(...)
  // The named {} syntax mirrors how Flutter widgets work
  DesignToken({
    required this.name,
    required this.value,
    required this.type,
  });

  // Method — something the object can do
  void describe() {
    print('[$type] $name = $value');
  }

  // toString — controls what prints when you use $object in a string
  @override
  String toString() => 'DesignToken($type: $name → $value)';
}

// Inheritance — ColourToken extends DesignToken
// It gets everything DesignToken has, plus its own stuff
class ColourToken extends DesignToken {
  bool isDark; // extra property only colour tokens have

  ColourToken({
    required String name,
    required String value,
    required this.isDark,
  }) : super(name: name, value: value, type: 'colour');
  // ↑ super(...) calls the parent constructor

  // Extra method only ColourToken has
  String textColour() => isDark ? '#FFFFFF' : '#000000';

  // Override the parent's toString
  @override
  String toString() => 'ColourToken($name → $value, dark: $isDark)';
}

// Immutable class — all properties are final, constructor is const
// This mirrors how Flutter's own widgets work internally
class AppTheme {
  final String name;
  final String background;

  const AppTheme({required this.name, required this.background});

  @override
  String toString() => 'AppTheme($name, bg: $background)';
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
