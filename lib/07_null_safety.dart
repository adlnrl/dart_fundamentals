// ════════════════════════════════════════════════════════════
//  LESSON 7 — Null Safety
// ════════════════════════════════════════════════════════════
//
//  NULL means "no value at all" — not zero, not empty string,
//  literally nothing.
//
//  Null safety is Dart's system that forces you to acknowledge
//  when something might be null, so your app doesn't crash
//  trying to use a value that isn't there.
//
//  Before null safety, this was the #1 cause of app crashes.
//
// ════════════════════════════════════════════════════════════

void run() {
  _header('LESSON 7 — Null Safety');

  // ── Non-nullable — must ALWAYS have a value ───────────────
  String name = 'Adila';
  // name = null; // ← COMPILE ERROR — Dart won't let you do this
  print('Name: $name');

  // ── Nullable — add ? to the type ─────────────────────────
  //  This means: "this variable might be null, and I'm aware of it."
  String? nickname; // currently null — no value assigned
  print('Nickname (unset): $nickname');

  nickname = 'Adi';
  print('Nickname (set): $nickname');

  // ── Checking for null before using ───────────────────────
  String? profileBio;

  if (profileBio != null) {
    print('Bio: $profileBio');
  } else {
    print('No bio yet.');
  }

  // ── ?? (null-aware operator) — provide a fallback ─────────
  //  If the value is null, use the right side instead.
  //  This is EVERYWHERE in Flutter UI code.
  String displayName = nickname ?? 'Anonymous';
  print('\nDisplay name: $displayName');

  String? bio;
  String shownBio = bio ?? 'No bio yet.'; // bio is null, so uses fallback
  print('Bio shown: $shownBio');

  // ── ??= (null-aware assignment) ───────────────────────────
  //  Assign only if the variable is currently null
  String? city;
  city ??= 'Melbourne';
  print('City: $city'); // Melbourne

  city ??= 'Sydney'; // city already has a value — this does nothing
  print('City: $city'); // still Melbourne

  // ── ?. (null-aware access) ────────────────────────────────
  //  Call a method or access a property only if not null.
  //  Returns null instead of crashing.
  String? username;
  print('\nUsername length: ${username?.length}'); // null — no crash!

  username = 'adila_ux';
  print('Username length: ${username?.length}'); // 8

  // ── ! (bang operator) — "I promise this is not null" ──────
  //  Forces Dart to treat a nullable type as non-null.
  //  Only use when you are 100% certain it's not null.
  //  If you're wrong, the app crashes at runtime.
  String? confirmedName = 'Adila';
  String definitelyName = confirmedName!;
  print('\nForced non-null: $definitelyName');

  // ── late — declare now, assign later ─────────────────────
  //  Use when you know a variable will be set before it's used,
  //  but you can't set it right at declaration.
  late String welcomeMessage;
  welcomeMessage = 'Welcome to Milli, $name!'; // must be set before first use
  print('\nLate variable: $welcomeMessage');

  // ── Real Flutter pattern: nullable API data ───────────────
  //  When you fetch a user from an API, fields might be missing.
  Map<String, dynamic> apiResponse = {
    'name': 'Adila',
    'avatarUrl': null, // server didn't return this
    // 'bio' is missing entirely
  };

  String userName = apiResponse['name'] ?? 'Unknown';
  String avatar = apiResponse['avatarUrl'] ?? 'assets/default_avatar.png';
  String userBio = apiResponse['bio'] ?? 'No bio yet.';

  print('\nUser card from API:');
  print('  Name:   $userName');
  print('  Avatar: $avatar');
  print('  Bio:    $userBio');

  _challenge('''
  1. Declare a nullable String? called errorMessage.
     Print it using ?? to show "No errors" if it's null.
     Then set it to "Network timeout" and print again.

  2. Write a function called getInitials(String? name) that:
     - Returns "?" if name is null
     - Otherwise returns the first letter using name[0]
     Test it with both null and a real name.

  3. Using ?. on a nullable String?, try to call .toUpperCase()
     on it. Print the result. What do you get when it's null?''');
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
