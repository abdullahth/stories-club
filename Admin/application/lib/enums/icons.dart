enum AppIcons {
  none,
  cartFilledIcon,
  cartEmptyIcon,
}

extension AppIconsExt on AppIcons {
  String get assetDir {
    switch (this) {
      case AppIcons.none:
        return '';
      case AppIcons.cartFilledIcon:
        return 'cart-filled-icon.png';
      case AppIcons.cartEmptyIcon:
        return 'cart-empty-icon.png';
    }
  }
}
