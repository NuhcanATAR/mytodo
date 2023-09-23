import 'package:flutter/material.dart';

// constant
import 'package:mytodo/product/constants/img_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class SliderModelService {
  int currentSlider = 0;
  late List<Widget> listCard = [
    // card 1
    SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // img
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: ImgIMGConstant.appSliderImg1.toImg2,
          ),
          // title
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 5, left: 5, right: 5),
            child: TitleMediumBlackBoldText(
              text: StringSliderConstant.sliderTitle1,
              textAlign: TextAlign.center,
            ),
          ),
          // description
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
            child: LabelMediumGreyText(
              text: StringSliderConstant.sliderDescription1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
    // card 2
    SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // img
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: ImgIMGConstant.appSliderImg2.toImg2,
          ),
          // title
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 5, left: 5, right: 5),
            child: TitleMediumBlackBoldText(
              text: StringSliderConstant.sliderTitle2,
              textAlign: TextAlign.center,
            ),
          ),
          // description
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
            child: LabelMediumGreyText(
              text: StringSliderConstant.sliderDescription2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
    // card 3
    SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // img
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: ImgIMGConstant.appSliderImg3.toImg2,
          ),
          // title
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 5, left: 5, right: 5),
            child: TitleMediumBlackBoldText(
              text: StringSliderConstant.sliderTitle3,
              textAlign: TextAlign.center,
            ),
          ),
          // description
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
            child: LabelMediumGreyText(
              text: StringSliderConstant.sliderDescription3,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
    // card 4
    SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // img
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: ImgIMGConstant.appSliderImg4.toImg2,
          ),
          // title
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 5, left: 5, right: 5),
            child: TitleMediumBlackBoldText(
              text: StringSliderConstant.sliderTitle4,
              textAlign: TextAlign.center,
            ),
          ),
          // description
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
            child: LabelMediumGreyText(
              text: StringSliderConstant.sliderDescription4,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
    // card 5
    SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // img
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: ImgIMGConstant.appSliderImg5.toImg2,
          ),
          // title
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 5, left: 5, right: 5),
            child: TitleMediumBlackBoldText(
              text: StringSliderConstant.sliderTitle5,
              textAlign: TextAlign.center,
            ),
          ),
          // description
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
            child: LabelMediumGreyText(
              text: StringSliderConstant.sliderDescription5,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
    // card 6
    SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // img
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: ImgIMGConstant.appSliderImg6.toImg2,
          ),
          // title
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 5, left: 5, right: 5),
            child: TitleMediumBlackBoldText(
              text: StringSliderConstant.sliderTitle6,
              textAlign: TextAlign.center,
            ),
          ),
          // description
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
            child: LabelMediumGreyText(
              text: StringSliderConstant.sliderDescription6,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
    // card 7
    SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // img
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: ImgIMGConstant.appSliderImg7.toImg2,
          ),
          // title
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 5, left: 5, right: 5),
            child: TitleMediumBlackBoldText(
              text: StringSliderConstant.sliderTitle7,
              textAlign: TextAlign.center,
            ),
          ),
          // description
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
            child: LabelMediumGreyText(
              text: StringSliderConstant.sliderDescription7,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  ];
}
