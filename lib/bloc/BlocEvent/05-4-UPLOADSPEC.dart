import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/05INSPECTIONstd/INSPECTIONstdMAIN.dart';
import '../../page/05INSPECTIONstd/INSPECTIONstdVAR.dart';
import '../cubit/NotificationEvent.dart';
import '05-1-FINSPECTIONget.dart';

//-------------------------------------------------
String server = serverGB;

abstract class UPLOADSPEC_Event {}

class UPLOADSPEC_FINAL_TEXT extends UPLOADSPEC_Event {}

class UPLOADSPEC_FINAL_NUM extends UPLOADSPEC_Event {}

class UPLOADSPEC_flush extends UPLOADSPEC_Event {}

class UPLOADSPEC_Bloc extends Bloc<UPLOADSPEC_Event, String> {
  UPLOADSPEC_Bloc() : super('') {
    on<UPLOADSPEC_FINAL_TEXT>((event, emit) {
      return _UPLOADSPEC_FINAL_TEXT('', emit);
    });
    on<UPLOADSPEC_FINAL_NUM>((event, emit) {
      return _UPLOADSPEC_FINAL_NUM('', emit);
    });
    on<UPLOADSPEC_flush>((event, emit) {
      return _UPLOADSPEC_flush('', emit);
    });
  }
  Future<void> _UPLOADSPEC_FINAL_TEXT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    var query = {
      "CPorder": {
        "CP": INSPECTIONstdVAR.CP,
        "FG": INSPECTIONstdVAR.FG,
        "CUSTOMER": INSPECTIONstdVAR.CUSTOMER,
        "PART": INSPECTIONstdVAR.PART,
        "PARTNAME": INSPECTIONstdVAR.PARTNAME,
        "MATERIAL": INSPECTIONstdVAR.MATERIAL,
        "CUST_FULLNM": INSPECTIONstdVAR.CUST_FULLNM,
      },
      "MASTERdatalist": {
        "TYPE": INSPECTIONstdVAR.FINAL_TYPE,
        "RESULTFORMAT": INSPECTIONstdVAR.FINAL_RESULTFORMAT,
        "GRAPHTYPE": INSPECTIONstdVAR.FINAL_GRAPHTYPE,
        "INTERSECTION": INSPECTIONstdVAR.FINAL_INTERSECTION,
        "DOCUMENTS": INSPECTIONstdVAR.FINAL_DOCUMENT,
      },
      "editedItem_FN": {
        "SEQ": INSPECTIONstdVAR.FINAL_seq,
        "TYPE": INSPECTIONstdVAR.FINAL_TYPE,
        "ITEMs": INSPECTIONstdVAR.FINAL_ITEMs,
        "RESULTFORMAT": INSPECTIONstdVAR.FINAL_RESULTFORMAT,
        "GRAPHTYPE": INSPECTIONstdVAR.FINAL_GRAPHTYPE,
        "INTERSECTION": INSPECTIONstdVAR.FINAL_INTERSECTION,
        "DOCUMENT": INSPECTIONstdVAR.FINAL_DOCUMENT,
        "SCMARK": INSPECTIONstdVAR.FINAL_SCMARK,
        "METHOD": INSPECTIONstdVAR.FINAL_METHOD,
        "INSTRUMENTS": [],
        "SPECIFICATION": [
          {
            "name": INSPECTIONstdVAR.FINAL_SPECIFICATIONstr,
            "value": INSPECTIONstdVAR.FINAL_SPECIFICATION
          }
        ],
        "SPECIFICATIONve": INSPECTIONstdVAR.FINAL_SPECIFICATION,
        "UNIT": INSPECTIONstdVAR.FINAL_UNIT,
        "POINTPCS": "",
        "POINT": INSPECTIONstdVAR.FINAL_POINT,
        "PCS": INSPECTIONstdVAR.FINAL_PCS,
        "FREQUENCY": INSPECTIONstdVAR.FINAL_FREQUENCY,
        "MODE": INSPECTIONstdVAR.FINAL_METHOD,
        "REMARK": INSPECTIONstdVAR.FINAL_REMARK,
        "LOAD": INSPECTIONstdVAR.FINAL_LOAD,
        "CONVERSE": INSPECTIONstdVAR.FINAL_UNIT_CONVERST
      }
    };

    final response = await Dio().post(
      server + "FINAL_SAVE",
      data: query,
    );

