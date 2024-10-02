import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/widgets/scaffold/bloc/cubit/navbar_cubit.dart';
import 'package:flutter_application_1/Features/Search/view/bloc/cubit/search_cubit.dart';
import 'package:flutter_application_1/Features/home/view/bloc/cubit/provider_cubit.dart';
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
            create: (context) => ItemPickerCubit(),
          ),
          // BlocProvider(
          //   create: (context) => ReportCubit(),
          // ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              bottomSheetTheme:
                  const BottomSheetThemeData(backgroundColor: Colors.white),
              scaffoldBackgroundColor: ConstColor.lightBgGrey,
              fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              iconTheme: IconThemeData(color: ConstColor.lightIconColor),
              useMaterial3: true,
              listTileTheme:
                  ListTileThemeData(iconColor: ConstColor.lightIconColor)),
          home: const SplashScreen(),
        ));
  }
}
