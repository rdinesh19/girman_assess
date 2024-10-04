import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'initialization/main_initialization.dart';
import 'initialization/provider_initializer.dart';
import 'myApp.dart';
import 'navigation/navigation.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  await mainInitialization();




  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarBrightness:Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white
  ));


  runApp(ModularApp(
    module: Navigation(),
    child: const ProviderInitialization(
      child:  ProviderScope(
        child: MyApp(),
      )
    ),
  ));
}
