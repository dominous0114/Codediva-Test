import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/cubit/otp_timer/otp_timer_cubit.dart';
import 'package:flutter_application_test/screen/login_screen.dart';
import 'package:flutter_application_test/screen/pin_check.dart';
import 'package:flutter_application_test/screen/select_lang.dart';
import 'package:flutter_application_test/screen/term_of_condition.dart';
import 'package:flutter_application_test/themes/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [Locale('en', 'US'), Locale('th', 'TH')],
    path: 'assets/translations',
    fallbackLocale: Locale('th', 'TH'),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool lang = false;
  bool term = false;
  bool login = false;

  @override
  void initState() {
    super.initState();
    initializeLang();
  }

  Future<void> initializeLang() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool savedLang = preferences.getBool('lang') ?? false;
    bool savedTerm = preferences.getBool('term') ?? false;
    bool savedLogin = preferences.getBool('islogin') ?? false;
    setState(() {
      lang = savedLang;
      term = savedTerm;
      login = savedLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => OtpTimerCubit(),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeConfig().theme(),
          home: lang && term && login
              ? PinCheck()
              : lang && term
                  ? LoginScreen()
                  : lang == true && term == false
                      ? TermOfConditionScreen()
                      : SelectLanguageScreen(),
        ));
  }
}
