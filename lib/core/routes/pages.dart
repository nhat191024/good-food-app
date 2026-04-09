import 'package:goodfoodapp/core/utils/import/global.dart';
import 'package:goodfoodapp/core/utils/import/screens.dart';
import 'package:goodfoodapp/core/utils/import/binding.dart';

part 'routes.dart';

class Pages {
  Pages._();

  static const initialRoute = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
  ];
}
