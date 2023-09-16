import 'package:flutter/material.dart';
import 'package:mytodo/product/extension/view_size/viewsize_model.dart';
import 'package:mytodo/product/models/slider_model/slider_model.dart';
import 'package:mytodo/product/router/slider/slider_router.dart';

abstract class MainSliderBase<T extends StatefulWidget> extends State<T> {
  // model & database
  SliderModelService serviceModel = SliderModelService();

  // router service
  SliderNavigatorRouter serviceRouter = SliderNavigatorRouter();

  // screen size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModel(context).mediaSize.width;
  late final maxHeight = ViewSizeModel(context).mediaSize.height;
}
