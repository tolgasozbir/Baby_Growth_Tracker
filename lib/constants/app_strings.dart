class AppStrings {
  const AppStrings._();

  static const appName = 'Baby Growth Tracker';
}

enum AppAssets {
  splashIcon('assets/icons/ic_splash.png'),
  defaultBabyImage('assets/images/img_default_baby.jpg');

  final String path;

  const AppAssets(this.path);
}