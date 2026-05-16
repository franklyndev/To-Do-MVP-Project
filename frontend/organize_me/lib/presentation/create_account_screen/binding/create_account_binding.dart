import 'package:get/get.dart';
import '../controller/create_account_controller.dart';
import '../../../core/app_export.dart';

class CreateAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAccountController>(() => CreateAccountController());
  }
}
