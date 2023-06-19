import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:video_app/app/routes/app_pages.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Video Player App",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      // theme: AppThemes.theme.copyWith(
      //   colorScheme: AppThemes.theme.colorScheme
      //       .copyWith(secondary: AppColors.secondary),
      // ),
      // initialBinding: SplashBinding(),
      locale:  Get.locale ?? Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      // translationsKeys: AppTranslation.translations,
      defaultTransition: Transition.fadeIn,
      builder: EasyLoading.init(),
    );
  }
}
