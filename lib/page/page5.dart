import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/05-1-FINSPECTIONget.dart';
import '../bloc/cubit/Rebuild.dart';

import '../bloc/BlocEvent/05-3-STEP-INSPECTIONquery.dart';
import '05INSPECTIONstd/INSPECTIONstdMAIN.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page5REBUILD();
  }
}

class Page5REBUILD extends StatelessWidget {
  const Page5REBUILD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocPageRebuild, bool>(
      builder: (_, e) {
        return FINALPOPU5PBlocDROPDOWN();
      },
    );
  }
}

class FINALPOPU5PBlocDROPDOWN extends StatelessWidget {
  /// {@macro counter_page}
  const FINALPOPU5PBlocDROPDOWN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INSPECTION_DDSTEP_Bloc(),
        child: BlocBuilder<INSPECTION_DDSTEP_Bloc, DROPDOWN_INS_STEP1>(
          builder: (context, DDstep) {
            return FINSPECTIONget_Bloc_5PBloc(
              DDstep: DDstep,
            );
          },
        ));
  }
}

class FINSPECTIONget_Bloc_5PBloc extends StatelessWidget {
  /// {@macro counter_page}
  FINSPECTIONget_Bloc_5PBloc({Key? key, this.DDstep}) : super(key: key);
  DROPDOWN_INS_STEP1? DDstep;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => FINSPECTIONget_Bloc(),
        child: BlocBuilder<FINSPECTIONget_Bloc, int>(
          builder: (context, data) {
            return Page5Body(
              DDstep: DDstep,
            );
          },
        ));
  }
}

class Page5Body extends StatelessWidget {
  Page5Body({Key? key, this.DDstep}) : super(key: key);
  DROPDOWN_INS_STEP1? DDstep;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: INSPECTIONstdMAIN(
        DDstep: DDstep,
      ),
    );
  }
}
