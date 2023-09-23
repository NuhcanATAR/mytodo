import 'package:flutter/material.dart';

// pub dev
import 'package:carousel_slider/carousel_slider.dart';

// widget
import 'package:mytodo/feature/slider/widget/startbutton_widget.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';

// base
import 'package:mytodo/product/utility/base/slider_base/slider_base.dart';

class SliderView extends StatefulWidget {
  const SliderView({super.key});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends MainSliderBase<SliderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackgroundConstant.white,
      body: SizedBox(
        width: maxWidth,
        height: maxHeight,
        child: Column(
          children: <Widget>[
            // slider
            buildSliderWidget,
            // slider circle button
            buildSliderCircleWidget,
            // start button
            buildStartButton,
          ],
        ),
      ),
    );
  }

  // slider
  Widget get buildSliderWidget => Expanded(
        flex: 10,
        child: Container(
          alignment: Alignment.center,
          child: CarouselSlider(
            items: serviceModel.listCard,
            options: CarouselOptions(
                height: maxHeight,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    serviceModel.currentSlider = index;
                  });
                }),
          ),
        ),
      );

  // slider circle button
  Widget get buildSliderCircleWidget => Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: serviceModel.listCard.map((img) {
            int index = serviceModel.listCard.indexOf(img);
            return SizedBox(
              width: 20,
              height: 20,
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: serviceModel.currentSlider == index
                      ? ColorBackgroundConstant.purplePrimary
                      : Colors.grey,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      125,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );

  // start button
  Widget get buildStartButton => StartButton(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        serviceRouter: serviceRouter,
      );
}
