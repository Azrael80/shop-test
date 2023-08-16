import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatefulWidget {
  final List<String> imageUrls;

  const ProductImages({super.key, required this.imageUrls});

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int _currentImage = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: images,
          carouselController: _controller,
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImage = index;
              });
            },
          ),
        ),
        Positioned.fill(
          bottom: 5,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: _buildIndex(),
          ),
        ),
      ],
    );
  }

  Widget _buildIndex() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 1.5,
        horizontal: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        '${_currentImage + 1}/${widget.imageUrls.length}',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      ),
    );
  }

  /// Images à afficher dans le carousel.
  List<Widget> get images => widget.imageUrls
      .map(
        (url) => Container(
          color: Colors.grey.withOpacity(0.4),
          width: double.infinity,
          margin: const EdgeInsets.all(0.0),
          child: Image.network(
            url,
            fit: BoxFit.fitHeight,
          ),
        ),
      )
      .toList();
}
