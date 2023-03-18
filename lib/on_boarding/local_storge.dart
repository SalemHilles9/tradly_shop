import 'package:get_storage/get_storage.dart';

class LcoalStorge {
  static GetStorage box = GetStorage();

  static  add(String key, dynamic value) async {
    await box.write(key, value);
  }

  static  read(String key) async {
    await box.read(key);
  }
}
