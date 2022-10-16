import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/05INSPECTIONstd/INSPECTIONstdVAR.dart';

//-------------------------------------------------
String server = serverGB;

abstract class INSPECTION_Event {}

class INSPECTION_GET_STEP1 extends INSPECTION_Event {}

class INSPECTION_GET_STEP2 extends INSPECTION_Event {}

class INSPECTION_GET_STEP3 extends INSPECTION_Event {}

class INSPECTION_FLUSH extends INSPECTION_Event {}

class INSPECTION_DDSTEP_Bloc
    extends Bloc<INSPECTION_Event, DROPDOWN_INS_STEP1> {
  INSPECTION_DDSTEP_Bloc()
      : super(DROPDOWN_INS_STEP1(
          //
          ITEMSdd: [],
          //
          COREdd: [],
          SCMASKdd: [],
          SCMASKTYPEdd: [],
          IMGreadDATAdd: [],
          IMGreadNOdd: [],
          LOADdd: [],
          GTdd: [],
          UNITdd: [],
          FREQUENCYdd: [],
          //
          METHODdd: [],
          SPECIFICATIONdd: [],
        )) {
    on<INSPECTION_GET_STEP1>((event, emit) {
      return _INSPECTION_GET_STEP1(
          DROPDOWN_INS_STEP1(
            //
            ITEMSdd: [],
            //
            COREdd: [],
            SCMASKdd: [],
            SCMASKTYPEdd: [],
            IMGreadDATAdd: [],
            IMGreadNOdd: [],
            LOADdd: [],
            GTdd: [],
            UNITdd: [],
            FREQUENCYdd: [],
            //
            METHODdd: [],
            SPECIFICATIONdd: [],
          ),
          emit);
    });
    on<INSPECTION_GET_STEP2>((event, emit) {
      return _INSPECTION_GET_STEP2(
          DROPDOWN_INS_STEP1(
            //
            ITEMSdd: [],
            //
            COREdd: [],
            SCMASKdd: [],
            SCMASKTYPEdd: [],
            IMGreadDATAdd: [],
            IMGreadNOdd: [],
            LOADdd: [],
            GTdd: [],
            UNITdd: [],
            FREQUENCYdd: [],
            //
            METHODdd: [],
            SPECIFICATIONdd: [],
          ),
          emit);
    });

    on<INSPECTION_GET_STEP3>((event, emit) {
      return _INSPECTION_GET_STEP3(
          DROPDOWN_INS_STEP1(
            //
            ITEMSdd: [],
            //
            COREdd: [],
            SCMASKdd: [],
            SCMASKTYPEdd: [],
            IMGreadDATAdd: [],
            IMGreadNOdd: [],
            LOADdd: [],
            GTdd: [],
            UNITdd: [],
            FREQUENCYdd: [],
            //
            METHODdd: [],
            SPECIFICATIONdd: [],
          ),
          emit);
    });

    on<INSPECTION_FLUSH>((event, emit) {
      return _INSPECTION_FLUSH(
          DROPDOWN_INS_STEP1(
            //
            ITEMSdd: [],
            //
            COREdd: [],
            SCMASKdd: [],
            SCMASKTYPEdd: [],
            IMGreadDATAdd: [],
            IMGreadNOdd: [],
            LOADdd: [],
            GTdd: [],
            UNITdd: [],
            FREQUENCYdd: [],
            //
            METHODdd: [],
            SPECIFICATIONdd: [],
          ),
          emit);
    });
  }

  Future<void> _INSPECTION_GET_STEP1(
      DROPDOWN_INS_STEP1 toAdd, Emitter<DROPDOWN_INS_STEP1> emit) async {
    DROPDOWN_INS_STEP1 output = DROPDOWN_INS_STEP1(
      //
      ITEMSdd: [MapEntry("", "")],
      //
      COREdd: [],
      SCMASKdd: [],
      SCMASKTYPEdd: [],
      IMGreadDATAdd: [],
      IMGreadNOdd: [],
      LOADdd: [],
      GTdd: [],
      UNITdd: [],
      FREQUENCYdd: [],
      //
      METHODdd: [],
      SPECIFICATIONdd: [],
    );
    final response = await Dio().post(
      server + "INSPECTION_GET_STEP1",
      data: {},
    );
    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);

      output.status = 'STEP1';

      if (databuff['ITEMs'] != null) {
        for (int i = 0; i < databuff['ITEMs'].length; i++) {
          output.ITEMSdd.add(MapEntry(databuff['ITEMs'][i]['ITEMs'].toString(),
              databuff['ITEMs'][i]['masterID'].toString()));
        }
      }
      //
    } else {
      //
    }

    emit(output);
  }

  Future<void> _INSPECTION_GET_STEP2(
      DROPDOWN_INS_STEP1 toAdd, Emitter<DROPDOWN_INS_STEP1> emit) async {
    DROPDOWN_INS_STEP1 output = DROPDOWN_INS_STEP1(
      //
      ITEMSdd: [],
      //
      COREdd: [],
      SCMASKdd: [],
      SCMASKTYPEdd: [],
      IMGreadDATAdd: [],
      IMGreadNOdd: [],
      LOADdd: [],
      GTdd: [],
      UNITdd: [],
      FREQUENCYdd: [],
      //
      METHODdd: [MapEntry("", "")],
      SPECIFICATIONdd: [],
    );
    final response = await Dio().post(
      server + "INSPECTION_GET_STEP2",
      data: {
        "ITEMs": INSPECTIONstdVAR.FINAL_ITEMs,
      },
    );
    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);

      output.status = 'STEP2';

      if (databuff['METHOD'] != null) {
        for (int i = 0; i < databuff['METHOD'].length; i++) {
          output.METHODdd.add(MapEntry(
              databuff['METHOD'][i]['METHOD'].toString(),
              databuff['METHOD'][i]['masterID'].toString()));
        }
      }
      if (databuff['LOAD'] != null) {
        for (int i = 0; i < databuff['LOAD'].length; i++) {
          output.LOADdd.add(MapEntry(databuff['LOAD'][i]['LOAD'].toString(),
              databuff['LOAD'][i]['LOAD'].toString()));
        }
      }
      if (databuff['GT'] != null) {
        for (int i = 0; i < databuff['GT'].length; i++) {
          output.GTdd.add(MapEntry(
            databuff['GT'][i]['GT'].toString(),
            databuff['GT'][i]['GT'].toString(),
          ));
        }
      }
      if (databuff['UNIT'] != null) {
        for (int i = 0; i < databuff['UNIT'].length; i++) {
          output.UNITdd.add(MapEntry(databuff['UNIT'][i]['UNIT'].toString(),
              databuff['UNIT'][i]['masterID'].toString()));
        }
      }
      if (databuff['FREQUENCY'] != null) {
        for (int i = 0; i < databuff['FREQUENCY'].length; i++) {
          output.FREQUENCYdd.add(MapEntry(
              databuff['FREQUENCY'][i]['FREQUENCY'].toString(),
              databuff['FREQUENCY'][i]['FREQUENCY'].toString()));
        }
      }
      //
    } else {
      //
    }
    emit(output);
  }

  Future<void> _INSPECTION_GET_STEP3(
      DROPDOWN_INS_STEP1 toAdd, Emitter<DROPDOWN_INS_STEP1> emit) async {
    DROPDOWN_INS_STEP1 output = DROPDOWN_INS_STEP1(
      //
      ITEMSdd: [],
      //
      COREdd: [],
      SCMASKdd: [],
      SCMASKTYPEdd: [],
      IMGreadDATAdd: [],
      IMGreadNOdd: [],
      LOADdd: [],
      GTdd: [],
      UNITdd: [],
      FREQUENCYdd: [],
      //
      METHODdd: [],
      SPECIFICATIONdd: [],
    );
    emit(output);
  }

  Future<void> _INSPECTION_FLUSH(
      DROPDOWN_INS_STEP1 toAdd, Emitter<DROPDOWN_INS_STEP1> emit) async {
    DROPDOWN_INS_STEP1 output = DROPDOWN_INS_STEP1(
      //
      ITEMSdd: [],
      //
      COREdd: [],
      SCMASKdd: [],
      SCMASKTYPEdd: [],
      IMGreadDATAdd: [],
      IMGreadNOdd: [],
      LOADdd: [],
      GTdd: [],
      UNITdd: [],
      FREQUENCYdd: [],
      //
      METHODdd: [],
      SPECIFICATIONdd: [],
    );
    output.status = '';
    emit(output);
  }
}

