import 'package:flutter/material.dart';
import 'package:flutter_provider_practice/projects/example-one/providers/example-one-provider.dart';
import 'package:flutter_provider_practice/projects/favourites-app/providers/favourite_provider.dart';
import 'package:flutter_provider_practice/projects/favourites-app/screens/favourites-screen.dart';
import 'package:flutter_provider_practice/route_generator.dart';
import 'package:provider/provider.dart';

import 'projects/counter-app/provider/counter_provider.dart';
import 'projects/example-one/screens/example-one-screen.dart';
import 'projects/theme-change/providers/theme_change_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
          create: (_) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeChangeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExampleOneProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteItems(),
        ),
      ],
      child: Builder(builder: (context) {
        final themeChanger = Provider.of<ThemeChangeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.orange,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: themeChanger.currentTheme,
          initialRoute: "/",
          onGenerateRoute: RouteGenerator.generateRoutes,
        );
      }),
    );
  }
}
