import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../screens/nft_screen.dart';

class ImageListView extends StatefulWidget {
  const ImageListView(
      {super.key, required this.startIndex, required this.duration});

  final int startIndex;
  final int duration;
  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      // Detect if is at the end of list view
      if (_scrollController.position.atEdge) {
        _autoScroll();
      }
    });
    // Add this to make sure that controller has been attached to List View
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScroll();
    });
  }

  _autoScroll() {
    final _currentScrollPosition = _scrollController.offset;
    final _scrollEndPosition = _scrollController.position.maxScrollExtent;

    scheduleMicrotask(() {
      _scrollController.animateTo(
          _currentScrollPosition == _scrollEndPosition ? 0 : _scrollEndPosition,
          duration: Duration(seconds: widget.duration),
          curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _ImageTile(
                image: 'assets/nfts/${widget.startIndex + index + 1}.png');
          },
        ),
      ),
    );
  }
}

class _ImageTile extends StatelessWidget {
  const _ImageTile({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => NFTScreen(image: image),
            ));
      },
      child: Hero(
        tag: image,
        child: Image.asset(
          image,
          width: 130,
        ),
      ),
    );
  }
}
