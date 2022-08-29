import 'package:clean_architecture/core/constants/enums/locale_keys_enum.dart';
import 'package:clean_architecture/core/extension/string_extension.dart';
import 'package:clean_architecture/core/init/cache/locale_manager.dart';
import 'package:clean_architecture/core/init/lang/language_manager.dart';
import 'package:clean_architecture/core/init/lang/locale_keys.g.dart';
import 'package:clean_architecture/core/init/navigation/navigation_service.dart';
import 'package:clean_architecture/core/init/notifier/theme_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/notifier/provider_list.dart';

void main() {
  LocaleManager.prefencesInit();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance!.dependItems],
    child: EasyLocalization(supportedLocales: LanguageManager.instance!.supportedLocales, path:ApplicationConstants.TRANSLATIONS_ASSET_PATH, 
    startLocale: LanguageManager.instance?.enLocale,
    child: const MyApp() ),
  ));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:NavigationRoute.instance!.generateRoute,
      navigatorKey:NavigationService.instance!.navigatorKey ,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifier>().currentTheme,
    
      home:  Scaffold(
        appBar: AppBar(
          leading: Text(LocaleManager.instance.getStringValue(PreferencesKeys.token).toString()),
          
          
          title: Text(LocaleKeys.button.locale),actions: [IconButton(onPressed: (){
         context.locale=LanguageManager.instance!.enLocale;
        }, icon: const Icon(Icons.change_circle_outlined)),
          
        ],),
        body: const Text(LocaleKeys.login),
      ),
    );
  }
}

