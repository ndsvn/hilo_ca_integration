import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:hilo_ca_integration/applinks.dart';
import 'package:hilo_ca_integration/cores/theme/theme.src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/routes/pages.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _Application();
}

class _Application extends State<Application> {
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;
  final botToastBuilder = BotToastInit();
  bool useSafeArea = false;
  

  @override
  void initState() {
    _checkAndroidSDK();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.colorWhite,
      systemNavigationBarIconBrightness: Brightness.dark,
      // statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.initState();
    _appLinks = AppLinks();
    AppLinkContract.initDeepLinks(_appLinks, _linkSubscription);
  }

  Future<void> _checkAndroidSDK() async {
    if (GetPlatform.isAndroid) {
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      final androidInfo = await deviceInfoPlugin.androidInfo;
      if (androidInfo.version.sdkInt >= 35) {
        setState(() {
          useSafeArea = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: KeyBoard.hide,
      child: GetMaterialApp(
        locale: const Locale('vi', 'VN'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        unknownRoute: RoutePage.route.first,
        getPages: RoutePage.route,
        builder: (context, child) {
          Widget toastChild = ScrollConfiguration(
            behavior: MyBehavior(),
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                alwaysUse24HourFormat: true,
              ),
              child: child ?? Container(),
            ),
          );
          final scaffold = botToastBuilder(context, toastChild);

          return Container(
            color: AppColors.colorPrimary3,
            child:
                useSafeArea ? SafeArea(top: false, child: scaffold) : scaffold,
          );
        },
        translationsKeys: AppTranslation.translations,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('vi', ''),
          Locale('en', ''),
        ],
        title: LocaleKeys.app_name.tr,
        theme: getThemeByAppTheme(false)
            .copyWith(unselectedWidgetColor: AppColors.lightPrimaryColor),
      ),
    );
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();

    super.dispose();
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
