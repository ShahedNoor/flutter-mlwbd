import 'package:flutter/material.dart';
import 'package:mlwbd/theme/theme.dart';
import 'package:mlwbd/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'pages/movies_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      darkTheme: lightMode,
      home: const MoviesPage(),
    );
  }
}
