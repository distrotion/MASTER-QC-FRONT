import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/05-1-FINSPECTIONget.dart';
import '../../bloc/BlocEvent/05-4-UPLOADSPEC.dart';
import '../../bloc/cubit/Rebuild.dart';
import '../../widget/TABLE/11-PATTRENtable.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import 'INSPECTIONstdFunction.dart';
import 'INSPECTIONstdVAR.dart';

late BuildContext INSPECTIONstdMAINcontext;

class INSPECTIONstdMAIN extends StatefulWidget {
  INSPECTIONstdMAIN({
    super.key,
    this.Mdata,
  });
  InspectionSTD? Mdata;

  @override
  State<INSPECTIONstdMAIN> createState() => _INSPECTIONstdMAINState();
}

class _INSPECTIONstdMAINState extends State<INSPECTIONstdMAIN> {
  @override
  void initState() {
    super.initState();

    context.read<FINSPECTIONget_Bloc>().add(FINSPECTIONget_MATCP());
  }

  @override
  Widget build(BuildContext context) {
    INSPECTIONstdMAINcontext = context;
    ScrollController controllerIN01 = ScrollController();
    ScrollController controllerIN02 = ScrollController();
    InspectionSTD _Mdata = widget.Mdata ??
        InspectionSTD(
          INCOMMING: [],
          INPROCESS: [],
          FINAL: [],
        );

    if (_Mdata.status == 'GET_ALL') {}

    int millis = 978296400000;
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(millis);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: 2500,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                // color: Colors.orange,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              height: 300,
              // width: 1000,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: Text(INSPECTIONstdVAR.CP),
                        ),
                        SizedBox(
                          height: 40,
                          child: Text(INSPECTIONstdVAR.FG),
                        ),
                        SizedBox(
                          height: 40,
                          child: Text(INSPECTIONstdVAR.CUSTOMER),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: Text(INSPECTIONstdVAR.PART),
                        ),
                        SizedBox(
                          height: 40,
                          child: Text(INSPECTIONstdVAR.PARTNAME),
                        ),
                        SizedBox(
                          height: 40,
                          child: Text(INSPECTIONstdVAR.MATERIAL),
                        ),
                        SizedBox(
                          height: 40,
                          child: Text(INSPECTIONstdVAR.CUST_FULLNM),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              // height: 300,
              // width: 1000,
              child: Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text("FINAL PATTERN"),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          INSPECTION_FINAL_GET_STEP1(INSPECTIONstdVAR.CP)
                              .then((dynamic result) {
                            // print(result);
                            clear();
                            if (result['ITEMs'] != null) {
                              if (result['ITEMs'].length > 0) {
                                for (int i = 0;
                                    i < result['ITEMs'].length;
                                    i++) {
                                  INSPECTIONstdVAR.List_FINAL_ITEMs.add(
                                      MapEntry(
                                          result['ITEMs'][i]['ITEMs']
                                              .toString(),
                                          result['ITEMs'][i]['masterID']
                                              .toString()));

                                  INSPECTIONstdVAR.List_FINAL_ITEMs_set.add(
                                      List_FINAL_ITEMs_set_Class(
                                    ITEMs: result['ITEMs'][i]['ITEMs'] != null
                                        ? result['ITEMs'][i]['ITEMs'].toString()
                                        : '',
                                    RESULTFORMAT: result['ITEMs'][i]
                                                ['RESULTFORMAT'] !=
                                            null
                                        ? result['ITEMs'][i]['RESULTFORMAT']
                                            .toString()
                                        : '',
                                    TYPE: result['ITEMs'][i]['TYPE'] != null
                                        ? result['ITEMs'][i]['TYPE'].toString()
                                        : '',
                                    GRAPHTYPE:
                                        result['ITEMs'][i]['GRAPHTYPE'] != null
                                            ? result['ITEMs'][i]['GRAPHTYPE']
                                                .toString()
                                            : '',
                                    INTERSECTION: result['ITEMs'][i]
                                                ['INTERSECTION'] !=
                                            null
                                        ? result['ITEMs'][i]['INTERSECTION']
                                            .toString()
                                        : '',
                                    masterID:
                                        result['ITEMs'][i]['masterID'] != null
                                            ? result['ITEMs'][i]['masterID']
                                                .toString()
                                            : '',
                                  ));
                                }
                              }
                            }

                            setState(() {
                              newdata();
                            });
                          });
                        },
                        child: Container(
                          color: Colors.blue,
                          height: 40,
                          width: 100,
                          child: Center(
                            child: Text(
                              "NEW",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Scrollbar(
                    controller: controllerIN01,
                    thumbVisibility: true,
                    interactive: true,
                    thickness: 10,
                    radius: Radius.circular(20),
                    child: SingleChildScrollView(
                      controller: controllerIN01,
                      // keyboardDismissBehavior:
                      //     ScrollViewKeyboardDismissBehavior.manual,
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        // height: 40,
                        width: 2500,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                                child: PATTERNtable(
                                  BGColorMain: Colors.grey.shade400,
                                  seq: "seq",
                                  ITEMs: "ITEMs",
                                  CORStype: "CORStype",
                                  FORMULA: "FORMULA",
                                  SCMARK: "SCMARK",
                                  SCMARKtype: "SCMARKtype",
                                  DOCUMENT: "DOCUMENT",
                                  METHOD: "METHOD",
                                  IMGreaddata: "IMGreaddata",
                                  IMGno: "IMGno",
                                  LOAD: "LOAD",
                                  GT: "GT",
                                  SPECIFICATIONve: "SPECIFICATIONve",
                                  CALCULATE: "CALCULATE",
                                  UNIT: "UNIT",
                                  CONVERSE: "CONVERSE",
                                  POSITION: "POSITION",
                                  PCS: "PCS",
                                  FREQUENCY: "FREQUENCY",
                                  REMARK: "REMARK",
                                  SWreport: "SWreport",
                                  ACTION: "ACTION",
                                  isACTION: false,
                                ),
                              ),
                              for (int i = 0; i < _Mdata.FINAL.length; i++) ...[
                                Container(
                                  constraints: BoxConstraints(minHeight: 100),
                                  child: PATTERNtable(
                                    BGColorMain: i.isEven
                                        ? Colors.grey.shade50
                                        : Colors.grey.shade200,
                                    seq: _Mdata.FINAL[i].seq,
                                    ITEMs: _Mdata.FINAL[i].ITEMsname,
                                    CORStype: "-",
                                    FORMULA: "-",
                                    SCMARK: _Mdata.FINAL[i].SCMARK,
                                    SCMARKtype: "-",
                                    DOCUMENT: _Mdata.FINAL[i].DOCUMENT,
                                    METHOD: _Mdata.FINAL[i].METHODname,
                                    IMGreaddata: "-",
                                    IMGno: "-",
                                    LOAD: _Mdata.FINAL[i].LOAD,
                                    GT: "-",
                                    SPECIFICATIONve:
                                        _Mdata.FINAL[i].SPECIFICATIONvename,
                                    CALCULATE: "-",
                                    UNIT: _Mdata.FINAL[i].UNITname,
                                    CONVERSE: _Mdata.FINAL[i].CONVERSEname,
                                    POSITION: _Mdata.FINAL[i].POINT,
                                    PCS: _Mdata.FINAL[i].PCS,
                                    FREQUENCY: _Mdata.FINAL[i].FREQUENCY,
                                    REMARK: _Mdata.FINAL[i].REMARK,
                                    SWreport: "-",
                                    ACTION: "ACTION",
                                    EditFN: (v) {
                                      //
                                      // print(_Mdata.FINAL[i].ITEMsname);

                                      clear();
                                      INSPECTIONstdVAR.FINAL_seq =
                                          _Mdata.FINAL[i].seq;
                                      //---------------------
                                      // INSPECTIONstdVAR.List_FINAL_ITEMs = [
                                      //   MapEntry("-", "-")
                                      // ];
                                      // INSPECTIONstdVAR.List_FINAL_ITEMs.add(
                                      //     MapEntry(_Mdata.FINAL[i].ITEMsname,
                                      //         _Mdata.FINAL[i].ITEMs));

                                      INSPECTION_FINAL_GET_STEP1(
                                              INSPECTIONstdVAR.CP)
                                          .then((dynamic result) {
                                        // print(result);

                                        if (result['ITEMs'] != null) {
                                          if (result['ITEMs'].length > 0) {
                                            for (int i = 0;
                                                i < result['ITEMs'].length;
                                                i++) {
                                              INSPECTIONstdVAR.List_FINAL_ITEMs
                                                  .add(MapEntry(
                                                      result['ITEMs'][i]
                                                              ['ITEMs']
                                                          .toString(),
                                                      result['ITEMs'][i]
                                                              ['masterID']
                                                          .toString()));

                                              INSPECTIONstdVAR
                                                      .List_FINAL_ITEMs_set
                                                  .add(
                                                      List_FINAL_ITEMs_set_Class(
                                                ITEMs: result['ITEMs'][i]
                                                            ['ITEMs'] !=
                                                        null
                                                    ? result['ITEMs'][i]
                                                            ['ITEMs']
                                                        .toString()
                                                    : '',
                                                RESULTFORMAT: result['ITEMs'][i]
                                                            ['RESULTFORMAT'] !=
                                                        null
                                                    ? result['ITEMs'][i]
                                                            ['RESULTFORMAT']
                                                        .toString()
                                                    : '',
                                                TYPE: result['ITEMs'][i]
                                                            ['TYPE'] !=
                                                        null
                                                    ? result['ITEMs'][i]['TYPE']
                                                        .toString()
                                                    : '',
                                                masterID: result['ITEMs'][i]
                                                            ['masterID'] !=
                                                        null
                                                    ? result['ITEMs'][i]
                                                            ['masterID']
                                                        .toString()
                                                    : '',
                                              ));
                                            }
                                          }
                                        }
                                        //
                                        INSPECTIONstdVAR.FINAL_ITEMs =
                                            _Mdata.FINAL[i].ITEMs;

                                        for (int j = 0;
                                            j <
                                                INSPECTIONstdVAR
                                                    .List_FINAL_ITEMs_set
                                                    .length;
                                            j++) {
                                          if (INSPECTIONstdVAR
                                                  .List_FINAL_ITEMs_set[j]
                                                  .masterID ==
                                              _Mdata.FINAL[i].ITEMs) {
                                            INSPECTIONstdVAR.FINAL_TYPE =
                                                INSPECTIONstdVAR
                                                    .List_FINAL_ITEMs_set[j]
                                                    .TYPE;
                                            INSPECTIONstdVAR
                                                    .FINAL_RESULTFORMAT =
                                                INSPECTIONstdVAR
                                                    .List_FINAL_ITEMs_set[j]
                                                    .RESULTFORMAT;
                                            break;
                                          }
                                        }

                                        if (_Mdata.FINAL[i].ITEMs != '-') {
                                          INSPECTION_FINAL_GET_STEP2(
                                                  _Mdata.FINAL[i].ITEMs)
                                              .then((dynamic result) {
                                            setState(() {
                                              INSPECTIONstdVAR
                                                      .FINAL_RESULTFORMATdata =
                                                  result['RESULTFORMATdata'] !=
                                                          null
                                                      ? result[
                                                              'RESULTFORMATdata']
                                                          .toString()
                                                      : '-';
                                              if (result['METHOD'] != null &&
                                                  result['METHOD'].length > 0) {
                                                for (int i = 0;
                                                    i < result['METHOD'].length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_METHOD
                                                      .add(MapEntry(
                                                          result['METHOD'][i]
                                                                  ['METHOD']
                                                              .toString(),
                                                          result['METHOD'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }

                                              if (result['LOAD'] != null &&
                                                  result['LOAD'].length > 0) {
                                                for (int i = 0;
                                                    i < result['LOAD'].length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_LOAD
                                                      .add(MapEntry(
                                                          result['LOAD'][i]
                                                                  ['LOAD']
                                                              .toString(),
                                                          result['LOAD'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }

                                              if (result['CORETYPE'] != null &&
                                                  result['CORETYPE'].length >
                                                      0) {
                                                for (int i = 0;
                                                    i <
                                                        result['CORETYPE']
                                                            .length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_CORETYPE
                                                      .add(MapEntry(
                                                          result['CORETYPE'][i]
                                                                  ['CORETYPE']
                                                              .toString(),
                                                          result['CORETYPE'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }
                                              if (result['GT'] != null &&
                                                  result['GT'].length > 0) {
                                                for (int i = 0;
                                                    i < result['GT'].length;
                                                    i++) {
                                                  INSPECTIONstdVAR.List_FINAL_GT
                                                      .add(MapEntry(
                                                          result['GT'][i]['GT']
                                                              .toString(),
                                                          result['GT'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }

                                              if (result['UNIT'] != null &&
                                                  result['UNIT'].length > 0) {
                                                for (int i = 0;
                                                    i < result['UNIT'].length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_UNIT
                                                      .add(MapEntry(
                                                          result['UNIT'][i]
                                                                  ['UNIT']
                                                              .toString(),
                                                          result['UNIT'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }

                                              if (result['UNIT'] != null &&
                                                  result['UNIT'].length > 0) {
                                                for (int i = 0;
                                                    i < result['UNIT'].length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_UNIT_CONVERST
                                                      .add(MapEntry(
                                                          result['UNIT'][i]
                                                                  ['UNIT']
                                                              .toString(),
                                                          result['UNIT'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }

                                              if (result['FREQUENCY'] != null &&
                                                  result['FREQUENCY'].length >
                                                      0) {
                                                for (int i = 0;
                                                    i <
                                                        result['FREQUENCY']
                                                            .length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_FREQUENCY
                                                      .add(MapEntry(
                                                          result['FREQUENCY'][i]
                                                                  ['FREQUENCY']
                                                              .toString(),
                                                          result['FREQUENCY'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }
                                              if (result['CALCULATE'] != null &&
                                                  result['CALCULATE'].length >
                                                      0) {
                                                for (int i = 0;
                                                    i <
                                                        result['CALCULATE']
                                                            .length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_CALCULATE
                                                      .add(MapEntry(
                                                          result['CALCULATE'][i]
                                                                  ['CALCULATE']
                                                              .toString(),
                                                          result['CALCULATE'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }

                                              if (result['SPECIFICATION'] !=
                                                      null &&
                                                  result['SPECIFICATION']
                                                          .length >
                                                      0) {
                                                for (int i = 0;
                                                    i <
                                                        result['SPECIFICATION']
                                                            .length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_SPECIFICATIONt
                                                      .add(MapEntry(
                                                          result['SPECIFICATION']
                                                                      [i][
                                                                  'SPECIFICATION']
                                                              .toString(),
                                                          result['SPECIFICATION']
                                                                      [i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }
                                            });

                                            INSPECTIONstdVAR.FINAL_COREtype =
                                                "-";
                                            INSPECTIONstdVAR.FINAL_FORMULA =
                                                "-";
                                            INSPECTIONstdVAR.FINAL_SCMARK =
                                                _Mdata.FINAL[i].SCMARK;
                                            INSPECTIONstdVAR.FINAL_SCMARKtype =
                                                "-";
                                            INSPECTIONstdVAR.FINAL_DOCUMENT =
                                                _Mdata.FINAL[i].DOCUMENT;

                                            if (_Mdata.FINAL[i].METHOD != '-') {
                                              // INSPECTIONstdVAR.List_FINAL_METHOD = [
                                              //   MapEntry("-", "-"),
                                              //   MapEntry(_Mdata.FINAL[i].METHODname,
                                              //       _Mdata.FINAL[i].METHOD)
                                              // ];

                                              INSPECTIONstdVAR.FINAL_METHOD =
                                                  _Mdata.FINAL[i].METHOD;
                                            }

                                            INSPECTIONstdVAR.FINAL_IMGreaddata =
                                                "-";
                                            INSPECTIONstdVAR.FINAL_IMGno = "-";

                                            INSPECTIONstdVAR.FINAL_LOAD =
                                                _Mdata.FINAL[i].LOAD;

                                            INSPECTIONstdVAR.FINAL_GT = "-";
                                            INSPECTIONstdVAR
                                                    .FINAL_SPECIFICATION =
                                                _Mdata.FINAL[i].SPECIFICATION;

                                            INSPECTIONstdVAR
                                                    .FINAL_SPECIFICATIONstr =
                                                _Mdata
                                                    .FINAL[i].SPECIFICATIONstr;

                                            INSPECTIONstdVAR
                                                .FINAL_SPECIFICATIONve = "-";
                                            INSPECTIONstdVAR
                                                    .FINAL_SPECIFICATIONveOB =
                                                veOB();

                                            // INSPECTIONstdVAR
                                            //         .FINAL_SPECIFICATIONveOB
                                            //         .condition =
                                            //     _Mdata.FINAL[i]
                                            //         .SPECIFICATIONcondition;

                                            INSPECTIONstdVAR
                                                    .FINAL_SPECIFICATIONveOB =
                                                veOB(
                                                    condition: _Mdata.FINAL[i]
                                                        .SPECIFICATIONcondition,
                                                    BTW_HI: _Mdata.FINAL[i]
                                                        .SPECIFICATIONBTW_HI,
                                                    BTW_LOW: _Mdata.FINAL[i]
                                                        .SPECIFICATIONBTW_LOW,
                                                    HIM_L: _Mdata.FINAL[i]
                                                        .SPECIFICATIONHIM_L,
                                                    LOL_H: _Mdata.FINAL[i]
                                                        .SPECIFICATIONLOL_H,
                                                    TARGET: _Mdata.FINAL[i]
                                                        .SPECIFICATIONTARGET);
                                            if (_Mdata.FINAL[i].UNIT != '-') {
                                              // INSPECTIONstdVAR.List_FINAL_UNIT = [
                                              //   MapEntry("-", "-"),
                                              //   MapEntry(_Mdata.FINAL[i].UNITname,
                                              //       _Mdata.FINAL[i].UNIT)
                                              // ];

                                              INSPECTIONstdVAR.FINAL_UNIT =
                                                  _Mdata.FINAL[i].UNIT;
                                            } else {
                                              INSPECTIONstdVAR.FINAL_UNIT = "-";
                                            }

                                            if (_Mdata.FINAL[i].CONVERSE !=
                                                '-') {
                                              // INSPECTIONstdVAR
                                              //     .List_FINAL_UNIT_CONVERST = [
                                              //   MapEntry("-", "-"),
                                              //   MapEntry(_Mdata.FINAL[i].CONVERSEname,
                                              //       _Mdata.FINAL[i].CONVERSE)
                                              // ];

                                              INSPECTIONstdVAR
                                                      .FINAL_UNIT_CONVERST =
                                                  _Mdata.FINAL[i].CONVERSE;
                                            } else {
                                              INSPECTIONstdVAR
                                                  .FINAL_UNIT_CONVERST = "-";
                                            }

                                            INSPECTIONstdVAR.FINAL_POINT = "-";
                                            INSPECTIONstdVAR.FINAL_POINT =
                                                _Mdata.FINAL[i].POINT;
                                            INSPECTIONstdVAR.FINAL_PCS =
                                                _Mdata.FINAL[i].PCS;
                                            // INSPECTIONstdVAR.FINAL_FREQUENCY =
                                            //     _Mdata.FINAL[i].FREQUENCY;

                                            if (_Mdata.FINAL[i].FREQUENCY !=
                                                '-') {
                                              // INSPECTIONstdVAR.List_FINAL_FREQUENCY =
                                              //     [
                                              //   MapEntry("-", "-"),
                                              //   MapEntry(_Mdata.FINAL[i].FREQUENCY,
                                              //       _Mdata.FINAL[i].FREQUENCY)
                                              // ];

                                              INSPECTIONstdVAR.FINAL_FREQUENCY =
                                                  _Mdata.FINAL[i].FREQUENCY;
                                            } else {
                                              INSPECTIONstdVAR.FINAL_FREQUENCY =
                                                  "-";
                                            }
                                            INSPECTIONstdVAR.FINAL_REMARK =
                                                _Mdata.FINAL[i].REMARK;
                                            INSPECTIONstdVAR
                                                    .FINAL_RESULTFORMATdata =
                                                _Mdata.FINAL[i].RESULTFORMAT;
                                            INSPECTIONstdVAR.FINAL_SWreport =
                                                "-";

                                            INSPECTIONstdVAR.FINAL_CALCULATE =
                                                "-";
                                            INSPECTIONstdVAR.FINAL_CAL_K1 = "-";
                                            INSPECTIONstdVAR.FINAL_CAL_K2 = "-";
                                            INSPECTIONstdVAR.FINAL_CAL_K3 = "-";

                                            INSPECTIONstdVAR.FINAL_CAL_K1_N =
                                                "-";
                                            INSPECTIONstdVAR.FINAL_CAL_K2_N =
                                                "-";
                                            INSPECTIONstdVAR.FINAL_CAL_K3_N =
                                                "-";
                                            INSPECTIONstdVAR.FINAL_CAL_K1b =
                                                false;
                                            INSPECTIONstdVAR.FINAL_CAL_K2b =
                                                false;
                                            INSPECTIONstdVAR.FINAL_CAL_K3b =
                                                false;
                                          });
                                        }

                                        if (INSPECTIONstdVAR.FINAL_POP) {
                                          setState(() {
                                            INSPECTIONstdVAR.FINAL_POP = false;
                                          });
                                        } else {
                                          setState(() {
                                            INSPECTIONstdVAR.FINAL_POP = true;
                                          });
                                        }
                                      });

                                      //
                                    },
                                    isACTION: true,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (INSPECTIONstdVAR.FINAL_POP) ...[
                    Scrollbar(
                      controller: controllerIN02,
                      thumbVisibility: true,
                      interactive: true,
                      thickness: 10,
                      radius: Radius.circular(20),
                      child: SingleChildScrollView(
                        controller: controllerIN02,
                        // keyboardDismissBehavior:
                        //     ScrollViewKeyboardDismissBehavior.manual,
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          // height: 40,
                          width: 2500,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onLongPress: () {
                                    clear();
                                    INSPECTION_FINAL_GET_STEP1(
                                            INSPECTIONstdVAR.CP)
                                        .then((dynamic result) {
                                      // print(result);

                                      if (result['ITEMs'] != null) {
                                        if (result['ITEMs'].length > 0) {
                                          for (int i = 0;
                                              i < result['ITEMs'].length;
                                              i++) {
                                            INSPECTIONstdVAR.List_FINAL_ITEMs
                                                .add(
                                              MapEntry(
                                                  result['ITEMs'][i]['ITEMs']
                                                      .toString(),
                                                  result['ITEMs'][i]['masterID']
                                                      .toString()),
                                            );
                                            INSPECTIONstdVAR
                                                    .List_FINAL_ITEMs_set
                                                .add(List_FINAL_ITEMs_set_Class(
                                              ITEMs: result['ITEMs'][i]
                                                          ['ITEMs'] !=
                                                      null
                                                  ? result['ITEMs'][i]['ITEMs']
                                                      .toString()
                                                  : '',
                                              RESULTFORMAT: result['ITEMs'][i]
                                                          ['RESULTFORMAT'] !=
                                                      null
                                                  ? result['ITEMs'][i]
                                                          ['RESULTFORMAT']
                                                      .toString()
                                                  : '',
                                              TYPE: result['ITEMs'][i]
                                                          ['TYPE'] !=
                                                      null
                                                  ? result['ITEMs'][i]['TYPE']
                                                      .toString()
                                                  : '',
                                              masterID: result['ITEMs'][i]
                                                          ['masterID'] !=
                                                      null
                                                  ? result['ITEMs'][i]
                                                          ['masterID']
                                                      .toString()
                                                  : '',
                                            ));
                                          }
                                        }
                                      }

                                      setState(() {});
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    color: Colors.red,
                                    child: Center(
                                      child: Text(
                                        "CLEAR",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: PATTERNtable(
                                    BGColorMain: Colors.grey.shade400,
                                    seq: "seq",
                                    ITEMs: "ITEMs",
                                    CORStype: "CORStype",
                                    FORMULA: "FORMULA",
                                    SCMARK: "SCMARK",
                                    SCMARKtype: "SCMARKtype",
                                    ShowSCMARKtype: false,
                                    DOCUMENT: "DOCUMENT",
                                    METHOD: "METHOD",
                                    IMGreaddata: "IMGreaddata",
                                    IMGno: "IMGno",
                                    LOAD: "LOAD",
                                    GT: "GT",
                                    SPECIFICATIONve: "SPECIFICATIONve",
                                    CALCULATE: "CALCULATE",
                                    UNIT: "UNIT",
                                    CONVERSE: "CONVERSE",
                                    POSITION: "POSITION",
                                    PCS: "PCS",
                                    FREQUENCY: "FREQUENCY",
                                    REMARK: "REMARK",
                                    SWreport: "SWreport",
                                    ACTION: "ACTION",
                                    isACTION: false,
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(minHeight: 80),
                                  child: PATTERNtable(
                                    BGColorMain: Colors.white,
                                    seq: INSPECTIONstdVAR.FINAL_seq,
                                    ITEMs: "ITEMs",
                                    WIDGETITEMs: AdvanceDropDown(
                                      isEnable:
                                          INSPECTIONstdVAR.FINAL_ITEMs != '-',
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown:
                                          INSPECTIONstdVAR.List_FINAL_ITEMs,
                                      onChangeinside: (d, k) {
                                        // print(d);
                                        INSPECTIONstdVAR.FINAL_ITEMs = d;
                                        for (var i = 0;
                                            i <
                                                INSPECTIONstdVAR
                                                    .List_FINAL_ITEMs_set
                                                    .length;
                                            i++) {
                                          if (INSPECTIONstdVAR
                                                  .List_FINAL_ITEMs_set[i]
                                                  .masterID ==
                                              d) {
                                            INSPECTIONstdVAR.FINAL_TYPE =
                                                INSPECTIONstdVAR
                                                    .List_FINAL_ITEMs_set[i]
                                                    .TYPE;
                                            INSPECTIONstdVAR
                                                    .FINAL_RESULTFORMAT =
                                                INSPECTIONstdVAR
                                                    .List_FINAL_ITEMs_set[i]
                                                    .RESULTFORMAT;
                                            break;
                                          }
                                        }

                                        if (d != '-') {
                                          INSPECTION_FINAL_GET_STEP2(d)
                                              .then((dynamic result) {
                                            // print(result);

                                            setState(() {
                                              INSPECTIONstdVAR
                                                      .FINAL_RESULTFORMATdata =
                                                  result['RESULTFORMATdata'] !=
                                                          null
                                                      ? result[
                                                              'RESULTFORMATdata']
                                                          .toString()
                                                      : '-';
                                              if (result['METHOD'] != null &&
                                                  result['METHOD'].length > 0) {
                                                for (int i = 0;
                                                    i < result['METHOD'].length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_METHOD
                                                      .add(MapEntry(
                                                          result['METHOD'][i]
                                                                  ['METHOD']
                                                              .toString(),
                                                          result['METHOD'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }

                                              if (result['LOAD'] != null &&
                                                  result['LOAD'].length > 0) {
                                                for (int i = 0;
                                                    i < result['LOAD'].length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_LOAD
                                                      .add(MapEntry(
                                                          result['LOAD'][i]
                                                                  ['LOAD']
                                                              .toString(),
                                                          result['LOAD'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }

                                              if (result['CORETYPE'] != null &&
                                                  result['CORETYPE'].length >
                                                      0) {
                                                for (int i = 0;
                                                    i <
                                                        result['CORETYPE']
                                                            .length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_CORETYPE
                                                      .add(MapEntry(
                                                          result['CORETYPE'][i]
                                                                  ['CORETYPE']
                                                              .toString(),
                                                          result['CORETYPE'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }
                                              if (result['GT'] != null &&
                                                  result['GT'].length > 0) {
                                                for (int i = 0;
                                                    i < result['GT'].length;
                                                    i++) {
                                                  INSPECTIONstdVAR.List_FINAL_GT
                                                      .add(MapEntry(
                                                          result['GT'][i]['GT']
                                                              .toString(),
                                                          result['GT'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }

                                              if (result['UNIT'] != null &&
                                                  result['UNIT'].length > 0) {
                                                for (int i = 0;
                                                    i < result['UNIT'].length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_UNIT
                                                      .add(MapEntry(
                                                          result['UNIT'][i]
                                                                  ['UNIT']
                                                              .toString(),
                                                          result['UNIT'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }

                                              if (result['UNIT'] != null &&
                                                  result['UNIT'].length > 0) {
                                                for (int i = 0;
                                                    i < result['UNIT'].length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_UNIT_CONVERST
                                                      .add(MapEntry(
                                                          result['UNIT'][i]
                                                                  ['UNIT']
                                                              .toString(),
                                                          result['UNIT'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }

                                              if (result['FREQUENCY'] != null &&
                                                  result['FREQUENCY'].length >
                                                      0) {
                                                for (int i = 0;
                                                    i <
                                                        result['FREQUENCY']
                                                            .length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_FREQUENCY
                                                      .add(MapEntry(
                                                          result['FREQUENCY'][i]
                                                                  ['FREQUENCY']
                                                              .toString(),
                                                          result['FREQUENCY'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }
                                              if (result['CALCULATE'] != null &&
                                                  result['CALCULATE'].length >
                                                      0) {
                                                for (int i = 0;
                                                    i <
                                                        result['CALCULATE']
                                                            .length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_CALCULATE
                                                      .add(MapEntry(
                                                          result['CALCULATE'][i]
                                                                  ['CALCULATE']
                                                              .toString(),
                                                          result['CALCULATE'][i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }
                                              if (result['SPECIFICATION'] !=
                                                      null &&
                                                  result['SPECIFICATION']
                                                          .length >
                                                      0) {
                                                for (int i = 0;
                                                    i <
                                                        result['SPECIFICATION']
                                                            .length;
                                                    i++) {
                                                  INSPECTIONstdVAR
                                                          .List_FINAL_SPECIFICATIONt
                                                      .add(MapEntry(
                                                          result['SPECIFICATION']
                                                                      [i][
                                                                  'SPECIFICATION']
                                                              .toString(),
                                                          result['SPECIFICATION']
                                                                      [i]
                                                                  ['masterID']
                                                              .toString()));
                                                }
                                              }
                                            });
                                          });
                                        }
                                      },
                                      value: INSPECTIONstdVAR.FINAL_ITEMs,
                                      height: 40,
                                      width: 400,
                                    ),
                                    CORStype: "CORStype",
                                    WIDGETCORStype: AdvanceDropDown(
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown:
                                          INSPECTIONstdVAR.List_FINAL_CORETYPE,
                                      onChangeinside: (d, k) {
                                        INSPECTIONstdVAR.FINAL_COREtype = d;
                                      },
                                      value: INSPECTIONstdVAR.FINAL_COREtype,
                                      height: 40,
                                      width: 400,
                                    ),
                                    FORMULA: "NO USE",
                                    //                   if (INSPECTIONstdVAR.FINAL_RESULTFORMATdata ==
                                    //  'Calculate')
                                    WIDGETFORMULA: INSPECTIONstdVAR
                                                .FINAL_RESULTFORMATdata ==
                                            'Calculate'
                                        ? Column(
                                            children: [
                                              AdvanceDropDown(
                                                imgpath:
                                                    'assets/icons/icon-down_4@3x.png',
                                                listdropdown: INSPECTIONstdVAR
                                                    .List_FINAL_CALCULATE,
                                                onChangeinside: (d, k) {
                                                  INSPECTIONstdVAR
                                                      .FINAL_CALCULATE = d;
                                                },
                                                value: INSPECTIONstdVAR
                                                    .FINAL_CALCULATE,
                                                height: 40,
                                                width: 400,
                                              ),
                                              if (INSPECTIONstdVAR
                                                  .FINAL_CAL_K1b)
                                                ComInputText(
                                                  nLimitedChar: 100,
                                                  sLabel: INSPECTIONstdVAR
                                                      .FINAL_CAL_K1_N,

                                                  height: 40,
                                                  width: 200,
                                                  isContr: INSPECTIONstdVAR
                                                      .iscontrol,
                                                  // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                                  fnContr: (input) {
                                                    setState(() {
                                                      INSPECTIONstdVAR
                                                          .iscontrol = input;
                                                    });
                                                  },
                                                  sValue: INSPECTIONstdVAR
                                                      .FINAL_CAL_K1,
                                                  returnfunc: (String s) {
                                                    INSPECTIONstdVAR
                                                        .FINAL_CAL_K1 = s;
                                                  },
                                                ),
                                              if (INSPECTIONstdVAR
                                                  .FINAL_CAL_K2b)
                                                ComInputText(
                                                  nLimitedChar: 100,
                                                  sLabel: INSPECTIONstdVAR
                                                      .FINAL_CAL_K2_N,
                                                  height: 40,
                                                  width: 200,
                                                  isContr: INSPECTIONstdVAR
                                                      .iscontrol,
                                                  // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                                  fnContr: (input) {
                                                    setState(() {
                                                      INSPECTIONstdVAR
                                                          .iscontrol = input;
                                                    });
                                                  },
                                                  sValue: INSPECTIONstdVAR
                                                      .FINAL_CAL_K2,
                                                  returnfunc: (String s) {
                                                    INSPECTIONstdVAR
                                                        .FINAL_CAL_K2 = s;
                                                  },
                                                ),
                                              if (INSPECTIONstdVAR
                                                  .FINAL_CAL_K3b)
                                                ComInputText(
                                                  nLimitedChar: 100,
                                                  sLabel: INSPECTIONstdVAR
                                                      .FINAL_CAL_K3_N,
                                                  height: 40,
                                                  width: 200,
                                                  isContr: INSPECTIONstdVAR
                                                      .iscontrol,
                                                  // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                                  fnContr: (input) {
                                                    setState(() {
                                                      INSPECTIONstdVAR
                                                          .iscontrol = input;
                                                    });
                                                  },
                                                  sValue: INSPECTIONstdVAR
                                                      .FINAL_CAL_K3,
                                                  returnfunc: (String s) {
                                                    INSPECTIONstdVAR
                                                        .FINAL_CAL_K3 = s;
                                                  },
                                                ),
                                            ],
                                          )
                                        : null,
                                    SCMARK: "SCMARK",
                                    WIDGETSCMARK: Column(
                                      children: [
                                        AdvanceDropDown(
                                          imgpath:
                                              'assets/icons/icon-down_4@3x.png',
                                          listdropdown: INSPECTIONstdVAR
                                              .List_FINAL_SCMARK,
                                          onChangeinside: (d, k) {
                                            setState(() {
                                              INSPECTIONstdVAR.FINAL_SCMARK = d;
                                            });
                                          },
                                          value: INSPECTIONstdVAR.FINAL_SCMARK,
                                          height: 40,
                                          width: 400,
                                        ),
                                        if (INSPECTIONstdVAR.FINAL_SCMARK ==
                                            'YES')
                                          AdvanceDropDown(
                                            imgpath:
                                                'assets/icons/icon-down_4@3x.png',
                                            listdropdown: [
                                              MapEntry("-", "-"),
                                              MapEntry("1", "1"),
                                              MapEntry("2", "2")
                                            ],
                                            onChangeinside: (d, k) {
                                              INSPECTIONstdVAR
                                                  .FINAL_SCMARKtype = d;
                                            },
                                            value: INSPECTIONstdVAR
                                                .FINAL_SCMARKtype,
                                            height: 40,
                                            width: 400,
                                          ),
                                      ],
                                    ),
                                    SCMARKtype: "SCMARKtype",
                                    ShowSCMARKtype: false,
                                    DOCUMENT: "DOCUMENT",
                                    WIDGETDOCUMENT: ComInputText(
                                      nLimitedChar: 100,
                                      height: 40,
                                      width: 400,
                                      isContr: INSPECTIONstdVAR.iscontrol,
                                      isEnabled:
                                          INSPECTIONstdVAR.ACTION_isEnabled,
                                      fnContr: (input) {
                                        setState(() {
                                          INSPECTIONstdVAR.iscontrol = input;
                                        });
                                      },
                                      sValue: INSPECTIONstdVAR.FINAL_DOCUMENT,
                                      returnfunc: (String s) {
                                        INSPECTIONstdVAR.FINAL_DOCUMENT = s;
                                      },
                                    ),
                                    METHOD: "METHOD",
                                    WIDGETMETHOD: Column(
                                      children: [
                                        AdvanceDropDown(
                                          imgpath:
                                              'assets/icons/icon-down_4@3x.png',
                                          listdropdown: INSPECTIONstdVAR
                                              .List_FINAL_METHOD,
                                          onChangeinside: (d, k) {
                                            INSPECTIONstdVAR.FINAL_METHOD = d;
                                          },
                                          value: INSPECTIONstdVAR.FINAL_METHOD,
                                          height: 40,
                                          width: 400,
                                        ),
                                        if (INSPECTIONstdVAR
                                                    .FINAL_RESULTFORMATdata ==
                                                'Picture' ||
                                            INSPECTIONstdVAR
                                                    .FINAL_RESULTFORMATdata ==
                                                'OCR') ...[
                                          AdvanceDropDown(
                                            imgpath:
                                                'assets/icons/icon-down_4@3x.png',
                                            listdropdown: INSPECTIONstdVAR
                                                .List_FINAL_IMGreaddata,
                                            onChangeinside: (d, k) {
                                              INSPECTIONstdVAR
                                                  .FINAL_IMGreaddata = d;
                                            },
                                            value: INSPECTIONstdVAR
                                                .FINAL_IMGreaddata,
                                            height: 40,
                                            width: 400,
                                          ),
                                          AdvanceDropDown(
                                            imgpath:
                                                'assets/icons/icon-down_4@3x.png',
                                            listdropdown: INSPECTIONstdVAR
                                                .List_FINAL_IMGno,
                                            onChangeinside: (d, k) {
                                              INSPECTIONstdVAR.FINAL_IMGno = d;
                                            },
                                            value: INSPECTIONstdVAR.FINAL_IMGno,
                                            height: 40,
                                            width: 400,
                                          )
                                        ],
                                      ],
                                    ),
                                    IMGreaddata: "IMGreaddata",
                                    WIDGETIMGreaddata: AdvanceDropDown(
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown: INSPECTIONstdVAR
                                          .List_FINAL_IMGreaddata,
                                      onChangeinside: (d, k) {
                                        INSPECTIONstdVAR.FINAL_IMGreaddata = d;
                                      },
                                      value: INSPECTIONstdVAR.FINAL_IMGreaddata,
                                      height: 40,
                                      width: 400,
                                    ),
                                    IMGno: "IMGno",
                                    WIDGETIMGno: AdvanceDropDown(
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown:
                                          INSPECTIONstdVAR.List_FINAL_IMGno,
                                      onChangeinside: (d, k) {
                                        INSPECTIONstdVAR.FINAL_IMGno = d;
                                      },
                                      value: INSPECTIONstdVAR.FINAL_IMGno,
                                      height: 40,
                                      width: 400,
                                    ),
                                    LOAD: "LOAD",
                                    WIDGETLOAD: AdvanceDropDown(
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown:
                                          INSPECTIONstdVAR.List_FINAL_LOAD,
                                      onChangeinside: (d, k) {
                                        INSPECTIONstdVAR.FINAL_LOAD = d;
                                      },
                                      value: INSPECTIONstdVAR.FINAL_LOAD,
                                      height: 40,
                                      width: 400,
                                    ),
                                    GT: "GT",
                                    WIDGETGT: AdvanceDropDown(
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown:
                                          INSPECTIONstdVAR.List_FINAL_GT,
                                      onChangeinside: (d, k) {
                                        INSPECTIONstdVAR.FINAL_GT = d;
                                      },
                                      value: INSPECTIONstdVAR.FINAL_GT,
                                      height: 40,
                                      width: 400,
                                    ),
                                    CALCULATE: "CALCULATE",
                                    SPECIFICATIONve: "SPECIFICATIONve",
                                    WIDGETSPECIFICATIONve: Column(
                                      children: [
                                        if (INSPECTIONstdVAR
                                                    .FINAL_RESULTFORMAT !=
                                                'Text' &&
                                            INSPECTIONstdVAR
                                                    .FINAL_RESULTFORMAT !=
                                                'Picture') ...[
                                          SizedBox(
                                            width: 200,
                                            child: AdvanceDropDown(
                                              imgpath:
                                                  'assets/icons/icon-down_4@3x.png',
                                              listdropdown: [
                                                const MapEntry("-", "-"),
                                                const MapEntry("BTW", "BTW"),
                                                const MapEntry(
                                                    "LOL(<)", "LOL(<)"),
                                                const MapEntry(
                                                    "HIM(>)", "HIM(>)"),
                                                const MapEntry(
                                                    "Actual", "Actual"),
                                              ],
                                              onChangeinside: (d, k) {
                                                INSPECTIONstdVAR
                                                    .FINAL_SPECIFICATIONveOB
                                                    .condition = d;
                                                context
                                                    .read<BlocPageRebuild>()
                                                    .rebuildPage();
                                              },
                                              value: INSPECTIONstdVAR
                                                  .FINAL_SPECIFICATIONveOB
                                                  .condition,
                                              height: 40,
                                              width: 200,
                                            ),
                                          ),
                                          if (INSPECTIONstdVAR
                                                  .FINAL_SPECIFICATIONveOB
                                                  .condition ==
                                              'BTW') ...[
                                            ComInputText(
                                              nLimitedChar: 100,
                                              sLabel: "BTW_HI",
                                              height: 40,
                                              width: 200,
                                              isContr:
                                                  INSPECTIONstdVAR.iscontrol,
                                              // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                              fnContr: (input) {
                                                setState(() {
                                                  INSPECTIONstdVAR.iscontrol =
                                                      input;
                                                });
                                              },
                                              sValue: INSPECTIONstdVAR
                                                  .FINAL_SPECIFICATIONveOB
                                                  .BTW_HI,
                                              returnfunc: (String s) {
                                                INSPECTIONstdVAR
                                                    .FINAL_SPECIFICATIONveOB
                                                    .BTW_HI = s;
                                              },
                                            ),
                                            ComInputText(
                                              nLimitedChar: 100,
                                              sLabel: "BTW_LOW",
                                              height: 40,
                                              width: 200,
                                              isContr:
                                                  INSPECTIONstdVAR.iscontrol,
                                              // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                              fnContr: (input) {
                                                setState(() {
                                                  INSPECTIONstdVAR.iscontrol =
                                                      input;
                                                });
                                              },
                                              sValue: INSPECTIONstdVAR
                                                  .FINAL_SPECIFICATIONveOB
                                                  .BTW_LOW,
                                              returnfunc: (String s) {
                                                INSPECTIONstdVAR
                                                    .FINAL_SPECIFICATIONveOB
                                                    .BTW_LOW = s;
                                              },
                                            ),
                                          ],
                                          if (INSPECTIONstdVAR
                                                  .FINAL_SPECIFICATIONveOB
                                                  .condition ==
                                              'HIM(>)') ...[
                                            ComInputText(
                                              nLimitedChar: 100,
                                              sLabel: "HIM_L",
                                              height: 40,
                                              width: 200,
                                              isContr:
                                                  INSPECTIONstdVAR.iscontrol,
                                              // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                              fnContr: (input) {
                                                setState(() {
                                                  INSPECTIONstdVAR.iscontrol =
                                                      input;
                                                });
                                              },
                                              sValue: INSPECTIONstdVAR
                                                  .FINAL_SPECIFICATIONveOB
                                                  .HIM_L,
                                              returnfunc: (String s) {
                                                INSPECTIONstdVAR
                                                    .FINAL_SPECIFICATIONveOB
                                                    .HIM_L = s;
                                              },
                                            ),
                                          ],
                                          if (INSPECTIONstdVAR
                                                  .FINAL_SPECIFICATIONveOB
                                                  .condition ==
                                              'LOL(<)') ...[
                                            ComInputText(
                                              nLimitedChar: 100,
                                              sLabel: "LOL_H",
                                              height: 40,
                                              width: 200,
                                              isContr:
                                                  INSPECTIONstdVAR.iscontrol,
                                              // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                              fnContr: (input) {
                                                setState(() {
                                                  INSPECTIONstdVAR.iscontrol =
                                                      input;
                                                });
                                              },
                                              sValue: INSPECTIONstdVAR
                                                  .FINAL_SPECIFICATIONveOB
                                                  .LOL_H,
                                              returnfunc: (String s) {
                                                INSPECTIONstdVAR
                                                    .FINAL_SPECIFICATIONveOB
                                                    .LOL_H = s;
                                              },
                                            ),
                                          ],
                                          if (INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.condition == 'HIM(>)' ||
                                              INSPECTIONstdVAR
                                                      .FINAL_SPECIFICATIONveOB
                                                      .condition ==
                                                  'LOL(<)' ||
                                              INSPECTIONstdVAR
                                                      .FINAL_SPECIFICATIONveOB
                                                      .condition ==
                                                  'BTW') ...[
                                            ComInputText(
                                              nLimitedChar: 100,
                                              sLabel: "TARGET",
                                              height: 40,
                                              width: 200,
                                              isContr:
                                                  INSPECTIONstdVAR.iscontrol,
                                              // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                              fnContr: (input) {
                                                setState(() {
                                                  INSPECTIONstdVAR.iscontrol =
                                                      input;
                                                });
                                              },
                                              sValue: INSPECTIONstdVAR
                                                  .FINAL_SPECIFICATIONveOB
                                                  .TARGET,
                                              returnfunc: (String s) {
                                                INSPECTIONstdVAR
                                                    .FINAL_SPECIFICATIONveOB
                                                    .TARGET = s;
                                              },
                                            ),
                                          ],
                                        ] else ...[
                                          SizedBox(
                                            width: 200,
                                            child: AdvanceDropDown(
                                              imgpath:
                                                  'assets/icons/icon-down_4@3x.png',
                                              listdropdown: INSPECTIONstdVAR
                                                  .List_FINAL_SPECIFICATIONt,
                                              onChangeinside: (d, k) {
                                                INSPECTIONstdVAR
                                                    .FINAL_SPECIFICATION = d;
                                                INSPECTIONstdVAR
                                                    .FINAL_SPECIFICATIONstr = k;
                                              },
                                              value: INSPECTIONstdVAR
                                                  .FINAL_SPECIFICATION,
                                              height: 40,
                                              width: 200,
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                    UNIT: "UNIT",
                                    WIDGETUNIT: AdvanceDropDown(
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown:
                                          INSPECTIONstdVAR.List_FINAL_UNIT,
                                      onChangeinside: (d, k) {
                                        INSPECTIONstdVAR.FINAL_UNIT = d;
                                      },
                                      value: INSPECTIONstdVAR.FINAL_UNIT,
                                      height: 40,
                                      width: 400,
                                    ),
                                    CONVERSE: "CONVERSE",
                                    WIDGETCONVERSE: AdvanceDropDown(
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown: INSPECTIONstdVAR
                                          .List_FINAL_UNIT_CONVERST,
                                      onChangeinside: (d, k) {
                                        INSPECTIONstdVAR.FINAL_UNIT_CONVERST =
                                            d;
                                      },
                                      value:
                                          INSPECTIONstdVAR.FINAL_UNIT_CONVERST,
                                      height: 40,
                                      width: 400,
                                    ),
                                    POSITION: "POSITION",
                                    WIDGETPOSITION: ComInputText(
                                      nLimitedChar: 100,

                                      height: 40,
                                      width: 400,
                                      isContr: INSPECTIONstdVAR.iscontrol,
                                      // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                      fnContr: (input) {
                                        print(input);
                                        setState(() {
                                          setState(() {
                                            INSPECTIONstdVAR.iscontrol = input;
                                          });
                                        });
                                      },
                                      sValue: INSPECTIONstdVAR.FINAL_POINT,
                                      returnfunc: (String s) {
                                        INSPECTIONstdVAR.FINAL_POINT = s;
                                      },
                                    ),
                                    PCS: "PCS",
                                    WIDGETPCS: ComInputText(
                                      nLimitedChar: 100,

                                      height: 40,
                                      width: 400,
                                      isContr: INSPECTIONstdVAR.iscontrol,
                                      // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                      fnContr: (input) {
                                        setState(() {
                                          INSPECTIONstdVAR.iscontrol = input;
                                        });
                                      },
                                      sValue: INSPECTIONstdVAR.FINAL_PCS,
                                      returnfunc: (String s) {
                                        INSPECTIONstdVAR.FINAL_PCS = s;
                                      },
                                    ),
                                    FREQUENCY: "FREQUENCY",
                                    WIDGETFREQUENCY: AdvanceDropDown(
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown:
                                          INSPECTIONstdVAR.List_FINAL_FREQUENCY,
                                      onChangeinside: (d, k) {
                                        INSPECTIONstdVAR.FINAL_FREQUENCY = d;
                                      },
                                      value: INSPECTIONstdVAR.FINAL_FREQUENCY,
                                      height: 40,
                                      width: 400,
                                    ),
                                    REMARK: "REMARK",
                                    WIDGETREMARK: ComInputText(
                                      nLimitedChar: 100,

                                      height: 40,
                                      width: 400,
                                      isContr: INSPECTIONstdVAR.iscontrol,
                                      // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                      fnContr: (input) {
                                        setState(() {
                                          INSPECTIONstdVAR.iscontrol = input;
                                        });
                                      },
                                      sValue: INSPECTIONstdVAR.FINAL_REMARK,
                                      returnfunc: (String s) {
                                        INSPECTIONstdVAR.FINAL_REMARK = s;
                                      },
                                    ),
                                    SWreport: "SWreport",
                                    WIDGETSWreport: AdvanceDropDown(
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown:
                                          INSPECTIONstdVAR.List_FINAL_SWreport,
                                      onChangeinside: (d, k) {
                                        INSPECTIONstdVAR.FINAL_SWreport = d;
                                      },
                                      value: INSPECTIONstdVAR.FINAL_SWreport,
                                      height: 40,
                                      width: 400,
                                    ),
                                    ACTION: "ACTION",
                                    isACTION: true,
                                    ACTIONMODE: 1,
                                    SAVEFN: (v) {
                                      print(
                                          INSPECTIONstdVAR.FINAL_RESULTFORMAT);
                                      if (INSPECTIONstdVAR.FINAL_RESULTFORMAT ==
                                              'Text' ||
                                          INSPECTIONstdVAR.FINAL_RESULTFORMAT ==
                                              'Picture') {
                                        context
                                            .read<UPLOADSPEC_Bloc>()
                                            .add(UPLOADSPEC_FINAL_TEXT());
                                      } else if (INSPECTIONstdVAR
                                                  .FINAL_RESULTFORMAT ==
                                              'OCR' ||
                                          INSPECTIONstdVAR.FINAL_RESULTFORMAT ==
                                              'Number' ||
                                          INSPECTIONstdVAR.FINAL_RESULTFORMAT ==
                                              'Graph') {
                                        context
                                            .read<UPLOADSPEC_Bloc>()
                                            .add(UPLOADSPEC_FINAL_NUM());
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ] else ...[
                    // InkWell(
                    //   onTap: () {
                    //     newdata();
                    //   },
                    //   child: Container(
                    //     color: Colors.blue,
                    //     height: 40,
                    //     // width: 100,
                    //     child: Center(
                    //       child: Text(
                    //         "NEW",
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.orange,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              height: 300,
              // width: 1000,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    width: 2000,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  // FINALPOPUP(context);
}
