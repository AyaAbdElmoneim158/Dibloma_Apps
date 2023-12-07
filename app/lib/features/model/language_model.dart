class LanguageModel {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  LanguageModel(this.id, this.flag, this.name, this.languageCode);

  static List<LanguageModel> languageList() {
    return <LanguageModel>[
      LanguageModel(1, "🇦🇫", "فارسی", "fa"),
      LanguageModel(2, "🇺🇸", "English", "en"),
      LanguageModel(3, "🇸🇦", "اَلْعَرَبِيَّةُ", "ar"),
      LanguageModel(4, "🇮🇳", "हिंदी", "hi")
    ];
  }

  static List<LanguageModel> dummyLanguageList = [
    LanguageModel(1, "🇦🇫", "English", "en"),
    LanguageModel(2, "🇺🇸", "French", "fr"),
    LanguageModel(3, "🇸🇦", "German", "ge"),
    LanguageModel(4, "🇮🇳", "Chinese", "ch"),
    LanguageModel(4, "🇮🇳", "Japanese", "ja"),
    LanguageModel(4, "🇮🇳", "Turkish", "tu"),
  ];
}
