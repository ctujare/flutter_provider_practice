import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favourite_provider.dart';

class ShowFavouriteScreen extends StatefulWidget {
  const ShowFavouriteScreen({super.key});

  @override
  State<ShowFavouriteScreen> createState() => _ShowFavouriteScreenState();
}

class _ShowFavouriteScreenState extends State<ShowFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Selected Favourites"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavouriteItems>(builder: (context, fi, _) {
              return ListView.builder(
                itemCount: fi.selectedItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      if (fi.selectedItems.contains(fi.selectedItems[index])) {
                        fi.removeItem(fi.selectedItems[index]);
                      } else {
                        fi.addItem(fi.selectedItems[index]);
                      }
                    },
                    title: Text("Item ${fi.selectedItems[index]}"),
                    trailing: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
