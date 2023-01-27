import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/04MATCPlist/04MATCPlistMAINvar.dart';
import '../../page/05INSPECTIONstd/INSPECTIONstdVAR.dart';

//-------------------------------------------------

String server = serverGB;

abstract class FINSPECTIONget_Event {}

class FINSPECTIONget_MATCP extends FINSPECTIONget_Event {}

class FINSPECTIONget_FLUSH extends FINSPECTIONget_Event {}

class FINSPECTIONget_Bloc extends Bloc<FINSPECTIONget_Event, InspectionSTD> {
  FINSPECTIONget_Bloc()
      : super(InspectionSTD(
          INCOMMING: [],
          INPROCESS: [],
          FINAL: [],
        )) {
    on<FINSPECTIONget_MATCP>((event, emit) {
      return _FINSPECTIONget_MATCP(
          InspectionSTD(
            INCOMMING: [],
            INPROCESS: [],
            FINAL: [],
          ),
          emit);
    });
    on<FINSPECTIONget_FLUSH>((event, emit) {
      return _FINSPECTIONget_FLUSH(
          InspectionSTD(
            INCOMMING: [],
            INPROCESS: [],
            FINAL: [],
          ),
          emit);
    });
  }
  Future<void> _FINSPECTIONget_MATCP(
      InspectionSTD toAdd, Emitter<InspectionSTD> emit) async {
    InspectionSTD output = InspectionSTD(
      INCOMMING: [],
      INPROCESS: [],
      FINAL: [],
    );
    INSPECTIONstdVAR.CP = MATCPlistMAINvar.CP;
    INSPECTIONstdVAR.FG = MATCPlistMAINvar.FG;
    INSPECTIONstdVAR.CUSTOMER = MATCPlistMAINvar.CUSTOMER;
    INSPECTIONstdVAR.PART = MATCPlistMAINvar.PART;
    INSPECTIONstdVAR.PARTNAME = MATCPlistMAINvar.PARTNAME;
    INSPECTIONstdVAR.MATERIAL = MATCPlistMAINvar.MATERIAL;
    INSPECTIONstdVAR.CUST_FULLNM = MATCPlistMAINvar.CUST_FULLNM;

    final response = await Dio().post(
      server + "GET_MATCP_DATA",
      data: {
        "MATCP": INSPECTIONstdVAR.CP,
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff[0]['FINAL']);

      output.status = 'GET_ALL';

      // print(databuff[0]['findTYPE']);
      List<BasicBodyData> findTYPE = [];
      if (databuff[0]['findTYPE'] != null) {
        for (int i = 0; i < databuff[0]['findTYPE'].length; i++) {
          findTYPE.add(BasicBodyData(
            NAME: databuff[0]['findTYPE'][i]['TYPE'] != null
                ? databuff[0]['findTYPE'][i]['TYPE'].toString()
                : "",
            masterID: databuff[0]['findTYPE'][i]['masterID'] != null
                ? databuff[0]['findTYPE'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      String findTYPEconv(String input) {
        String output = "";

        for (int i = 0; i < findTYPE.length; i++) {
          if (input == findTYPE[i].masterID) {
            output = findTYPE[i].NAME;
            break;
          }
        }

        return output;
      }

      List<BasicBodyData> findITEMs = [];
      if (databuff[0]['findITEMs'] != null) {
        for (int i = 0; i < databuff[0]['findITEMs'].length; i++) {
          findITEMs.add(BasicBodyData(
            NAME: databuff[0]['findITEMs'][i]['ITEMs'] != null
                ? databuff[0]['findITEMs'][i]['ITEMs'].toString()
                : "",
            masterID: databuff[0]['findITEMs'][i]['masterID'] != null
                ? databuff[0]['findITEMs'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      String findITEMsconv(String input) {
        String output = "";

        for (int i = 0; i < findITEMs.length; i++) {
          if (input == findITEMs[i].masterID) {
            output = findITEMs[i].NAME;
            break;
          }
        }

        return output;
      }

      //findMACHINE
      // print(databuff[0]['findMACHINE']);
      List<BasicBodyData> findMACHINE = [];
      if (databuff[0]['findMACHINE'] != null) {
        for (int i = 0; i < databuff[0]['findMACHINE'].length; i++) {
          findMACHINE.add(BasicBodyData(
            NAME: databuff[0]['findMACHINE'][i]['METHOD'] != null
                ? databuff[0]['findMACHINE'][i]['METHOD'].toString()
                : "",
            masterID: databuff[0]['findMACHINE'][i]['masterID'] != null
                ? databuff[0]['findMACHINE'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      String findMACHINEconv(String input) {
        String output = "";

        for (int i = 0; i < findMACHINE.length; i++) {
          if (input == findMACHINE[i].masterID) {
            output = findMACHINE[i].NAME;
            break;
          }
        }

        return output;
      }

      //findUNIT
      List<BasicBodyData> findUNIT = [];
      if (databuff[0]['findUNIT'] != null) {
        for (int i = 0; i < databuff[0]['findUNIT'].length; i++) {
          findUNIT.add(BasicBodyData(
            NAME: databuff[0]['findUNIT'][i]['UNIT'] != null
                ? databuff[0]['findUNIT'][i]['UNIT'].toString()
                : "",
            masterID: databuff[0]['findUNIT'][i]['masterID'] != null
                ? databuff[0]['findUNIT'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      String findUNITconv(String input) {
        String output = "";

        for (int i = 0; i < findUNIT.length; i++) {
          if (input == findUNIT[i].masterID) {
            output = findUNIT[i].NAME;
            break;
          }
        }

        return output;
      }

      //findSPECIFICATION
      // print(databuff[0]['findSPECIFICATION']);
      List<BasicBodyData> findSPECIFICATION = [];
      if (databuff[0]['findSPECIFICATION'] != null) {
        for (int i = 0; i < databuff[0]['findSPECIFICATION'].length; i++) {
          findSPECIFICATION.add(BasicBodyData(
            NAME: databuff[0]['findSPECIFICATION'][i]['SPECIFICATION'] != null
                ? databuff[0]['findSPECIFICATION'][i]['SPECIFICATION']
                    .toString()
                : "",
            masterID: databuff[0]['findSPECIFICATION'][i]['masterID'] != null
                ? databuff[0]['findSPECIFICATION'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      String findSPECIFICATIONconv(String input) {
        String output = "";

        if (input.contains("SPECIFICATION-")) {
          for (int i = 0; i < findSPECIFICATION.length; i++) {
            if (input == findSPECIFICATION[i].masterID) {
              output = findSPECIFICATION[i].NAME;
              break;
            }
          }
        } else {
          if (input.contains("{") && input.contains("}")) {
            Map<String, dynamic> data = jsonStringToMap(input);
            // print(input);
            output = input;
            if (data['condition'] != null && data['condition'] == "BTW") {
              output = '${data['BTW_LOW']} - ${data['BTW_HI']} ';
            } else if (data['condition'] != null &&
                data['condition'] == "Actual") {
              output = 'Actual';
            } else if (data['condition'] != null &&
                data['condition'] == "LOL(<)") {
              output = '${data['LOL_H']} <  ';
            } else if (data['condition'] != null &&
                data['condition'] == "HIM(>)") {
              output = ' > ${data['HIM_L']}';
            }
          } else {
            output = input;
          }
        }
        return output;
      }

      if (databuff[0]['FINAL'] != null) {
        for (var i = 0; i < databuff[0]['FINAL'].length; i++) {
          //
          output.FINAL.add(
            speckSTD(
              seq: databuff[0]['FINAL'][i]['SEQ'] != null
                  ? databuff[0]['FINAL'][i]['SEQ'].toString()
                  : '0',
              TYPE: databuff[0]['FINAL'][i]['TYPE'] != null
                  ? databuff[0]['FINAL'][i]['TYPE'].toString()
                  : '',
              TYPEname: findTYPEconv(databuff[0]['FINAL'][i]['TYPE'] != null
                  ? databuff[0]['FINAL'][i]['TYPE'].toString()
                  : ''),
              ITEMs: databuff[0]['FINAL'][i]['ITEMs'] != null
                  ? databuff[0]['FINAL'][i]['ITEMs'].toString()
                  : '',
              ITEMsname: findITEMsconv(databuff[0]['FINAL'][i]['ITEMs'] != null
                  ? databuff[0]['FINAL'][i]['ITEMs'].toString()
                  : ''),
              RESULTFORMAT: databuff[0]['FINAL'][i]['RESULTFORMAT'] != null
                  ? databuff[0]['FINAL'][i]['RESULTFORMAT'].toString()
                  : '',
              GRAPHTYPE: databuff[0]['FINAL'][i]['GRAPHTYPE'] != null
                  ? databuff[0]['FINAL'][i]['GRAPHTYPE'].toString()
                  : '',
              INTERSECTION: databuff[0]['FINAL'][i]['INTERSECTION'] != null
                  ? databuff[0]['FINAL'][i]['INTERSECTION'].toString()
                  : '',
              DOCUMENT: databuff[0]['FINAL'][i]['DOCUMENT'] != null
                  ? databuff[0]['FINAL'][i]['DOCUMENT'].toString()
                  : '',
              SCMARK: databuff[0]['FINAL'][i]['SCMARK'] != null
                  ? databuff[0]['FINAL'][i]['SCMARK'].toString()
                  : '',
              METHOD: databuff[0]['FINAL'][i]['METHOD'] != null
                  ? databuff[0]['FINAL'][i]['METHOD'].toString()
                  : '',
              METHODname: findMACHINEconv(
                  databuff[0]['FINAL'][i]['METHOD'] != null
                      ? databuff[0]['FINAL'][i]['METHOD'].toString()
                      : ''),
              INSTRUMENTS: databuff[0]['FINAL'][i]['INSTRUMENTS'] != null
                  ? databuff[0]['FINAL'][i]['INSTRUMENTS'].toString()
                  : '',
              SPECIFICATION: databuff[0]['FINAL'][i]['SPECIFICATION'] != null
                  ? (databuff[0]['FINAL'][i]['SPECIFICATION']).length > 0
                      ? databuff[0]['FINAL'][i]['SPECIFICATION'][0]['value'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATION'][0]['value']
                              .toString()
                          : ''
                      : ''
                  : '',
              SPECIFICATIONstr: databuff[0]['FINAL'][i]['SPECIFICATION'] != null
                  ? (databuff[0]['FINAL'][i]['SPECIFICATION']).length > 0
                      ? databuff[0]['FINAL'][i]['SPECIFICATION'][0]['name'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATION'][0]['name']
                              .toString()
                          : ''
                      : ''
                  : '',
              SPECIFICATIONve:
                  databuff[0]['FINAL'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : '',
              SPECIFICATIONcondition: databuff[0]['FINAL'][i]
                          ['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
                          String
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : databuff[0]['FINAL'][i]['SPECIFICATIONve']
                                  ['condition'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATIONve']
                                  ['condition']
                              .toString()
                          : '-'
                  : '-',
              SPECIFICATIONBTW_HI: databuff[0]['FINAL'][i]['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
                          String
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : databuff[0]['FINAL'][i]['SPECIFICATIONve']['BTW_HI'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATIONve']['BTW_HI']
                              .toString()
                          : '-'
                  : '-',
              SPECIFICATIONBTW_LOW: databuff[0]['FINAL'][i]
                          ['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
                          String
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : databuff[0]['FINAL'][i]['SPECIFICATIONve']['BTW_LOW'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATIONve']
                                  ['BTW_LOW']
                              .toString()
                          : '-'
                  : '-',
              SPECIFICATIONHIM_L: databuff[0]['FINAL'][i]['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
                          String
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : databuff[0]['FINAL'][i]['SPECIFICATIONve']['HIM_L'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATIONve']['HIM_L']
                              .toString()
                          : '-'
                  : '-',
              SPECIFICATIONLOL_H: databuff[0]['FINAL'][i]['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
                          String
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : databuff[0]['FINAL'][i]['SPECIFICATIONve']['LOL_H'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATIONve']['LOL_H']
                              .toString()
                          : '-'
                  : '-',
              SPECIFICATIONTARGET: databuff[0]['FINAL'][i]['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
                          String
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : databuff[0]['FINAL'][i]['SPECIFICATIONve']['TARGET'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATIONve']['TARGET']
                              .toString()
                          : '-'
                  : '-',
              SPECIFICATIONvename: findSPECIFICATIONconv(
                  databuff[0]['FINAL'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : ''),
              UNIT: databuff[0]['FINAL'][i]['UNIT'] != null
                  ? databuff[0]['FINAL'][i]['UNIT'].toString()
                  : '',
              UNITname: findUNITconv(databuff[0]['FINAL'][i]['UNIT'] != null
                  ? databuff[0]['FINAL'][i]['UNIT'].toString()
                  : ''),
              CONVERSE: databuff[0]['FINAL'][i]['CONVERSE'] != null
                  ? databuff[0]['FINAL'][i]['CONVERSE'].toString()
                  : '',
              CONVERSEname: findUNITconv(
                  databuff[0]['FINAL'][i]['CONVERSE'] != null
                      ? databuff[0]['FINAL'][i]['CONVERSE'].toString()
                      : ''),
              // POINTPCS: databuff[0]['FINAL'][i]['POINTPCS'] != null
              //     ? databuff[0]['FINAL'][i]['POINTPCS'].toString()
              //     : '',
              // POSITION: databuff[0]['FINAL'][i]['POSITION'] != null
              //     ? databuff[0]['FINAL'][i]['POSITION'].toString()
              //     : '',
              POINT: databuff[0]['FINAL'][i]['POINT'] != null
                  ? databuff[0]['FINAL'][i]['POINT'].toString()
                  : '',
              PCS: databuff[0]['FINAL'][i]['PCS'] != null
                  ? databuff[0]['FINAL'][i]['PCS'].toString()
                  : '',
              FREQUENCY: databuff[0]['FINAL'][i]['FREQUENCY'] != null
                  ? databuff[0]['FINAL'][i]['FREQUENCY'].toString()
                  : '',
              MODE: databuff[0]['FINAL'][i]['MODE'] != null
                  ? databuff[0]['FINAL'][i]['MODE'].toString()
                  : '',
              REMARK: databuff[0]['FINAL'][i]['REMARK'] != null
                  ? databuff[0]['FINAL'][i]['REMARK'].toString()
                  : '',
              LOAD: databuff[0]['FINAL'][i]['LOAD'] != null
                  ? databuff[0]['FINAL'][i]['LOAD'].toString()
                  : '',
            ),
          );
        }
      }
    }
    emit(output);
  }

  Future<void> _FINSPECTIONget_FLUSH(
      InspectionSTD toAdd, Emitter<InspectionSTD> emit) async {
    InspectionSTD output = InspectionSTD(
      INCOMMING: [],
      INPROCESS: [],
      FINAL: [],
    );
    emit(output);
  }
}

class InspectionSTD {
  InspectionSTD({
    this.status = '',
    this.MATCP = '',
    this.FG = '',
    this.CUSTOMER = '',
    this.PART = '',
    this.PARTNAME = '',
    this.MATERIAL = '',
    //-------------------------------
    required this.INCOMMING,
    required this.INPROCESS,
    required this.FINAL,
    //-------------------------------
    this.Pimg = '',
    this.CUST_FULLNM = '',
  });
  String status;
  String MATCP;
  String FG;
  String CUSTOMER;
  String PART;
  String PARTNAME;
  String MATERIAL;
  //-------------------------------
  List<speckSTD> INCOMMING;
  List<speckSTD> INPROCESS;
  List<speckSTD> FINAL;
  //-------------------------------
  String Pimg;
  String CUST_FULLNM;
}

class speckSTD {
  speckSTD({
    this.seq = '',
    this.TYPE = '',
    this.TYPEname = '',
    this.ITEMs = '',
    this.ITEMsname = '',
    this.RESULTFORMAT = '',
    this.GRAPHTYPE = '',
    this.INTERSECTION = '',
    this.DOCUMENT = '',
    this.SCMARK = '',
    this.METHOD = '',
    this.METHODname = '',
    this.INSTRUMENTS = '',
    this.SPECIFICATION = '',
    this.SPECIFICATIONstr = '',
    this.SPECIFICATIONve = '',
    this.SPECIFICATIONcondition = '',
    this.SPECIFICATIONBTW_LOW = '',
    this.SPECIFICATIONBTW_HI = '',
    this.SPECIFICATIONHIM_L = '',
    this.SPECIFICATIONLOL_H = '',
    this.SPECIFICATIONTARGET = '',
    this.SPECIFICATIONvename = '',
    this.UNIT = '',
    this.UNITname = '',
    this.CONVERSE = '',
    this.CONVERSEname = '',
    // this.POINTPCS = '',
    // this.POSITION = '',
    this.POINT = '',
    this.PCS = '',
    this.FREQUENCY = '',
    this.FREQUENCYname = '',
    this.MODE = '',
    this.REMARK = '',
    this.LOAD = '',
  });

  String seq;
  String TYPE;
  String TYPEname;
  String ITEMs;
  String ITEMsname;
  String RESULTFORMAT;
  String GRAPHTYPE;
  String INTERSECTION;
  String DOCUMENT;
  String SCMARK;
  String METHOD;
  String METHODname;
  String INSTRUMENTS;
  String SPECIFICATION;
  String SPECIFICATIONstr;
  String SPECIFICATIONve;
  String SPECIFICATIONcondition;
  String SPECIFICATIONBTW_LOW;
  String SPECIFICATIONBTW_HI;
  String SPECIFICATIONHIM_L;
  String SPECIFICATIONLOL_H;
  String SPECIFICATIONTARGET;
  String SPECIFICATIONvename;
  String UNIT;
  String UNITname;
  String CONVERSE;
  String CONVERSEname;
  // String POINTPCS;
  // String POSITION;
  String POINT;
  String PCS;
  String FREQUENCY;
  String FREQUENCYname;
  String MODE;
  String REMARK;
  String LOAD;
}

class BasicBodyData {
  BasicBodyData({
    this.NAME = '',
    this.masterID = '',
  });
  String NAME;
  String masterID;
}

jsonStringToMap(String data) {
  List<String> str = data
      .replaceAll("{", "")
      .replaceAll("}", "")
      .replaceAll("\"", "")
      .replaceAll("'", "")
      .split(",");
  Map<String, dynamic> result = {};
  for (int i = 0; i < str.length; i++) {
    List<String> s = str[i].split(":");
    result.putIfAbsent(s[0].trim(), () => s[1].trim());
  }
  return result;
}
