import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/screens/splash_screen.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/service/navigation_service.dart';
import 'package:movie_app/view-model/favorite_provider.dart';
import 'package:movie_app/view-model/movies_provider.dart';
import 'package:movie_app/view-model/theme_provider.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<MoviesProvider>(create: (_) => MoviesProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: Consumer(builder: (context, ThemeProvider themeProvider, child) {
        return MaterialApp(
            navigatorKey: getIt<NavigationService>().navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Movies App',
            theme: themeProvider.themeData,
            home:
                const SplashScreen()// MoviesScreen() //MoviesScreen(),SplashScreen()//MovieDetailsScreen(),//FavoritesScreen()
            );
      }),
    );
  }
}
