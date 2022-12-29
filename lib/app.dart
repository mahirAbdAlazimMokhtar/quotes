import 'package:flutter/material.dart';

import 'config/themes/app_theme.dart';
import 'features/random_quote/presentation/screens/quote_screen.dart';
class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home:  const QuoteScreen(),
    );
  }
}