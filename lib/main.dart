import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:storytelling/app.dart';
import 'package:storytelling/data/repositories/authentication/authentication.dart';
import 'package:storytelling/firebase_options.dart';

void main() async {
  
  //  Widget Bindings
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

// Initialize Get Storag
 await GetStorage.init();

// Await Splash Screen until other item load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

// -- Initialize firebase and Authentication Repository ---
  await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform)
        .then((value) => Get.put(AuthenticationRepo()));
  

  runApp(
    const MyApp(),
  );
}
