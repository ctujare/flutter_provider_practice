import 'package:flutter/material.dart';
import 'package:flutter_provider_practice/home-page-screen.dart';
import 'package:flutter_provider_practice/projects/counter-app/screens/counter_ui.dart';
import 'package:flutter_provider_practice/projects/example-one/screens/example-one-screen.dart';
import 'package:flutter_provider_practice/projects/favourites-app/screens/favourites-screen.dart';
import 'package:flutter_provider_practice/projects/favourites-app/screens/show-favourites-screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const HomePageScreen();
          },
        );

      case "counter-app":
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const CounterScreen();
          },
        );

      case "example-one":
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const ExampleOneScreen();
          },
        );

      case "favourites-app":
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const FavouritesScreen();
          },
        );

      case "show-favourites-screen":
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const ShowFavouriteScreen();
          },
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Error"),
            centerTitle: true,
          ),
          body: const Center(
            child: const Text("Page Not Found!!!"),
          ),
        );
      },
    );
  }
}
