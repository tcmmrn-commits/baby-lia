String routeTopic(String input) {
  final value = input.toLowerCase();
  if (value.contains('color') ||
      value.contains('blue') ||
      value.contains('red')) {
    return 'colors';
  }
  if (value.contains('count') ||
      value.contains('number') ||
      value.contains('one')) {
    return 'numbers';
  }
  if (value.contains('shape') ||
      value.contains('circle') ||
      value.contains('star')) {
    return 'shapes';
  }
  if (value.contains('happy') ||
      value.contains('sad') ||
      value.contains('feel')) {
    return 'feelings';
  }
  return 'redirect';
}
