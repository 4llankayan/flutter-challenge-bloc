import 'package:flutter_challenge/app/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}