class DROPDOWN_INS_STEP1 {
  DROPDOWN_INS_STEP1({
    this.status = '',
    //lode step 1
    required this.ITEMSdd,
    //lode step 2
    required this.COREdd,
    required this.SCMASKdd,
    required this.SCMASKTYPEdd,
    required this.IMGreadDATAdd,
    required this.IMGreadNOdd,
    required this.LOADdd,
    required this.GTdd,
    required this.UNITdd,
    required this.FREQUENCYdd,
    //lode step 3
    required this.METHODdd,
    required this.SPECIFICATIONdd,
  });
  String status;
  //lode step 1
  List<MapEntry<String, String>> ITEMSdd;

  //lode step 2
  List<MapEntry<String, String>> METHODdd;
  List<MapEntry<String, String>> COREdd;
  List<MapEntry<String, String>> SCMASKdd;
  List<MapEntry<String, String>> SCMASKTYPEdd;
  List<MapEntry<String, String>> IMGreadDATAdd;
  List<MapEntry<String, String>> IMGreadNOdd;
  List<MapEntry<String, String>> LOADdd;
  List<MapEntry<String, String>> GTdd;
  List<MapEntry<String, String>> UNITdd;
  List<MapEntry<String, String>> FREQUENCYdd;

  //lode step 3

  List<MapEntry<String, String>> SPECIFICATIONdd;
}
