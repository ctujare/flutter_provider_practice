import 'package:flutter/material.dart';
import 'package:flutter_provider_practice/projects/favourites-app/providers/favourite_provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'show-favourites-screen.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  // late WebViewController controller;

  @override
  void initState() {
    super.initState();

    // controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setBackgroundColor(const Color(0x00000000))
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //         // Update loading bar.
    //       },
    //       onPageStarted: (String url) {},
    //       onPageFinished: (String url) {},
    //       onHttpError: (HttpResponseError error) {},
    //       onWebResourceError: (WebResourceError error) {},
    //       onNavigationRequest: (NavigationRequest request) {
    //         if (request.url.startsWith('https://www.youtube.com/')) {
    //           return NavigationDecision.prevent;
    //         }
    //         return NavigationDecision.navigate;
    //       },
    //     ),
    //   )
    //   ..loadRequest(Uri.parse('http://el-7l.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites Screen"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'show-favourites-screen');
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return Consumer<FavouriteItems>(
                  builder: (context, fi, _) {
                    return ListTile(
                      onTap: () {
                        if (fi.selectedItems.contains(index)) {
                          fi.removeItem(index);
                        } else {
                          fi.addItem(index);
                        }
                      },
                      title: Text("Item $index"),
                      trailing: fi.selectedItems.contains(index)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.grey,
                            ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
