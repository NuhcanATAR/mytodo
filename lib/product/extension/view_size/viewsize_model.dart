import 'package:flutter/material.dart';

class ViewSizeModel {
  ViewSizeModel(BuildContext context) : _context = context;
  final BuildContext _context;

  Size get mediaSize => MediaQuery.sizeOf(_context);
}
