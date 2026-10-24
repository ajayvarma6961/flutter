import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/responsive_home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI overlay style for mobile status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(const GoodworkApp());
}

class GoodworkApp extends StatelessWidget {
  const GoodworkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goodwork - Social & Environmental Impact Careers',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: const ResponsiveHomeScreen(),
    );
  }
}
