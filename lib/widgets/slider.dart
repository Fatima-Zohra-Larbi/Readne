import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Carousel(
                    images: [
                      AssetImage('assets/cover1.jpeg'),
                                          AssetImage('assets/cover2.jpg'),

                                          AssetImage('assets/cover3.jpg'),
                    ],
                    dotColor: Colors.red,
                    boxFit: BoxFit.cover,
     )
  );
   
  }
}