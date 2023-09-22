import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ImportantModelService {
  dynamic logger = Logger();
  // form keys
  final formMettingAddKey = GlobalKey<FormState>();
  final formGoingPlaceAddKey = GlobalKey<FormState>();
  final formStudyAddKey = GlobalKey<FormState>();
  final bookAddKey = GlobalKey<FormState>();
  final shoppingAddKey = GlobalKey<FormState>();
  final healtAddKey = GlobalKey<FormState>();
  final sporAddKey = GlobalKey<FormState>();
  final movieAddKey = GlobalKey<FormState>();

  // controller
  TextEditingController titleController = TextEditingController();
  TextEditingController explanationController = TextEditingController();

  // date
  DateTime selectdateTime = DateTime.now();

  DateTime selectStartdateTime = DateTime.now();

  DateTime selectEnddateTime = DateTime.now();

  // validator
  String? titleValidator(String? titleVal) {
    if (titleVal == null || titleVal.isEmpty) {
      return "* Zorunlu Alan";
    } else {
      return null;
    }
  }

  String? explanationValidator(String? explanationVal) {
    if (explanationVal == null || explanationVal.isEmpty) {
      return "* Zorunlu Alan";
    } else {
      return null;
    }
  }

  // input
  bool inputBorder = false;

  // city list
  List<String> cityList = <String>[
    "Çorum",
    "Ankara",
  ];

  // books category
  List<String> bookCategorys = <String>[
    "Bilim Kurgu",
    "Drama",
    "Tarih",
    "Hikaye",
  ];

  // shopping category
  List<String> shoppingCategory = <String>[
    "Market",
    "Manav",
    "Fırın",
    "Bakkal",
    "Kuruyemiş",
    "Elbise Mağazası",
    "Ayakkabı Mağzası",
    "Diğer",
  ];

  // healt category
  List<String> healthCategory = <String>[
    "Hastane",
    "Eczane",
    "Sağlık Ocağı",
  ];

  // spor time category
  List<String> sporCategory = <String>[
    "Gün doğumu",
    "Sabah",
    "Öğle",
    "Akşam",
    "Gece Yarısı",
  ];

  // movie categorys
  List<String> moviCategory = <String>[
    "Bilim Kurgu",
    "Fantastik",
    "Drama",
  ];

  // city value
  late String cityStartSelect = cityList.first;
  late String cityFinishSelect = cityList.first;
  late String bookCategorySelect = bookCategorys.first;
  late String shoppingCategorySelect = shoppingCategory.first;
  late String healtCategorySelect = healthCategory.first;
  late String sportCategorySelect = sporCategory.first;
  late String movieCategorySelect = moviCategory.first;

  // count
  late int bookPageCount = 1;

  // check status
  bool isTodoCheckStatus(Map<String, dynamic> data) => data['STATUS'];

  // favorite button status
  late bool isFavoriteButtonStatus = false;
  // important buttons status
  late bool isImportantButtonStatus = false;
}
