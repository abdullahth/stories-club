enum AppImages {
  productsPageScreenProtectorsCard,
  productsPagebumbersCard,
  productsPageskinsCard,
  none,
  supportPageBanner,
  contactPageBanner,
  facebookIcon,
  instagramIcon,
  youtubeIcon,
  blogPhoneBanner,
  blogSolutionsBanner,
  blogBackround,
  aboutMainBanner,
  aboutMobilesBanner,
  homeFirstBannerBackground,
  homeFirstBannerCardFour,
  homeFirstBannerCardTwo,
  homeFirstBannerCardThree,
  logo,
  logoWhite,
  cloudsOne,
  cloudsTwo,
  shiled,
  homeCardOneMobile,
  homeCardTwoMobile,
  homeCardThreeBumbers,
  homeCardFourMobile,
  homeCardFiveMobile,
  hammerCarProtector,
  mobileElseBackground,
  lifetimeWarrentyBackground,
  promiseBackground,
  warrentryBadge,
  map,
  dummyProduct,
  dummyProductTwo,
  shopBumbers,
  ratingFullHeart,
  ratingHalfHeart,
  ratingEmptyHeart,
  bumberPageBannerOne,
  bumberPageBannerTwo,
  bumberPageBannerThree,
  bumberPageSectionOne,
  bumberPageSectionFive,
  multiBumbers,
  screenProtectorPageBannerOne,
  screenProtectorPageBannerFive,
  screenProtectorSectionOne,
  screenProtectorSectionTwo,
  screenProtectorSectionFour,
  skinsPageBackground,
  skinsPageMobile,
  skinsPageBanner,
  skinsPageGif,

  galOne,
  galTwo,
  galThree,
  galFour,
  galFive,
  galSix,
  galSeven,
  galEight,
  galNine,
  galTen
}

extension AppImagesExt on AppImages {
  String get assetDir {
    switch (this) {
      case AppImages.none:
        return '';
      case AppImages.map:
        return 'map.PNG';
      case AppImages.shopBumbers:
        return 'shop-bumbers-background.jpg';

      case AppImages.productsPageScreenProtectorsCard:
        return 'products-page-screen-protector-image.png';
      case AppImages.productsPagebumbersCard:
        return 'products-page-bumber-image.jpg';
      case AppImages.productsPageskinsCard:
        return 'products-page-skins-image.jpg';

      case AppImages.supportPageBanner:
        return 'support-page-banner.webp';

      case AppImages.lifetimeWarrentyBackground:
        return 'lifetime-warrenty-bg.webp';

      case AppImages.instagramIcon:
        return 'instagram-icon.webp';
      case AppImages.facebookIcon:
        return 'facebook-icon.webp';
      case AppImages.youtubeIcon:
        return 'youtube-icon.webp';

      case AppImages.contactPageBanner:
        return 'contact-page-banner.jpg';

      case AppImages.blogPhoneBanner:
        return 'blog-phone-banner.webp';
      case AppImages.blogSolutionsBanner:
        return 'blog-solutions-banner.webp';
      case AppImages.blogBackround:
        return 'blog-background.webp';

      case AppImages.aboutMainBanner:
        return 'about.webp';
      case AppImages.aboutMobilesBanner:
        return 'about-mobile.webp';

      case AppImages.homeFirstBannerCardFour:
        return 'home-first-card-one-background.webp';
      case AppImages.homeFirstBannerCardTwo:
        return 'home-first-card-two-background.webp';
      case AppImages.homeFirstBannerCardThree:
        return 'home-first-card-three-background.webp';

      case AppImages.homeFirstBannerBackground:
        return 'home-first-background.webp';

      case AppImages.logo:
        return 'logo-colored.png';
      case AppImages.logoWhite:
        return 'logo-white.png';

      case AppImages.cloudsOne:
        return 'clouds-front.png';
      case AppImages.cloudsTwo:
        return 'clouds-back.png';
      case AppImages.shiled:
        return 'shield.webp';
      case AppImages.homeCardOneMobile:
        return 'home-card-one-phone.png';
      case AppImages.homeCardTwoMobile:
        return 'home-card-two-phone.png';
      case AppImages.homeCardThreeBumbers:
        return 'home-card-three-bumbers.png';
      case AppImages.homeCardFourMobile:
        return 'home-card-four-phone.png';
      case AppImages.homeCardFiveMobile:
        return 'home-card-five-phone.png';

      case AppImages.hammerCarProtector:
        return 'hammer-car-protector.jpg';
      case AppImages.mobileElseBackground:
        return 'mobile-else-bg.jpg';
      case AppImages.promiseBackground:
        return 'promise-section-background.webp';
      case AppImages.warrentryBadge:
        return 'lifetime-warrenty.webp';

      case AppImages.dummyProduct:
        return 'product-example.png';
      case AppImages.dummyProductTwo:
        return 'product-example-two.png';

      case AppImages.ratingFullHeart:
        return 'heart.png';
      case AppImages.ratingHalfHeart:
        return 'heart_half.png';
      case AppImages.ratingEmptyHeart:
        return 'heart_border.png';

      case AppImages.bumberPageBannerOne:
        return 'bumber-screen-banner-one.jpg';
      case AppImages.bumberPageBannerTwo:
        return 'bumber-screen-banner-two.jpg';
      case AppImages.bumberPageBannerThree:
        return 'bumber-screen-banner-three.webp';
      case AppImages.bumberPageSectionOne:
        return 'bumber-section-one.webp';
      case AppImages.bumberPageSectionFive:
        return 'bumber-section-five.jpg';
      case AppImages.multiBumbers:
        return 'mutli-bumbers.png';

      case AppImages.screenProtectorPageBannerOne:
        return 'screen-protector-screen-banner-one.jpg';
      case AppImages.screenProtectorPageBannerFive:
        return 'screen-protector-screen-banner-five.jpg';
      case AppImages.screenProtectorSectionOne:
        return 'screen-protector-section-one.webp';
      case AppImages.screenProtectorSectionTwo:
        return 'screen-protector-section-two.png';
      case AppImages.screenProtectorSectionFour:
        return 'screen-protector-section-four.jpg';

      case AppImages.skinsPageBackground:
        return 'skin-screen-background.webp';
      case AppImages.skinsPageMobile:
        return 'skin-screen-banner-one.webp';
      case AppImages.skinsPageBanner:
        return 'skin-screen-banner-two.webp';
      case AppImages.skinsPageGif:
        return 'skins-gif.gif';

      case AppImages.galOne:
        return 'gal1.jpg';
      case AppImages.galTwo:
        return 'gal2.jpg';
      case AppImages.galThree:
        return 'gal3.jpg';
      case AppImages.galFour:
        return 'gal4.jpg';
      case AppImages.galFive:
        return 'gal5.jpg';
      case AppImages.galSix:
        return 'gal6.jpg';
      case AppImages.galSeven:
        return 'gal7.jpg';
      case AppImages.galEight:
        return 'gal8.jpg';
      case AppImages.galNine:
        return 'gal9.jpg';
      case AppImages.galTen:
        return 'gal10.jpg';
    }
  }
}
