enum Flavor {
  prod,
  dev,
  stage,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'МатБлиц';
      case Flavor.dev:
        return 'МатБлиц Dev';
      case Flavor.stage:
        return 'МатБлиц Stage';
    }
  }

}
