import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/func/func_back.dart';
import 'package:flutter_application_1/Core/widgets/scaffold/bloc/navbar/navbar_cubit.dart';
import 'package:flutter_application_1/Features/home/view/screen/main_wraper.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<NavbarCubit>(context).initNavbar();
        NavToPage.push(context, const MainWraper());
      },
      child: SvgPicture.asset(
        Assets.icons.arrowLeft,
        width: 35,
        height: 35,
        colorFilter:
            ColorFilter.mode(ConstColor.getBgReverce(context), BlendMode.srcIn),
      ),
    );
  }
}
