import 'package:flutter/material.dart';
import 'package:nft_marketplace_ui/widgets/image_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff010101),
      body: Stack(
        children: [
          Positioned.fill(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                const ImageListView(startIndex: 1, duration: 5),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
