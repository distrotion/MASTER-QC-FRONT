import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../responsive/responsive.dart';

class menu_normal extends StatelessWidget {
  menu_normal(
      {Key? key, this.name, this.icon, required this.page, required this.Lv})
      : super(key: key);
  String? name;
  Widget page;
  String? icon;
  int Lv;

  @override
  Widget build(BuildContext context) {
    String _name = name ?? "";

    return InkWell(
      onTap: () {
        // BlocProvider.of<SwPageCubit>(context).togglePage(page);
        CuPage = page;
        CuPageLV = Lv;
        if (Responsive.isDesktop(context)) {
          MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
        } else {
          MainBodyContext.read<ChangePage_Bloc>().add(ChangePage());
        }
      },
      child: Container(
        //color: Colors.blue,
        height: 50,
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.shade400,
                    // image: DecorationImage(
                    //   image: AssetImage(""),
                    //   fit: BoxFit.fitWidth,
                    // ),
                    //borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  )),
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "   " + _name,
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class menu_sub extends StatelessWidget {
  menu_sub(
      {Key? key,
      this.name,
      this.icon,
      required this.page,
      required this.Lv,
      this.tapcolor})
      : super(key: key);
  String? name;
  Widget page;
  String? icon;
  int Lv;
  Color? tapcolor;

  @override
  Widget build(BuildContext context) {
    String _name = name ?? "";

    return InkWell(
      onTap: () {
        // BlocProvider.of<SwPageCubit>(context).togglePage(page);
        CuPage = page;
        CuPageLV = Lv;
        CuPageLV = Lv;
        if (Responsive.isDesktop(context)) {
          MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
        } else {
          MainBodyContext.read<ChangePage_Bloc>().add(ChangePage());
        }
      },
      child: Container(
        //color: Colors.blue,
        height: 40,
        child: Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    color: tapcolor ?? Colors.redAccent.shade400,
                    // image: DecorationImage(
                    //   image: AssetImage(""),
                    //   fit: BoxFit.fitWidth,
                    // ),
                    //borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  )),
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "   " + _name,
                  style: const TextStyle(
                    fontFamily: 'Mitr',
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
