import 'package:flutter_modular/flutter_modular.dart';

import '../view/homeScreen.dart';



class Navigation extends Module {
  static const String loginScreen = '/loginScreen';
  static const String onboardScreen = '/onboardScreen';
  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (_) => const Homescreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 500));

  }
}
