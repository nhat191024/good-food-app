import 'package:get/get.dart';
import 'controller.dart';
{{#use_repository}}
import 'package:goodfoodapp/core/services/api_service.dart';
import 'package:goodfoodapp/domain/repositories/{{role}}/{{name.snakeCase()}}_repository.dart';
import 'package:goodfoodapp/data/repositories/{{role}}/{{name.snakeCase()}}_repository_impl.dart';
{{/use_repository}}
class {{name.pascalCase()}}Binding extends Bindings {
  @override
  void dependencies() {
    {{#use_repository}}
    Get.lazyPut<ApiService>(() => ApiService(), fenix: true);

    //Remmber to register a provider if needed (99% u will need it)

    Get.lazyPut<{{name.pascalCase()}}Repository>(() => {{name.pascalCase()}}RepositoryImpl(/*Provider Get.find here*/));

    Get.lazyPut<{{name.pascalCase()}}Controller>(() => {{name.pascalCase()}}Controller(Get.find<{{name.pascalCase()}}Repository>()));
    {{/use_repository}}
    {{^use_repository}}

    Get.lazyPut<{{name.pascalCase()}}Controller>(() => {{name.pascalCase()}}Controller());
    {{/use_repository}}
  }
}