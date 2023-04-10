import 'package:get/get.dart';

import '../essential/classes/crud.dart';

class InitialBinding extends Bindings{
  
  
  @override
  void dependencies() {
    Get.put(Crud());
  }

}