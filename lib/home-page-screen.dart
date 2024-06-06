import 'package:flutter/material.dart';
import 'package:flutter_provider_practice/model/project-model.dart';
import 'package:flutter_provider_practice/projects/counter-app/screens/counter_ui.dart';
import 'package:flutter_provider_practice/projects/theme-change/providers/theme_change_provider.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProjectModel> projects = [
      ProjectModel(
        name: "Counter App",
        description: "Counter App Using Provider State Management",
        url: "counter-app",
      ),
      ProjectModel(
        name: "Example One",
        description: "Example App Using Provider State Management",
        url: "example-one",
      ),
      ProjectModel(
        name: "Favourites App",
        description: "Favourites App Using Provider State Management",
        url: "favourites-app",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Projects with Provider State Management"),
        actions: [
          Consumer<ThemeChangeProvider>(builder: (context, tcp, _) {
            return Switch(
              value: tcp.currentTheme == ThemeMode.dark ? true : false,
              onChanged: (bool val) {
                tcp.toggleTheme(val);
              },
            );
          }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (BuildContext context, int index) {
                ProjectModel currentProject = projects[index];
                return ListTile(
                  title: Text(
                    currentProject.name,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    currentProject.description,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, currentProject.url);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
