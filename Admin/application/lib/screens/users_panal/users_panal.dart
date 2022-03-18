import 'package:application/controllers/users.dart';
import 'package:application/enums/font_families.dart';
import 'package:application/models/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/table_row/table_row.dart';

class UsersPanel extends StatefulWidget {
  const UsersPanel({Key? key}) : super(key: key);

  @override
  _UsersPanelState createState() => _UsersPanelState();
}

class _UsersPanelState extends State<UsersPanel>
    with AutomaticKeepAliveClientMixin {
  late bool isRefreshing;

  int? lastRefreshMilliSecsEpoch;

  late List<User> data;
  final ScrollController horizontalListController = ScrollController();
  @override
  void initState() {
    isRefreshing = false;
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    final _users = Provider.of<UsersProvider>(context);
    super.build(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: null,
      body: FutureBuilder<bool>(
        future: _users.fetchUsers(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: theme.colorScheme.primary,
              ),
            );
          }

          data = _users.users;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              "Total Users count: ${data.length}",
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontFamily: AppFontFamilies.raleway.familyName,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const Spacer(),
                            Text(
                              "Total Users ever place a withdraw request: ${data.where((cust) => cust.withdrawlRequests.isNotEmpty).toList().length}",
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontSize: 20,
                                fontFamily: AppFontFamilies.raleway.familyName,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const Spacer(),
                            Text(
                              "Total Users ever published: ${data.where((cust) => cust.publishes.isNotEmpty).toList().length}",
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontSize: 20,
                                fontFamily: AppFontFamilies.raleway.familyName,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const Spacer(),
                            Text(
                              "Total Users registered this month: ${data.where((cust) => cust.joinedIn.millisecondsSinceEpoch > DateTime(DateTime.now().year, DateTime.now().month).millisecondsSinceEpoch).toList().length}",
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontSize: 20,
                                fontFamily: AppFontFamilies.raleway.familyName,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 8),
                            const Divider(height: 0.5, color: Colors.white54),
                            const SizedBox(height: 8),
                            Text(
                              "Total Male Users: ${data.where((cust) => cust.gender == 0).toList().length}",
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontSize: 20,
                                fontFamily: AppFontFamilies.raleway.familyName,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const Spacer(),
                            Text(
                              "Total Female Users: ${data.where((cust) => cust.gender == 1).toList().length}",
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontSize: 20,
                                fontFamily: AppFontFamilies.raleway.familyName,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Row(
                              children: [
                                const Spacer(),
                                if (lastRefreshMilliSecsEpoch != null) ...[
                                  Text(
                                      "Last Refresh: ${DateTime.fromMillisecondsSinceEpoch(lastRefreshMilliSecsEpoch!.toInt()).hour} : ${DateTime.fromMillisecondsSinceEpoch(lastRefreshMilliSecsEpoch!.toInt()).minute >= 10 ? DateTime.fromMillisecondsSinceEpoch(lastRefreshMilliSecsEpoch!.toInt()).minute : '0${DateTime.fromMillisecondsSinceEpoch(lastRefreshMilliSecsEpoch!.toInt()).minute}'} : ${DateTime.fromMillisecondsSinceEpoch(lastRefreshMilliSecsEpoch!.toInt()).second}",
                                      style: TextStyle(
                                          fontFamily: AppFontFamilies
                                              .poppins.familyName,
                                          fontSize: 14,
                                          color: Colors.grey.shade400)),
                                ],
                                const SizedBox(width: 12),
                                InkWell(
                                  hoverColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (!isRefreshing) {
                                      setState(() {
                                        isRefreshing = true;
                                      });
                                      await _users.fetchUsers();
                                      setState(() {
                                        data = _users.users;
                                      });

                                      setState(() {
                                        isRefreshing = false;
                                        lastRefreshMilliSecsEpoch =
                                            DateTime.now()
                                                .millisecondsSinceEpoch;
                                      });
                                      setState(() {});
                                    }
                                  },
                                  child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeIn,
                                      width: !isRefreshing ? 100 : 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius: isRefreshing
                                              ? null
                                              : BorderRadius.circular(15),
                                          shape: isRefreshing
                                              ? BoxShape.circle
                                              : BoxShape.rectangle,
                                          color: theme.colorScheme.primary),
                                      child: isRefreshing
                                          ? const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          : Center(
                                              child: Text('Refresh',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          AppFontFamilies
                                                              .poppins
                                                              .familyName,
                                                      fontSize: 20)),
                                            )),
                                )
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Table(
                  border:
                      TableBorder.all(color: Colors.grey.shade500, width: 0.5),
                  children: [
                    TableRow(
                        decoration:
                            BoxDecoration(color: theme.colorScheme.primary),
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFontFamilies
                                              .raleway.familyName,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )
                                  ])),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFontFamilies
                                              .raleway.familyName,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )
                                  ])),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Registered in',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFontFamilies
                                              .raleway.familyName,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )
                                  ])),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Publishes Count',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFontFamilies
                                              .raleway.familyName,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )
                                  ])),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Withdraw Requests Count',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFontFamilies
                                              .raleway.familyName,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )
                                  ])),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Phone Wallet',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFontFamilies
                                              .raleway.familyName,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )
                                  ])),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Bank Account',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFontFamilies
                                              .raleway.familyName,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )
                                  ])),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'City',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFontFamilies
                                              .raleway.familyName,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )
                                  ])),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Gender',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFontFamilies
                                              .raleway.familyName,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )
                                  ])),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Options',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFontFamilies
                                              .raleway.familyName,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )
                                  ])),
                        ]),
                    ...List.generate(
                        data.length,
                        (i) => buildCustomerTableRow(context,
                                userInstance: data[i],
                                verifyCallback: () async {
                              if (data[i].verified) {
                                await _users.unverifyUser(data[i].id);
                                setState(() {});
                                return;
                              }
                              await _users.verifyUser(data[i].id);
                              setState(() {});
                            }, deleteCallback: () async {
                              await _users.deleteUser(data[i].id);
                              setState(() {});
                            }))
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
