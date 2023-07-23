import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fitness/Pages/bmi_input_page.dart';

import 'package:provider/provider.dart';

// import 'Pages/Detail_of_Subcategory.txt';

import 'Pages/Detail_of_Subcategory.dart';
import 'Pages/FinalReportPage.dart';
import 'Pages/SchedulList.dart';
import 'Pages/WorkoutList.dart';
import 'Pages/chatbot.dart';
import 'Pages/main_landing_page.dart';
import 'Pages/payment_gateway.dart';
import 'Pages/splash_screen.dart';
import 'Pages/sport_category_page.dart';
import 'Pages/login_screen.dart';
import 'Pages/signUp_screen.dart';
import 'Pages/MusicList.dart';
import '../translations/codegen_loader.g.dart';

import 'Provider/WorkOut Scheduler.dart';
import 'Provider/exercises_categories.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('am'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('am'),
      assetLoader: const CodegenLoader(),
      child: const Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExerciseCategories()),
        ChangeNotifierProvider(create: (context) => WorkOutProvider()),
      ],
      child: MaterialApp(
        // adding nessesary deligates for app localizasion
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,

        // Hide the debug banner
        debugShowCheckedModeBanner: false,

        // Theme of the page
        theme: ThemeData.dark(),
        title: 'Flutter Example',

        routes: {
          // '/': (context) => SplashScreen(),
          '/Login': (context) => const LoginScreen(),
          '/Signup': (context) => const SignUpScreen(),
          '/Main': (context) => const MainLandingPage(),

          '/Final': (context) => const FinalReportPage(),
          '/Detail': (context) => DetailSubList(),
          '/SportCat': (context) => const SportsCategory(),
          '/chat': (context) => Chatbot(),
          // Pages for pro version
          '/Schedule': (context) => SchedulList(),
          '/Workout': (context) => WorkoutList(),
          '/Bmi': (context) => const InputPage(),
          '/Payment': (context) => const PaymentGatewayScreen(),
        },

        home:
            //  SportsCategory(),

            // WorkoutList(),

            // SchedulList(),
            SplashScreen(),
        // Chatbot(),
        // const Music(),

        // WeSlideTest(),
        // PaymentGatewayScreen(),
        // SignUpScreen(),
        // LoginScreen(),
        // FinalReportPage(),

        // MainLandingPage(),
        // SchedulList(),
        // mongotest(),
        // Lang(),
      ),
    );
  }
}
