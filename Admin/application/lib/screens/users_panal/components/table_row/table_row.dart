import 'package:application/enums/font_families.dart';
import 'package:application/models/users.dart';
import 'package:flutter/material.dart';

TableRow buildCustomerTableRow(BuildContext context,
    {required User userInstance,
    required void Function() deleteCallback,
    required void Function() verifyCallback}) {
  return TableRow(children: [
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectableText(
                userInstance.name,
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
                userInstance.email,
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
                "${userInstance.joinedIn.year}/${userInstance.joinedIn.month}/${userInstance.joinedIn.day}\n${userInstance.joinedIn.hour}:${userInstance.joinedIn.minute}",
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
                '${userInstance.publishes.length}',
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
                '${userInstance.withdrawlRequests.length}',
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
                "+20 123456789",
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
                "123456789123456789",
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
                "Cairo",
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
                userInstance.gender == 0 ? "Male" : "Female",
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
                  onTap: verifyCallback,
                  child: Container(
                    width: 100,
                    height: 45,
                    decoration: BoxDecoration(
                      color: userInstance.verified
                          ? Colors.red.shade900
                          : Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(userInstance.verified ? 'Unverify' : 'Verify',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppFontFamilies.poppins.familyName,
                              fontSize: 16)),
                    ),
                  )),
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
