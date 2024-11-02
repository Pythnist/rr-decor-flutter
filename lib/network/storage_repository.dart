import 'package:get_storage/get_storage.dart';

import '../utility/app_constant.dart';

class StorageRepository {

  static Future<void> saveOffline(String key,dynamic value) async{
    final storage =  GetStorage();
    await storage.write(key, value);
  }

  static Future<dynamic> getOfflineKey(String key) async {
    final storage =  GetStorage();
    return await storage.read(key);
  }

  static Future<void> destroyOfflineStorage() async{
    final storage = GetStorage();
    await storage.erase();
  }

  static Future<bool> isLoggedIn() async{
    final storage =  GetStorage();
    return await storage.read(AppConstant.isLoggedInKey) ?? false;
  }

  static Future<dynamic> getToken() async{
    final storage = GetStorage();
    return await storage.read(AppConstant.offlineTokenKey);
  }

// static Future<String?> getFirebaseToken() async{
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   return await messaging.getToken();
// }
}