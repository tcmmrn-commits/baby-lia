String simplifyReply(String input) {
  final trimmed = input.trim();
  if (trimmed.length <= 120) {
    return trimmed;
  }
  return '${trimmed.substring(0, 117)}...';
}
