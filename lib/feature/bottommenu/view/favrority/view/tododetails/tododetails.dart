import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/feature/bottommenu/view/favrority/view/todoupdate/todoupdate.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/utility/base/favority_base/favority_base.dart';
import 'package:mytodo/product/utility/base/todo_base/todo_base.dart';
import 'package:mytodo/product/utility/firebase/database/todo_db/todo_db.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class TodoDetailsView extends StatefulWidget {
  const TodoDetailsView({
    super.key,
    required this.data,
    required this.mainData,
    required this.dynamicHeight,
    required this.maxWidth,
    required this.maxHeight,
  });
  final Map<String, dynamic> data;
  final Map<String, dynamic> mainData;
  final dynamic dynamicHeight;
  final dynamic maxWidth;
  final dynamic maxHeight;

  @override
  State<TodoDetailsView> createState() => _TodoDetailsViewState();
}

class _TodoDetailsViewState extends MainFavorityBase<TodoDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorBackgroundConstant.purplePrimary,
            size: 21,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Todo Detay",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorTextConstant.mainColor,
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: widget.maxWidth,
        height: widget.maxHeight,
        child: Stack(
          children: <Widget>[
            // body
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Padding(
                padding: context.padding.normal,
                child: ListView(
                  children: <Widget>[
                    // check status
                    buildCheckStatusWidget,
                    // date
                    buildTodoDateWidget,
                    // category
                    buildCategoryWidget,

                    // book page count
                    buildPageCountWidget,
                    // title
                    buildTitleWidget,
                    // start location & finish location
                    buildStartFinishLocation,
                    // explanation
                    buildExplanationWidget,
                  ],
                ),
              ),
            ),
            // delete
            Positioned(
                right: 25,
                bottom: 25,
                child: GestureDetector(
                  onTap: () {
                    todoDelete(widget.data, widget.mainData);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(124),
                      ),
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                )),
            // update
            Positioned(
                left: 25,
                bottom: 25,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TodoUpdateView(
                          data: widget.mainData,
                          mainData: widget.data,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorBackgroundConstant.purplePrimary,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(124),
                      ),
                    ),
                    child: const Icon(
                      Icons.update,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // check status
  Widget get buildCheckStatusWidget => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  // check
                  widget.data['STATUSCHECK'] == false
                      ? const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 21,
                        )
                      : Icon(
                          Icons.check,
                          color: ColorBackgroundConstant.purplePrimary,
                          size: 21,
                        ), // text
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: widget.data['STATUSCHECK'] == false
                        ? const LabelMediumRedColorText(
                            textAlign: TextAlign.left, text: "Tamamlanmadı!")
                        : const LabelMediumMainColorText(
                            textAlign: TextAlign.left, text: "Tamamlandı!"),
                  ),
                ],
              ),
            ),
            FutureBuilder<DocumentSnapshot>(
              future: TodoServiceDb.IMPORTANT.refImportantCol
                  .doc(widget.data['ID'])
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const SizedBox();
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return GestureDetector(
                    onTap: () {
                      todoImportantAdd(widget.data);
                      setState(() {
                        serviceModel.isImportantButtonStatus = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(124),
                        ),
                      ),
                      child: const Icon(
                        Icons.report_gmailerrorred,
                        color: Colors.redAccent,
                        size: 24,
                      ),
                    ),
                  );
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> dataFavo =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return serviceModel.isImportantButtonStatus == false
                      ? GestureDetector(
                          onTap: () {
                            todoImportantDelete(widget.data);
                            setState(() {
                              serviceModel.isImportantButtonStatus = true;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(124),
                              ),
                            ),
                            child: const Icon(
                              Icons.report_gmailerrorred,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            todoImportantAdd(widget.data);
                            setState(() {
                              serviceModel.isImportantButtonStatus = false;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(124),
                              ),
                            ),
                            child: const Icon(
                              Icons.report_gmailerrorred,
                              color: Colors.red,
                              size: 24,
                            ),
                          ),
                        );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      );

  // date
  Widget get buildTodoDateWidget => SizedBox(
        width: widget.maxWidth,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: widget.mainData['ID'] == "0qXiPbGgtwu3j1r5j5Lz"
              ? LabelMediumGreyText(
                  text:
                      "Toplantı Tarih: ${widget.data['DAY'].toString()}.${widget.data['MONTH'].toString()}.${widget.data['YEAR'].toString()}",
                  textAlign: TextAlign.left,
                )
              : widget.mainData['ID'] == "GMwLSlyI6e2fY1N8JsLQ"
                  ? LabelMediumGreyText(
                      text:
                          "Gidiş Tarih: ${widget.data['STARTDAY'].toString()}.${widget.data['STARTMONTH'].toString()}.${widget.data['STARTYEAR'].toString()} / Geliş Tarihi: ${widget.data['ENDDAY'].toString()}.${widget.data['ENDMONTH'].toString()}.${widget.data['ENDYEAR'].toString()}",
                      textAlign: TextAlign.left,
                    )
                  : widget.mainData['ID'] == "QqqKN0VbdWfofliUtDm6"
                      ? LabelMediumGreyText(
                          text:
                              "Başlangıç Tarih: ${widget.data['STARTDAY'].toString()}.${widget.data['STARTMONTH'].toString()}.${widget.data['STARTYEAR'].toString()} / Bitiş Tarihi: ${widget.data['ENDDAY'].toString()}.${widget.data['ENDMONTH'].toString()}.${widget.data['ENDYEAR'].toString()}",
                          textAlign: TextAlign.left,
                        )
                      : widget.mainData['ID'] == "ZaqqOF15uH11kMv0vdHu"
                          ? LabelMediumGreyText(
                              text:
                                  "Gidiş Tarih: ${widget.data['GOINGDAY'].toString()}.${widget.data['GOINGMONTH'].toString()}.${widget.data['GOINGYEAR'].toString()}",
                              textAlign: TextAlign.left,
                            )
                          : widget.mainData['ID'] == "fYGlLPTeMpPCYfirfleu"
                              ? LabelMediumGreyText(
                                  text:
                                      "Hedef Tarih: ${widget.data['GOINGDAY'].toString()}.${widget.data['GOINGMONTH'].toString()}.${widget.data['GOINGYEAR'].toString()}",
                                  textAlign: TextAlign.left,
                                )
                              : const SizedBox(),
        ),
      );
  // category
  Widget get buildCategoryWidget => SizedBox(
        width: widget.maxWidth,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: widget.mainData['ID'] == "fYGlLPTeMpPCYfirfleu"
              ? LabelMediumGreyText(
                  text: "Çalışma Zamanı: ${widget.data['CATEGORY']}",
                  textAlign: TextAlign.left,
                )
              : widget.mainData['ID'] == "wNtyPEvvFYoWjI36TSJy"
                  ? LabelMediumGreyText(
                      text: "Dizi Türü: ${widget.data['CATEGORY']}",
                      textAlign: TextAlign.left,
                    )
                  : widget.mainData['ID'] == "ZaqqOF15uH11kMv0vdHu"
                      ? LabelMediumGreyText(
                          text: "Kurum: ${widget.data['CATEGORY']}",
                          textAlign: TextAlign.left,
                        )
                      : widget.mainData['ID'] == "RjFvWQe3dpW34QAxX2v7"
                          ? LabelMediumGreyText(
                              text: "Kitap Türü: ${widget.data['CATEGORY']}",
                              textAlign: TextAlign.left,
                            )
                          : const SizedBox(),
        ),
      );
  // book page count
  Widget get buildPageCountWidget => SizedBox(
        width: widget.maxWidth,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: widget.mainData['ID'] == "RjFvWQe3dpW34QAxX2v7"
              ? LabelMediumGreyText(
                  text: "Sayfa Sayısı: ${widget.data['PAGECOUNT']}",
                  textAlign: TextAlign.left,
                )
              : const SizedBox(),
        ),
      );
  // title
  Widget get buildTitleWidget => SizedBox(
        width: widget.maxWidth,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: TitleMediumBlackBoldText(
            text: widget.data['TITLE'],
            textAlign: TextAlign.left,
          ),
        ),
      );

  // start location & finish location
  Widget get buildStartFinishLocation =>
      widget.mainData['CATEGORYID'] == "GMwLSlyI6e2fY1N8JsLQ"
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: maxWidth,
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 21,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    LabelMediumGreyText(
                        textAlign: TextAlign.left,
                        text:
                            "${widget.data['STARTLOCATION']} - ${widget.data['FINISHLOCATION']}"),
                  ],
                ),
              ),
            )
          : const SizedBox();
  // explanation
  Widget get buildExplanationWidget => SizedBox(
        width: widget.maxWidth,
        child: LabelMediumGreyText(
          text: widget.data['EXPLANATION'],
          textAlign: TextAlign.left,
        ),
      );
}
