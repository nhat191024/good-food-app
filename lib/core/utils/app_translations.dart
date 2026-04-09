import 'package:get/get.dart';
import 'l10n/en_US.dart';
import 'l10n/vi_VN.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'vi_VN': viVN, 'en_US': enUS};
}
