import 'package:application/controllers/users.dart';
import 'package:application/enums/font_families.dart';
import 'package:application/screens/books_panal/books_panal.dart';
import 'package:application/screens/overview_panal/overview_panal.dart';
import 'package:application/screens/users_panal/users_panal.dart';
import 'package:application/screens/video_panal/video_panal.dart';
import 'package:application/screens/audio_panal/audio_panal.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int currentModuleIndex;

  final _modulesPagesCont = PageController(initialPage: 1);
  @override
  void initState() {
    currentModuleIndex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 1500,
          height: 900,
          child: Column(
            children: [
              Container(
                color: theme.scaffoldBackgroundColor,
                child: WindowTitleBarBox(
                  child: Row(
                    children: [
                      Expanded(
                          child: MoveWindow(
                        child: Material(
                          color: theme.colorScheme.primary,
                          child: Row(
                            children: [
                              const SizedBox(width: 12),
                              const SizedBox(width: 12),
                              Text(
                                'Admin - StoriesClub',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily:
                                        AppFontFamilies.poppins.familyName,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w100),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      )),
                      MinimizeWindowButton(
                        colors: WindowButtonColors(
                          normal: theme.colorScheme.primary,
                          mouseDown: Colors.white.withOpacity(0.025),
                          mouseOver: Colors.white.withOpacity(0.025),
                          iconMouseDown: Colors.white,
                          iconMouseOver: theme.colorScheme.primary,
                          iconNormal: Colors.white,
                        ),
                      ),
                      CloseWindowButton(
                        colors: WindowButtonColors(
                          normal: theme.colorScheme.primary,
                          mouseDown: Colors.white.withOpacity(0.025),
                          mouseOver: Colors.white.withOpacity(0.025),
                          iconMouseDown: Colors.white,
                          iconMouseOver: theme.colorScheme.primary,
                          iconNormal: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: theme.colorScheme.primary,
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (currentModuleIndex == 0) {
                            return;
                          }

                          setState(() {
                            currentModuleIndex = 0;
                          });
                          _modulesPagesCont.jumpToPage(0);
                        },
                        child: SizedBox(
                          width: 120,
                          height: 70,
                          child: Container(
                            width: 120,
                            height: 70,
                            decoration: BoxDecoration(
                                color: currentModuleIndex != 0
                                    ? theme.colorScheme.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.airplay_rounded,
                                      color: currentModuleIndex == 0
                                          ? theme.colorScheme.primary
                                          : Colors.white30,
                                      size: 24),
                                  Text('Overview',
                                      style: TextStyle(
                                          color: currentModuleIndex == 0
                                              ? theme.colorScheme.primary
                                              : Colors.white30))
                                ],
                              ),
                            ),
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          if (currentModuleIndex == 1) {
                            return;
                          }

                          setState(() {
                            currentModuleIndex = 1;
                          });
                          _modulesPagesCont.jumpToPage(1);
                        },
                        child: SizedBox(
                          width: 120,
                          height: 70,
                          child: Container(
                            width: 120,
                            height: 70,
                            decoration: BoxDecoration(
                                color: currentModuleIndex != 1
                                    ? theme.colorScheme.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.person,
                                      color: currentModuleIndex == 1
                                          ? theme.colorScheme.primary
                                          : Colors.white30,
                                      size: 24),
                                  Text('Users',
                                      style: TextStyle(
                                          color: currentModuleIndex == 1
                                              ? theme.colorScheme.primary
                                              : Colors.white30))
                                ],
                              ),
                            ),
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          if (currentModuleIndex == 2) {
                            return;
                          }

                          setState(() {
                            currentModuleIndex = 2;
                          });
                          _modulesPagesCont.jumpToPage(2);
                        },
                        child: SizedBox(
                          width: 120,
                          height: 70,
                          child: Container(
                            width: 120,
                            height: 70,
                            decoration: BoxDecoration(
                                color: currentModuleIndex != 2
                                    ? theme.colorScheme.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.menu_book_rounded,
                                      color: currentModuleIndex == 2
                                          ? theme.colorScheme.primary
                                          : Colors.white30,
                                      size: 24),
                                  Text('Books',
                                      style: TextStyle(
                                          color: currentModuleIndex == 2
                                              ? theme.colorScheme.primary
                                              : Colors.white30))
                                ],
                              ),
                            ),
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          if (currentModuleIndex == 3) {
                            return;
                          }

                          setState(() {
                            currentModuleIndex = 3;
                          });
                          _modulesPagesCont.jumpToPage(3);
                        },
                        child: SizedBox(
                          width: 120,
                          height: 70,
                          child: Container(
                            width: 120,
                            height: 70,
                            decoration: BoxDecoration(
                                color: currentModuleIndex != 3
                                    ? theme.colorScheme.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.video_collection_rounded,
                                      color: currentModuleIndex == 3
                                          ? theme.colorScheme.primary
                                          : Colors.white30,
                                      size: 24),
                                  Text('Videos',
                                      style: TextStyle(
                                          color: currentModuleIndex == 3
                                              ? theme.colorScheme.primary
                                              : Colors.white30))
                                ],
                              ),
                            ),
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          if (currentModuleIndex == 4) {
                            return;
                          }

                          setState(() {
                            currentModuleIndex = 4;
                          });
                          _modulesPagesCont.jumpToPage(4);
                        },
                        child: SizedBox(
                          width: 120,
                          height: 70,
                          child: Container(
                            width: 120,
                            height: 70,
                            decoration: BoxDecoration(
                                color: currentModuleIndex != 4
                                    ? theme.colorScheme.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.audiotrack_outlined,
                                      color: currentModuleIndex == 4
                                          ? theme.colorScheme.primary
                                          : Colors.white30,
                                      size: 24),
                                  Text('Audios',
                                      style: TextStyle(
                                          color: currentModuleIndex == 4
                                              ? theme.colorScheme.primary
                                              : Colors.white30))
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _modulesPagesCont,
                  children: [
                    OverviewPanal(
                      navigateToUsers: () {
                        setState(() {
                          currentModuleIndex = 1;
                          _modulesPagesCont.jumpToPage(1);
                        });
                      },
                      navigateToBooks: () {
                        setState(() {
                          currentModuleIndex = 2;
                          _modulesPagesCont.jumpToPage(2);
                        });
                      },
                      navigateToAudios: () {
                        setState(() {
                          currentModuleIndex = 3;
                          _modulesPagesCont.jumpToPage(3);
                        });
                      },
                      navigateToVideos: () {
                        setState(() {
                          currentModuleIndex = 4;
                          _modulesPagesCont.jumpToPage(4);
                        });
                      },
                    ),
                    const UsersPanel(),
                    const BooksPanal(),
                    const VideoPanal(),
                    const AudioPanal(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
