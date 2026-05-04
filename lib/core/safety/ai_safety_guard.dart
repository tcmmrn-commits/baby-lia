bool containsUnsafeContent(String input) {
  const blocked = <String>[
    'hate',
    'kill',
    'sex',
    'password',
    'address',
    'phone',
    'stupid',
    'idiot',
  ];

  final normalized = input.toLowerCase();
  return blocked.any(normalized.contains);
}
