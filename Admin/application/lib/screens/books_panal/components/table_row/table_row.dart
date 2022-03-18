import 'package:application/enums/font_families.dart';
import 'package:application/models/books.dart';
import 'package:flutter/material.dart';

TableRow buildBookTableRow(BuildContext context,
    {required Book bookInstance, required void Function() deleteCallback}) {
  return TableRow(children: [
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectableText(
                bookInstance.title,
                style: TextStyle(
                    fontFamily: AppFontFamilies.poppins.familyName,
                    fontSize: 14),
                textAlign: TextAlign.center,
              )
            ])),
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectableText(
                "${bookInstance.publishingDate.year}/${bookInstance.publishingDate.month}/${bookInstance.publishingDate.day}\n${bookInstance.publishingDate.hour}:${bookInstance.publishingDate.minute}",
                style: TextStyle(
                    fontFamily: AppFontFamilies.poppins.familyName,
                    fontSize: 14),
                textAlign: TextAlign.center,
              )
            ])),
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectableText(
                '${bookInstance.likers.length}',
                style: TextStyle(
                    fontFamily: AppFontFamilies.poppins.familyName,
                    fontSize: 14),
                textAlign: TextAlign.center,
              )
            ])),
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectableText(
                '${bookInstance.comments.length}',
                style: TextStyle(
                    fontFamily: AppFontFamilies.poppins.familyName,
                    fontSize: 14),
                textAlign: TextAlign.center,
              )
            ])),
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectableText(
                bookInstance.depositNumber,
                style: TextStyle(
                    fontFamily: AppFontFamilies.poppins.familyName,
                    fontSize: 14),
                textAlign: TextAlign.center,
              )
            ])),
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectableText(
                bookInstance.isin.toString(),
                style: TextStyle(
                    fontFamily: AppFontFamilies.poppins.familyName,
                    fontSize: 14),
                textAlign: TextAlign.center,
                maxLines: 1,
              )
            ])),
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectableText(
                "Horor",
                style: TextStyle(
                    fontFamily: AppFontFamilies.poppins.familyName,
                    fontSize: 14),
                textAlign: TextAlign.center,
              )
            ])),
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: deleteCallback,
                  child: Container(
                    width: 100,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.red.shade900,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text('Delete',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppFontFamilies.poppins.familyName,
                              fontSize: 16)),
                    ),
                  )),
              const SizedBox(height: 12),
            ])),
  ]);
}
