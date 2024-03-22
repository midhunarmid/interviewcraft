class MessageGenerator {
  static const Map<String, Map<String, String>> _messageMap = {
    "en": {
      "un-expected-error": "Some un expected error happened!",
      "un-expected-error-message": "Some un expected error happened!",
      "auth-welcome": "Input your credentials here to log in to the system.",
      "auth-visit-site-guide":
          "To explore in-depth instructions for utilizing this rapid starter Flutter project, head over to https://github.com/midhunarmid/flutter_util_hub to kick off your journey.",
      "auth-welcome-signup":
          "Welcome to Interview Craft!\nGet ready to join our community. Sign up now to unlock all the amazing features and start your journey with us. We're excited to have you on board!"
    }
  };

  static const Map<String, Map<String, String>> _labelMap = {
    "en": {
      "OK": "OK",
    }
  };

  static String getMessage(String message) {
    return (_messageMap[getLanguage()] ?? {})[message] ?? message;
  }

  static String getLabel(String label) {
    return (_labelMap[getLanguage()] ?? {})[label] ?? label;
  }

  static String getLanguage() {
    // Implement multi language support here
    return "en";
  }
}
