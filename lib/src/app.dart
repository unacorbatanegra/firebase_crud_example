import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'presentation/pages/menu/extension.dart';
import 'presentation/widgets/widgets.dart';
import 'utils/utils.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        title: 'Firebase CRUD example',
        logWriterCallback: (text, {isError}) => print(text),
        defaultTransition: Transition.cupertino,
        initialRoute: RouteName.main,
        transitionDuration: const Duration(milliseconds: 300),
        enableLog: true,
        builder: (_, child) => Scaffold(
          key: SnackBarExtension.scaffoldKey,
          body: Builder(
            builder: (context) => child,
          ),
        ),
        debugShowCheckedModeBanner: false,
        locale: const Locale('en', 'US'),
        getPages: CustomRouter.routes,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: CustomTheme.theme,
        supportedLocales: [
          const Locale('en', 'US'),
        ],
      ),
    );
  }
}
