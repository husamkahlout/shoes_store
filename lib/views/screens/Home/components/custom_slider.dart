import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_ui/views/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class ActiveDot extends StatelessWidget {
  const ActiveDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 3, right: 3),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: ColorsManager.secondaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 3, right: 3),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: ColorsManager.whiteColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}

class CustomSlider extends StatefulWidget {
  final List items;
  const CustomSlider({required this.items, Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int activeIndex = 0;

  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlayInterval: const Duration(seconds: 5),
            autoPlay: false,
            height: 180,
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setActiveDot(index);
            },
          ),
          items: List.generate(
            widget.items.length,
            (index) {
              return Container(
                margin: const EdgeInsets.only(left: 0, right: 0),
                decoration: BoxDecoration(
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(widget.items[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.items.length,
              (idx) {
                return activeIndex == idx ? const ActiveDot() : const InactiveDot();
              },
            ),
          ),
        ),
      ],
    );
  }
}
