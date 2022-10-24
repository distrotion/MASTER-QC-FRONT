import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/05-1-FINSPECTIONget.dart';
import '../../bloc/BlocEvent/05-3-STEP-INSPECTIONquery.dart';
import '../../bloc/cubit/Rebuild.dart';
import '../../widget/TABLE/11-PATTRENtable.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';
import 'FINAL_INSpopup.dart';
import 'INSPECTIONstdVAR.dart';

class INSPECTIONstdMAIN extends StatefulWidget {
  INSPECTIONstdMAIN({
    super.key,
    this.DDstep,
  });
  DROPDOWN_INS_STEP1? DDstep;

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
    ScrollController controllerIN01 = ScrollController();
    ScrollController controllerIN02 = ScrollController();

    DROPDOWN_INS_STEP1 _DDstep = widget.DDstep ??
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
          CALCULATEdd: [],
          //
          METHODdd: [],
          SPECIFICATIONdd: [],
        );

    if (_DDstep.status == 'STEP1') {
      INSPECTIONstdVAR.List_FINAL_ITEMs = _DDstep.ITEMSdd;
    }
    if (_DDstep.status == 'STEP2') {
      INSPECTIONstdVAR.List_FINAL_METHOD = _DDstep.METHODdd;
      INSPECTIONstdVAR.List_FINAL_LOAD = _DDstep.LOADdd;
      INSPECTIONstdVAR.List_FINAL_GT = _DDstep.GTdd;
      INSPECTIONstdVAR.List_FINAL_UNIT = _DDstep.UNITdd;
      INSPECTIONstdVAR.List_FINAL_FREQUENCY = _DDstep.FREQUENCYdd;
      INSPECTIONstdVAR.List_FINAL_CORETYPE = _DDstep.COREdd;
      INSPECTIONstdVAR.FINAL_RESULTFORMATdata = _DDstep.RESULTFORMATdata;
      INSPECTIONstdVAR.List_FINAL_CALCULATE = _DDstep.CALCULATEdd;
    }

    if (_DDstep.status == 'GET_DOCUMENT') {
      INSPECTIONstdVAR.iscontrol = true;

      INSPECTIONstdVAR.FINAL_DOCUMENT = _DDstep.DOCUMENT;
      context.read<BlocPageRebuild>().rebuildPage();
    }

    if (_DDstep.status == 'GET_CALCULATE') {
      INSPECTIONstdVAR.FINAL_CAL_K1_N = _DDstep.F_K1_N;
      INSPECTIONstdVAR.FINAL_CAL_K2_N = _DDstep.F_K2_N;
      INSPECTIONstdVAR.FINAL_CAL_K3_N = _DDstep.F_K3_N;

      INSPECTIONstdVAR.FINAL_CAL_K1b = _DDstep.F_K1b_b;
      INSPECTIONstdVAR.FINAL_CAL_K2b = _DDstep.F_K2b_b;
      INSPECTIONstdVAR.FINAL_CAL_K3b = _DDstep.F_K3b_b;
      context.read<BlocPageRebuild>().rebuildPage();
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
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
                    width: 2500,
                  )
                ],
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
                          INSPECTIONstdVAR.FINAL_seq = "0";
                          INSPECTIONstdVAR.FINAL_ITEMs = "";
                          INSPECTIONstdVAR.FINAL_COREtype = "";
                          INSPECTIONstdVAR.FINAL_FORMULA = "";
                          INSPECTIONstdVAR.FINAL_SCMARK = "";
                          INSPECTIONstdVAR.FINAL_SCMARKtype = "";
                          INSPECTIONstdVAR.FINAL_DOCUMENT = "";
                          INSPECTIONstdVAR.FINAL_METHOD = "";
                          INSPECTIONstdVAR.FINAL_IMGreaddata = "";
                          INSPECTIONstdVAR.FINAL_IMGno = "";
                          INSPECTIONstdVAR.FINAL_LOAD = "";
                          INSPECTIONstdVAR.FINAL_GT = "";
                          INSPECTIONstdVAR.FINAL_SPECIFICATION = "";
                          INSPECTIONstdVAR.FINAL_SPECIFICATIONve = "";
                          INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB = veOB();
                          INSPECTIONstdVAR.FINAL_UNIT = "";
                          INSPECTIONstdVAR.FINAL_POINTPCS = "";
                          INSPECTIONstdVAR.FINAL_PCS = "";
                          INSPECTIONstdVAR.FINAL_FREQUENCY = "";
                          INSPECTIONstdVAR.FINAL_REMARK = "";
                          INSPECTIONstdVAR.FINAL_RESULTFORMATdata = "";
                          INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.condition =
                              "";

                          INSPECTIONstdVAR.FINAL_CAL_K1_N = "";
                          INSPECTIONstdVAR.FINAL_CAL_K2_N = "";
                          INSPECTIONstdVAR.FINAL_CAL_K3_N = "";
                          INSPECTIONstdVAR.FINAL_CAL_K1b = false;
                          INSPECTIONstdVAR.FINAL_CAL_K2b = false;
                          INSPECTIONstdVAR.FINAL_CAL_K3b = false;
                          if (INSPECTIONstdVAR.FINAL_POP) {
                            INSPECTIONstdVAR.FINAL_POP = false;
                          } else {
                            INSPECTIONstdVAR.FINAL_POP = true;
                          }

                          context
                              .read<INSPECTION_DDSTEP_Bloc>()
                              .add(INSPECTION_GET_STEP1());
                          // FINALPOPUP(context);
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
                              for (int i = 0; i < 3; i++) ...[
                                Container(
                                  constraints: BoxConstraints(minHeight: 100),
                                  child: PATTERNtable(
                                    BGColorMain: i.isEven
                                        ? Colors.grey.shade50
                                        : Colors.grey.shade200,
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
                  if (INSPECTIONstdVAR.FINAL_POP)
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
                                // InkWell(
                                //   onLongPress: () {
                                //     POPUPyn(context, (v) {
                                //       clear();
                                //     }, "CLEAR DATA", 120, 90);
                                //   },
                                //   child: Container(
                                //     height: 40,
                                //     color: Colors.red,
                                //     child: Center(
                                //       child: Text(
                                //         "CLEAR",
                                //         style: TextStyle(
                                //           color: Colors.white,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
                                          INSPECTIONstdVAR.FINAL_ITEMs != '',
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown:
                                          INSPECTIONstdVAR.List_FINAL_ITEMs,
                                      onChangeinside: (d, k) {
                                        print(d);
                                        INSPECTIONstdVAR.FINAL_ITEMs = d;
                                        context
                                            .read<INSPECTION_DDSTEP_Bloc>()
                                            .add(INSPECTION_GET_STEP2());
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
                                                  context
                                                      .read<
                                                          INSPECTION_DDSTEP_Bloc>()
                                                      .add(
                                                          INSPECTION_GET_CALCULATE());
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
                                                    INSPECTIONstdVAR.iscontrol =
                                                        input;
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
                                                    INSPECTIONstdVAR.iscontrol =
                                                        input;
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
                                                    INSPECTIONstdVAR.iscontrol =
                                                        input;
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
                                    WIDGETSCMARK: AdvanceDropDown(
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown:
                                          INSPECTIONstdVAR.List_FINAL_SCMARK,
                                      onChangeinside: (d, k) {
                                        INSPECTIONstdVAR.FINAL_SCMARK = d;
                                      },
                                      value: INSPECTIONstdVAR.FINAL_SCMARK,
                                      height: 40,
                                      width: 400,
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
                                        INSPECTIONstdVAR.iscontrol = input;
                                      },
                                      sValue: INSPECTIONstdVAR.FINAL_DOCUMENT,
                                      returnfunc: (String s) {
                                        INSPECTIONstdVAR.FINAL_DOCUMENT = s;
                                      },
                                    ),
                                    METHOD: "METHOD",
                                    WIDGETMETHOD: AdvanceDropDown(
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown:
                                          INSPECTIONstdVAR.List_FINAL_METHOD,
                                      onChangeinside: (d, k) {
                                        INSPECTIONstdVAR.FINAL_METHOD = d;

                                        context
                                            .read<INSPECTION_DDSTEP_Bloc>()
                                            .add(INSPECTION_GET_DOCUMENT());
                                      },
                                      value: INSPECTIONstdVAR.FINAL_METHOD,
                                      height: 40,
                                      width: 400,
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
                                        SizedBox(
                                          width: 200,
                                          child: AdvanceDropDown(
                                            imgpath:
                                                'assets/icons/icon-down_4@3x.png',
                                            listdropdown: [
                                              const MapEntry("", ""),
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
                                            isContr: INSPECTIONstdVAR.iscontrol,
                                            // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                            fnContr: (input) {
                                              INSPECTIONstdVAR.iscontrol =
                                                  input;
                                            },
                                            sValue: INSPECTIONstdVAR
                                                .FINAL_SPECIFICATIONveOB.BTW_HI,
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
                                            isContr: INSPECTIONstdVAR.iscontrol,
                                            // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                            fnContr: (input) {
                                              INSPECTIONstdVAR.iscontrol =
                                                  input;
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
                                            isContr: INSPECTIONstdVAR.iscontrol,
                                            // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                            fnContr: (input) {
                                              INSPECTIONstdVAR.iscontrol =
                                                  input;
                                            },
                                            sValue: INSPECTIONstdVAR
                                                .FINAL_SPECIFICATIONveOB.HIM_L,
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
                                            isContr: INSPECTIONstdVAR.iscontrol,
                                            // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                            fnContr: (input) {
                                              INSPECTIONstdVAR.iscontrol =
                                                  input;
                                            },
                                            sValue: INSPECTIONstdVAR
                                                .FINAL_SPECIFICATIONveOB.LOL_H,
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
                                            isContr: INSPECTIONstdVAR.iscontrol,
                                            // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                                            fnContr: (input) {
                                              INSPECTIONstdVAR.iscontrol =
                                                  input;
                                            },
                                            sValue: INSPECTIONstdVAR
                                                .FINAL_SPECIFICATIONveOB.TARGET,
                                            returnfunc: (String s) {
                                              INSPECTIONstdVAR
                                                  .FINAL_SPECIFICATIONveOB
                                                  .TARGET = s;
                                            },
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
                                      listdropdown:
                                          INSPECTIONstdVAR.List_FINAL_UNIT,
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
                                        INSPECTIONstdVAR.iscontrol = input;
                                      },
                                      sValue: INSPECTIONstdVAR.FINAL_POINTPCS,
                                      returnfunc: (String s) {
                                        INSPECTIONstdVAR.FINAL_POINTPCS = s;
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
                                        INSPECTIONstdVAR.iscontrol = input;
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
                                        INSPECTIONstdVAR.iscontrol = input;
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
                                      print(v);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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

  clear() {
    INSPECTIONstdVAR.iscontrol = true;
    //
    INSPECTIONstdVAR.FINAL_seq = "0";
    INSPECTIONstdVAR.FINAL_ITEMs = "";
    INSPECTIONstdVAR.FINAL_COREtype = "";
    INSPECTIONstdVAR.FINAL_FORMULA = "";
    INSPECTIONstdVAR.FINAL_SCMARK = "";
    INSPECTIONstdVAR.FINAL_SCMARKtype = "";
    INSPECTIONstdVAR.FINAL_DOCUMENT = "";
    INSPECTIONstdVAR.FINAL_METHOD = "";
    INSPECTIONstdVAR.FINAL_IMGreaddata = "";
    INSPECTIONstdVAR.FINAL_IMGno = "";
    INSPECTIONstdVAR.FINAL_LOAD = "";
    INSPECTIONstdVAR.FINAL_GT = "";
    INSPECTIONstdVAR.FINAL_SPECIFICATION = "";
    INSPECTIONstdVAR.FINAL_SPECIFICATIONve = "";
    INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB = veOB();
    INSPECTIONstdVAR.FINAL_UNIT = "";
    INSPECTIONstdVAR.FINAL_POINTPCS = "";
    INSPECTIONstdVAR.FINAL_PCS = "";
    INSPECTIONstdVAR.FINAL_FREQUENCY = "";
    INSPECTIONstdVAR.FINAL_REMARK = "";
    INSPECTIONstdVAR.FINAL_RESULTFORMATdata = "";
    INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.condition = "";

    INSPECTIONstdVAR.FINAL_CAL_K1_N = "";
    INSPECTIONstdVAR.FINAL_CAL_K2_N = "";
    INSPECTIONstdVAR.FINAL_CAL_K3_N = "";
    INSPECTIONstdVAR.FINAL_CAL_K1b = false;
    INSPECTIONstdVAR.FINAL_CAL_K2b = false;
    INSPECTIONstdVAR.FINAL_CAL_K3b = false;

    context.read<INSPECTION_DDSTEP_Bloc>().add(INSPECTION_GET_STEP1());
  }
}
