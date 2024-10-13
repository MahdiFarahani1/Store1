import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Config/connection/cubit/connection_cubit.dart';
import 'package:flutter_application_1/Config/theme/theme_cubit.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/widgets/scaffold/bloc/navbar/navbar_cubit.dart';
import 'package:flutter_application_1/Features/Search/view/bloc/cubit/search_cubit.dart';
import 'package:flutter_application_1/Features/home/view/bloc/appbar/appbar_cubit.dart';
import 'package:flutter_application_1/Features/home/view/bloc/cubit/provider_cubit.dart';
import 'package:flutter_application_1/Features/home/view/bloc/slider/cubit/slider_cubit.dart';
import 'package:flutter_application_1/Features/login/view/bloc/cubit/sign_up_cubit.dart';
import 'package:flutter_application_1/Features/reports/view/bloc/cubit/itemPicker/itemPicker_cubit.dart';
import 'package:flutter_application_1/Features/splash/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProviderCubit(),
          ),
          BlocProvider(
            create: (context) => SearchCubit(),
          ),
          BlocProvider(
            create: (context) => NavbarCubit(),
          ),

          BlocProvider(
            create: (context) => ReportCubit(),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) => SliderCubit(),
          ),
          BlocProvider(
            create: (context) => SignUpCubit(),
          ),
          BlocProvider(
            create: (context) => AppbarCubit(),
          ),
          BlocProvider(
            create: (context) => ConnectionCubit(),
          ),
          // BlocProvider(
          //   create: (context) => ReportCubit(),
          // ),
          // BlocProvider(
          //   create: (context) => ReportCubit(),
          // ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  textTheme: textTheme(context),
                  bottomSheetTheme: BottomSheetThemeData(
                      backgroundColor: ConstColor.getBgGrey(context)),
                  scaffoldBackgroundColor: ConstColor.getBgGrey(context),
                  fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.deepPurple,
                  ),
                  primaryColor: ConstColor.getBackgroundColor(context),
                  iconTheme:
                      IconThemeData(color: ConstColor.getIconColor(context)),
                  useMaterial3: true,
                  listTileTheme:
                      ListTileThemeData(iconColor: ConstColor.lightIconColor)),
              home: const SplashScreen(),
            );
          },
        ));
  }

  TextTheme textTheme(BuildContext context) {
    return TextTheme(
      displayLarge: TextStyle(color: ConstColor.getBgReverce(context)),
      displayMedium: TextStyle(color: ConstColor.getBgReverce(context)),
      displaySmall: TextStyle(color: ConstColor.getBgReverce(context)),
      headlineLarge: TextStyle(color: ConstColor.getBgReverce(context)),
      headlineMedium: TextStyle(color: ConstColor.getBgReverce(context)),
      headlineSmall: TextStyle(color: ConstColor.getBgReverce(context)),
      titleLarge: TextStyle(color: ConstColor.getBgReverce(context)),
      titleMedium: TextStyle(color: ConstColor.getBgReverce(context)),
      titleSmall: TextStyle(color: ConstColor.getBgReverce(context)),
      bodyLarge: TextStyle(color: ConstColor.getBgReverce(context)),
      bodyMedium: TextStyle(color: ConstColor.getBgReverce(context)),
      bodySmall: TextStyle(color: ConstColor.getBgReverce(context)),
      labelLarge: TextStyle(color: ConstColor.getBgReverce(context)),
      labelMedium: TextStyle(color: ConstColor.getBgReverce(context)),
      labelSmall: TextStyle(color: ConstColor.getBgReverce(context)),
    );
  }
}
