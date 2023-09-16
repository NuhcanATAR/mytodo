import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

import 'package:mytodo/product/utility/base/slider_base/slider_base.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

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
  Widget get buildStartButton => Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            serviceRouter.sliderLogRegViewPush(context);
          },
          child: SizedBox(
            width: maxWidth,
            height: dynamicHeight(0.08),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorBackgroundConstant.purplePrimary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: const LabelMediumWhiteText(
                text: StringSliderConstant.sliderNextBtn,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
}