    if (response.statusCode == 200) {
      var databuff = response.data;

      if (databuff == 'ok') {
        BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
            "OK", "UPDATE complete", enumNotificationlist.Success);
        INSPECTIONstdMAINcontext.read<FINSPECTIONget_Bloc>()
            .add(FINSPECTIONget_MATCP());
      } else {
        INSPECTIONstdMAINcontext.read<FINSPECTIONget_Bloc>()
            .add(FINSPECTIONget_MATCP());
        BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
            "NOK", "someting wrong", enumNotificationlist.Error);
      }
    }

    emit(output);
  }

  Future<void> _UPLOADSPEC_FINAL_NUM(String toAdd, Emitter<String> emit) async {
    String output = '';
    var query = {
      "CPorder": {
        "CP": INSPECTIONstdVAR.CP,
        "FG": INSPECTIONstdVAR.FG,
        "CUSTOMER": INSPECTIONstdVAR.CUSTOMER,
        "PART": INSPECTIONstdVAR.PART,
        "PARTNAME": INSPECTIONstdVAR.PARTNAME,
        "MATERIAL": INSPECTIONstdVAR.MATERIAL,
        "CUST_FULLNM": INSPECTIONstdVAR.CUST_FULLNM,
      },
      "MASTERdatalist": {
        "TYPE": INSPECTIONstdVAR.FINAL_TYPE,
        "RESULTFORMAT": INSPECTIONstdVAR.FINAL_RESULTFORMAT,
        "GRAPHTYPE": INSPECTIONstdVAR.FINAL_GRAPHTYPE,
        "INTERSECTION": INSPECTIONstdVAR.FINAL_INTERSECTION,
        "DOCUMENTS": INSPECTIONstdVAR.FINAL_DOCUMENT,
      },
      "editedItem_FN": {
        "SEQ": INSPECTIONstdVAR.FINAL_seq,
        "TYPE": INSPECTIONstdVAR.FINAL_TYPE,
        "ITEMs": INSPECTIONstdVAR.FINAL_ITEMs,
        "RESULTFORMAT": INSPECTIONstdVAR.FINAL_RESULTFORMAT,
        "GRAPHTYPE": INSPECTIONstdVAR.FINAL_GRAPHTYPE,
        "INTERSECTION": INSPECTIONstdVAR.FINAL_INTERSECTION,
        "DOCUMENT": INSPECTIONstdVAR.FINAL_DOCUMENT,
        "SCMARK": INSPECTIONstdVAR.FINAL_SCMARK,
        "METHOD": INSPECTIONstdVAR.FINAL_METHOD,
        "INSTRUMENTS": [],
        "SPECIFICATION": [],
        "SPECIFICATIONve": {
          "condition": INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.condition,
          "HIM_L": INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.HIM_L,
          "LOL_H": INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.LOL_H,
          "BTW_LOW": INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.BTW_LOW,
          "BTW_HI": INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.BTW_HI,
          "TARGET": INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.TARGET,
        },
        "UNIT": INSPECTIONstdVAR.FINAL_UNIT,
        "POINTPCS": "",
        "POINT": INSPECTIONstdVAR.FINAL_POINT,
        "PCS": INSPECTIONstdVAR.FINAL_PCS,
        "FREQUENCY": INSPECTIONstdVAR.FINAL_FREQUENCY,
        "MODE": INSPECTIONstdVAR.FINAL_METHOD,
        "REMARK": INSPECTIONstdVAR.FINAL_REMARK,
        "LOAD": INSPECTIONstdVAR.FINAL_LOAD,
        "CONVERSE": INSPECTIONstdVAR.FINAL_UNIT_CONVERST
      }
    };

    final response = await Dio().post(
      server + "FINAL_SAVE",
      data: query,
    );

    if (response.statusCode == 200) {
      var databuff = response.data;

      if (databuff == 'ok') {
        BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
            "OK", "UPDATE complete", enumNotificationlist.Success);
        INSPECTIONstdMAINcontext.read<FINSPECTIONget_Bloc>()
            .add(FINSPECTIONget_MATCP());
      } else {
        INSPECTIONstdMAINcontext.read<FINSPECTIONget_Bloc>()
            .add(FINSPECTIONget_MATCP());
        BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
            "NOK", "someting wrong", enumNotificationlist.Error);
      }
    }
    emit(output);
  }

  Future<void> _UPLOADSPEC_flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
