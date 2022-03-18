import 'dart:async';

import 'package:application/controllers/audios.dart';
import 'package:application/controllers/books.dart';
import 'package:application/controllers/users.dart';
import 'package:application/controllers/videos.dart';
import 'package:application/enums/font_families.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverviewPanal extends StatefulWidget {
  final Function() navigateToUsers,
      navigateToBooks,
      navigateToAudios,
      navigateToVideos;
  const OverviewPanal({
    Key? key,
    required this.navigateToUsers,
    required this.navigateToBooks,
    required this.navigateToAudios,
    required this.navigateToVideos,
  }) : super(key: key);

  @override
  _OverviewPanalState createState() => _OverviewPanalState();
}

class _OverviewPanalState extends State<OverviewPanal>
    with AutomaticKeepAliveClientMixin {
  late bool cardOneInit;
  late bool cardTwoInit;
  late bool cardThreeInit;
  late bool cardFourInit;
  late bool cardFiveInit;
  late bool cardSixInit;
  late bool cardSevenInit;
  late bool cardEightInit;

  late int customersCount, productsCount, ordersCount, skinsCount, bumbersCount;

  @override
  void initState() {
    super.initState();
    productsCount = 0;
    customersCount = 0;
    bumbersCount = 0;
    skinsCount = 0;
    ordersCount = 0;
    cardOneInit = false;
    cardTwoInit = false;
    cardThreeInit = false;
    cardFourInit = false;
    cardFiveInit = false;
    cardSixInit = false;
    cardSevenInit = false;
    cardEightInit = false;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _users = context.watch<UsersProvider>();
    final _books = context.watch<BooksProvider>();
    final _audios = context.watch<AudioProvider>();
    final _videos = context.watch<VideosProvider>();
    final theme = Theme.of(context);
    return FutureBuilder<bool>(
        future: _users.fetchUsers(),
        builder: (context, snapshot) {
          if (!(snapshot.hasData) || !(snapshot.data ?? false)) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(
                color: theme.colorScheme.primary,
              ),
            ));
          }
          return FutureBuilder<bool>(
              future: _books.fetchBooks(),
              builder: (context, snapshot) {
                if (!(snapshot.hasData) || !(snapshot.data ?? false)) {
                  return Scaffold(
                      body: Center(
                    child: CircularProgressIndicator(
                      color: theme.colorScheme.primary,
                    ),
                  ));
                }
                return FutureBuilder<bool>(
                    future: _audios.fetchAudios(),
                    builder: (context, snapshot) {
                      if (!(snapshot.hasData) || !(snapshot.data ?? false)) {
                        return Scaffold(
                            body: Center(
                          child: CircularProgressIndicator(
                            color: theme.colorScheme.primary,
                          ),
                        ));
                      }

                      return FutureBuilder<bool>(
                          future: _videos.fetchVideos(),
                          builder: (context, snapshot) {
                            if (!(snapshot.hasData) ||
                                !(snapshot.data ?? false)) {
                              return Scaffold(
                                  body: Center(
                                child: CircularProgressIndicator(
                                  color: theme.colorScheme.primary,
                                ),
                              ));
                            }

                            return Column(
                              children: [
                                Expanded(
                                  child: Row(children: [
                                    const Spacer(flex: 2),
                                    OverviewCard(
                                        title: 'Total Number of Users',
                                        result: "${_users.users.length}",
                                        color: Colors.green.shade900,
                                        onTap: () {
                                          widget.navigateToUsers.call();
                                        },
                                        initializedDuration: 500),
                                    const Spacer(),
                                    OverviewCard(
                                        title: 'Total Number of Verified Users',
                                        result:
                                            "${_users.users.where((element) => element.verified).length}",
                                        color: Colors.greenAccent.shade700,
                                        onTap: () {
                                          widget.navigateToUsers.call();
                                        },
                                        initializedDuration: 750),
                                    const Spacer(),
                                    OverviewCard(
                                        title:
                                            'Total Number of Users ever published',
                                        result:
                                            "${_users.users.where((element) => element.publishes.isNotEmpty).length}",
                                        color: Colors.lightGreen.shade900,
                                        onTap: () {
                                          widget.navigateToUsers.call();
                                        },
                                        initializedDuration: 1250),
                                    const Spacer(),
                                    OverviewCard(
                                        title:
                                            'Total Number of Users ever requested a withdraw',
                                        result:
                                            "${_users.users.where((element) => element.withdrawlRequests.isNotEmpty).length}",
                                        color: Colors.lightGreenAccent.shade700,
                                        onTap: () {
                                          widget.navigateToUsers.call();
                                        },
                                        initializedDuration: 1500),
                                    const Spacer(flex: 2),
                                  ]),
                                ),
                                Expanded(
                                  child: Row(children: [
                                    const Spacer(flex: 2),
                                    OverviewCard(
                                        title: 'Total Number of Books',
                                        result: "${_books.books.length}",
                                        color: Colors.green.shade900,
                                        onTap: () {
                                          widget.navigateToBooks.call();
                                        },
                                        initializedDuration: 1750),
                                    const Spacer(),
                                    OverviewCard(
                                        title: 'Total Number of Audios',
                                        result: "${_audios.audios.length}",
                                        color: Colors.greenAccent.shade700,
                                        onTap: () {
                                          widget.navigateToAudios.call();
                                        },
                                        initializedDuration: 2000),
                                    const Spacer(),
                                    OverviewCard(
                                        title: 'Total Number of Videos',
                                        result: "${_videos.videos.length}",
                                        color: Colors.lightGreen.shade900,
                                        onTap: () {
                                          widget.navigateToVideos.call();
                                        },
                                        initializedDuration: 2250),
                                    const Spacer(flex: 2),
                                  ]),
                                ),
                              ],
                            );
                          });
                    });
              });
        });
  }

  @override
  bool get wantKeepAlive => true;
}

class OverviewCard extends StatefulWidget {
  String title, result;
  Color color;
  double initializedDuration;
  Function() onTap;
  OverviewCard(
      {Key? key,
      required this.title,
      required this.result,
      required this.color,
      required this.onTap,
      required this.initializedDuration})
      : super(key: key);

  @override
  _OverviewCardState createState() => _OverviewCardState();
}

class _OverviewCardState extends State<OverviewCard> {
  late bool showContent;
  late bool initialized;

  @override
  void initState() {
    super.initState();
    showContent = false;
    initialized = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer.periodic(Duration.zero, (timer) {
      Future.delayed(Duration(milliseconds: widget.initializedDuration.toInt()),
          () {
        setState(() {
          initialized = true;
        });
      });
    });
    if (!initialized) {
      Future.delayed(
          Duration(milliseconds: (widget.initializedDuration.toInt() + 1750)),
          () {
        setState(() {
          showContent = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          widget.onTap();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.bounceIn,
          width: !initialized ? 0 : 300,
          height: !initialized ? 0 : 300,
          color: widget.color,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
            opacity: showContent ? 1 : 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: AppFontFamilies.poppins.familyName,
                          fontWeight: FontWeight.w500)),
                  const Spacer(),
                  Text(widget.result,
                      style: TextStyle(
                          fontSize: 48,
                          color: Colors.white70,
                          fontFamily: AppFontFamilies.poppins.familyName,
                          fontWeight: FontWeight.w100))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
