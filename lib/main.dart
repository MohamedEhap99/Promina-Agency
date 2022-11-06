import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gellary_task/business_logic/gallery_cubit/gallery_cubit.dart';
import 'package:gellary_task/business_logic/login_cubit/login_cubit.dart';
import 'package:gellary_task/data/repository/login_repo.dart';
import 'package:gellary_task/data/web_services/remote/dio_helper.dart';
import 'package:gellary_task/data/web_services/remote/hive_helper.dart';
import 'package:gellary_task/presentations/screens/splash_screen.dart';
import 'package:gellary_task/shared/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  DioHelper.init();
  await HiveHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(LoginRepository()),
        ),
        BlocProvider(
          create: (context) => GalleryCubit(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            title: "Promina Agency",
            navigatorKey: RouteManager.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: GoogleFonts.balooThambi2TextTheme(),
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
