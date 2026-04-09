import 'package:goodfoodapp/core/utils/import/global.dart';
import 'controller.dart';

class SplashScreen extends  GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: Text('Splash'),),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Splash Module')]),
    );
  }
}