// ════════════════════════════════════════════════════════════
//  LESSON 6 — Lists & Maps
// ════════════════════════════════════════════════════════════
//
//  LIST  — an ordered collection. Access items by index (0, 1, 2…)
//  MAP   — a key-value lookup table. Access items by name.
//
//  In Flutter:
//    Lists → pass multiple children to a widget (Column, Row, etc.)
//    Maps  → represent JSON data from an API response
//
// ════════════════════════════════════════════════════════════

void run() {
  _header('LESSON 6 — Lists & Maps');

  // ════════════════════
  //  LISTS
  // ════════════════════

  // ── Creating a list ───────────────────────────────────────
  List<String> screens = ['Home', 'Search', 'Profile', 'Settings'];
  print('Screens: $screens');

  // ── Accessing items by index (starts at 0) ────────────────
  print('First screen: ${screens[0]}');
  print('Last screen:  ${screens[screens.length - 1]}');
  // Or use .first and .last
  print('First: ${screens.first}  Last: ${screens.last}');

  // ── Adding and removing ───────────────────────────────────
  screens.add('Notifications');
  print('After add: $screens');

  screens.remove('Search');
  print('After remove: $screens');

  screens.insert(1, 'Explore'); // insert at a specific index
  print('After insert: $screens');

  // ── Useful list properties ────────────────────────────────
  print('\nLength: ${screens.length}');
  print('Contains "Home": ${screens.contains("Home")}');
  print('Index of "Profile": ${screens.indexOf("Profile")}');
  print('Is empty: ${screens.isEmpty}');

  // ── Transforming lists ────────────────────────────────────
  //  These are the patterns you'll use most in Flutter
  List<String> routes = screens.map((s) => '/${s.toLowerCase()}').toList();
  print('\nRoutes: $routes');

  List<String> topLevel = screens.where((s) => s.length <= 7).toList();
  print('Short names: $topLevel');

  // ── Sorting ───────────────────────────────────────────────
  List<int> sizes = [24, 14, 32, 16, 12, 18];
  sizes.sort(); // sorts in place
  print('\nSorted sizes: $sizes');

  // ── Spread operator — combine lists ──────────────────────
  List<String> primary = ['Home', 'Search'];
  List<String> secondary = ['Settings', 'Help'];
  List<String> all = [...primary, ...secondary];
  print('Combined: $all');


  // ════════════════════
  //  MAPS
  // ════════════════════

  print('\n── Maps ─────────────────────────────────────────────\n');

  // ── Creating a map ────────────────────────────────────────
  Map<String, dynamic> user = {
    'name': 'Adila',
    'role': 'UX Engineer',
    'level': 2,
    'isActive': true,
  };
  // dynamic means the values can be any type

  // ── Accessing values by key ───────────────────────────────
  print('Name:  ${user['name']}');
  print('Level: ${user['level']}');

  // ── Adding and updating entries ───────────────────────────
  user['team'] = 'Design';      // add new key
  user['level'] = 3;            // update existing key
  print('\nUpdated user: $user');

  // ── Removing an entry ─────────────────────────────────────
  user.remove('isActive');
  print('After remove: $user');

  // ── Checking if a key exists ──────────────────────────────
  print('\nHas "name": ${user.containsKey("name")}');
  print('Has "email": ${user.containsKey("email")}');

  // ── Looping through a map ─────────────────────────────────
  print('\nAll entries:');
  user.forEach((key, value) {
    print('  $key: $value');
  });

  // ── Map of maps — like a JSON API response ─────────────────
  //  This is the shape of data you'll often get from a real API.
  Map<String, Map<String, String>> designTokens = {
    'primary': {'value': '#534AB7', 'type': 'colour'},
    'secondary': {'value': '#1D9E75', 'type': 'colour'},
    'bodyText': {'value': '16', 'type': 'fontSize'},
  };

  print('\nDesign tokens:');
  designTokens.forEach((name, token) {
    print('  $name → ${token['value']} (${token['type']})');
  });

  _challenge('''
  1. Create a List<String> of 5 Flutter widget names
     and print the 3rd one.
  2. Use map() to transform ['padding', 'margin', 'gap']
     into ['--padding', '--margin', '--gap'] (CSS variable style).
  3. Create a Map for a component with keys: name, variant,
     isDisabled. Print each key-value pair using forEach.''');
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
