enum AppFontFamilies {
  none,
  poppins,
  raleway,
}

extension AppFontFamiliesExt on AppFontFamilies {
  String get familyName {
    switch (this) {
      case AppFontFamilies.none:
        return '';

      case AppFontFamilies.poppins:
        return 'Poppins';

      case AppFontFamilies.raleway:
        return 'Raleway';
    }
  }
}
