import 'package:flutter/material.dart';

import 'features/random_quote/presentation/screens/quote_screen.dart';
class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  QuoteScreen(),
    );
  }
}