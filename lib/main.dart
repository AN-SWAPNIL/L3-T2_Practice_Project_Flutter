import 'package:demo_project/splash/controllers/splash_controller.dart';
import 'package:demo_project/splash/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:demo_project/welcome/welcomepage.dart';
import 'package:demo_project/login/login.dart';
import 'package:demo_project/login/registration.dart';
import 'package:demo_project/homepage/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:demo_project/homepage/communitypage.dart';
import 'package:demo_project/homepage/FavoritesPage.dart';
import 'package:demo_project/pages/TouristDetailsPage.dart';
import 'package:demo_project/models/TouristAttraction.dart';
import 'package:demo_project/pages/NearbyPlaceDetailsPage.dart';
import 'package:demo_project/models/NearbyPlaceModel.dart';
import 'homepage/profile.dart';
import 'homepage/profile2.dart';
import 'package:demo_project/firebase_options.dart';
import 'homepage/favorites_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash', // Use the '/' for routes
        getPages: [
          GetPage(name: '/splash', page: () => SplashView()),
          GetPage(name: '/welcome', page: () => welcomepage()),
          GetPage(name: '/login', page: () => login()),
          GetPage(name: '/register', page: () => registration()),
          GetPage(name: '/homepage', page: () => homepage()),
          GetPage(name: '/profile', page: () => profile2()),
          GetPage(name: '/communitypage', page: () => communitypage()),
          GetPage(name: '/favorites', page: () => FavoritesPage()),
          GetPage(
            name: '/tourist_details',
            page: () => TouristDetailsPage(
              attraction: Get.arguments as TouristAttraction,
            ),
          ),
          GetPage(
            name: '/nearby_place_details',
            page: () => NearbyPlaceDetailsPage(
              place: Get.arguments as NearbyPlaceModel,
            ),
          ),
        ],
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize SplashController
  Get.put(SplashController());

  runApp(const MyApp());
}

