import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/firebase_options.dart';
import 'package:portfolio_web/screens/about_screen.dart';
import 'package:portfolio_web/screens/contact_screen.dart';
import 'package:portfolio_web/screens/home_screen.dart';
import 'package:portfolio_web/utils/responsive_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      child: MaterialApp(
        title: 'Flutter Developer Portfolio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Inter',
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          canvasColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            surface: Colors.white,
          ),
        ),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.light,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/about': (context) => const AboutScreen(),
          '/contact': (context) => const ContactScreen(),
        },
      ),
    );
  }
}
