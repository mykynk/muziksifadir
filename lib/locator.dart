import 'package:get_it/get_it.dart';
import 'package:muziksifadir/services/firebase_storage.dart';
import 'package:muziksifadir/services/firestore_db_service.dart';
import 'package:muziksifadir/services/navigation_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton<FirestoreDbService>(() => FirestoreDbService());
   locator.registerLazySingleton<FirebaseStorageService>(() => FirebaseStorageService());
}
