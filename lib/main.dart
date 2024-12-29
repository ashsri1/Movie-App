import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/constants/my_theme_data.dart';
import 'package:movie_app/screens/movie_screen.dart';
import 'package:movie_app/screens/splash_screen.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/service/navigation_service.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    await dotenv.load(fileName: "assets/.env");
    runApp(const MyApp());
  });
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,

      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme:MyThemeData.light,
      home: const SplashScreen()//MoviesScreen(),SplashScreen()//MovieDetailsScreen(),//FavoritesScreen()
    );
  }
}

