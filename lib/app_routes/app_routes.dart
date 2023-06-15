import 'package:get/get.dart';
import 'package:ispection/app_routes/routes.dart';
import 'package:ispection/view/pages/home_page_module/home_page/home_Page.dart';

pageRoutes()=>[
  //===============Home Page  call============//
  GetPage(name: Routes.homeScreen,
   page: ()=> const HomeScreen(),
   transition:  Transition.rightToLeftWithFade,
   transitionDuration:  const Duration(milliseconds: 500),
   ),
];
  
