import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/screen/homepage.dart';
import 'package:flutter_application_test/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TermOfConditionScreen extends StatefulWidget {
  const TermOfConditionScreen({super.key});

  @override
  State<TermOfConditionScreen> createState() => _TermOfConditionScreenState();
}

class _TermOfConditionScreenState extends State<TermOfConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                toolbarHeight: 200,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                    )),
              ),
              SliverFillRemaining(
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 3)]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.list_alt_rounded),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'term_txt'.tr(),
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(),
                          ),
                          Expanded(child: SizedBox()),
                          SafeArea(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        Navigator.push(context, CupertinoPageRoute(
                                          builder: (context) {
                                            return HomePage();
                                          },
                                        ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(color: Theme.of(context).cardColor),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 14),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('notaccept_txt'.tr(),
                                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                                        color: Theme.of(context).cardColor,
                                                        fontWeight: FontWeight.bold,
                                                      )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CupertinoButton(
                                      onPressed: () async {
                                        SharedPreferences preferences = await SharedPreferences.getInstance();
                                        preferences.setBool('term', true);
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) {
                                              return LoginScreen();
                                            },
                                          ),
                                          (route) => false,
                                        );
                                      },
                                      padding: EdgeInsets.zero,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 15),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('accept_txt'.tr(),
                                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                      )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
