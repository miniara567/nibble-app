class SubmissionValidator {
  static String? validateUrl(String url) {
    final trimmed = url.trim();
    if (trimmed.isEmpty) {
      return 'Paste a video URL to continue.';
    }
    final pattern = RegExp(r'^(https?:\\/\\/).+');
    if (!pattern.hasMatch(trimmed)) {
      return 'Enter a valid URL including https://';
    }
    const supported = ['tiktok', 'instagram', 'threads', 'youtube'];
    final containsSupported = supported.any(trimmed.toLowerCase().contains);
    if (!containsSupported) {
      return 'Only TikTok, Instagram, Threads, or YouTube links are supported for now.';
    }
    return null;
  }
}
