import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/TABLE/11-PATTRENtable.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import 'INSPECTIONstdVAR.dart';

class INSPECTIONstdMAIN extends StatelessWidget {
  const INSPECTIONstdMAIN({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController controllerIN = ScrollController();
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
                    width: 2200,
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
                          FINALPOPUP(context);
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
                    controller: controllerIN,
                    thumbVisibility: true,
                    interactive: true,
                    thickness: 10,
                    radius: Radius.circular(20),
                    child: SingleChildScrollView(
                      controller: controllerIN,
                      // keyboardDismissBehavior:
                      //     ScrollViewKeyboardDismissBehavior.manual,
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        // height: 40,
                        width: 2200,
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
                                  UNIT: "UNIT",
                                  POSITION: "POSITION",
                                  PCS: "PCS",
                                  FREQUENCY: "FREQUENCY",
                                  REMARK: "REMARK",
                                  ACTION: "ACTION",
                                  isACTION: false,
                                ),
                              ),
                              for (int i = 0; i < 2; i++) ...[
                                Container(
                                  constraints: BoxConstraints(
                                      maxHeight: 100, minHeight: 40),
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
                                    UNIT: "UNIT",
                                    POSITION: "POSITION",
                                    PCS: "PCS",
                                    FREQUENCY: "FREQUENCY",
                                    REMARK: "REMARK",
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
}

void FINALPOPUP(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: FINALCTION(),
      );
    },
  );
}

class FINALCTION extends StatefulWidget {
  const FINALCTION({super.key});

  @override
  State<FINALCTION> createState() => _FINALCTIONState();
}

class _FINALCTIONState extends State<FINALCTION> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        width: 450,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                top: 16, bottom: 16, start: 24, end: 24),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Text("FINAL PATTERN"),
                      Spacer(),
                      Container(
                        width: 100,
                        height: 30,
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            "CLEAR",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ComInputText(
                  nLimitedChar: 100,
                  sLabel: "SEQ",
                  height: 40,
                  width: 400,
                  isContr: INSPECTIONstdVAR.iscontrol,
                  isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                  fnContr: (input) {
                    setState(() {
                      INSPECTIONstdVAR.iscontrol = input;
                    });
                  },
                  sValue: INSPECTIONstdVAR.FINAL_seq,
                  returnfunc: (String s) {
                    INSPECTIONstdVAR.FINAL_seq = s;
                  },
                ),
                SizedBox(
                  height: 64,
                  width: 400,
                  child: AdvanceDropDown(
                    sLabel: "ITEMs",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: [const MapEntry("", "")],
                    onChangeinside: (d, k) {
                      setState(() {
                        INSPECTIONstdVAR.FINAL_ITEMs = d;
                      });
                    },
                    value: INSPECTIONstdVAR.FINAL_ITEMs,
                    height: 40,
                    width: 400,
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 400,
                  child: AdvanceDropDown(
                    sLabel: "CORStype",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: [const MapEntry("", "")],
                    onChangeinside: (d, k) {
                      setState(() {
                        INSPECTIONstdVAR.FINAL_CORStype = d;
                      });
                    },
                    value: INSPECTIONstdVAR.FINAL_CORStype,
                    height: 40,
                    width: 400,
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 400,
                  child: AdvanceDropDown(
                    sLabel: "FORMULA",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: [const MapEntry("", "")],
                    onChangeinside: (d, k) {
                      setState(() {
                        INSPECTIONstdVAR.FINAL_FORMULA = d;
                      });
                    },
                    value: INSPECTIONstdVAR.FINAL_FORMULA,
                    height: 40,
                    width: 400,
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 400,
                  child: AdvanceDropDown(
                    sLabel: "S.C.MARK",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: [const MapEntry("", "")],
                    onChangeinside: (d, k) {
                      setState(() {
                        INSPECTIONstdVAR.FINAL_SCMARK = d;
                      });
                    },
                    value: INSPECTIONstdVAR.FINAL_SCMARK,
                    height: 40,
                    width: 400,
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 400,
                  child: AdvanceDropDown(
                    sLabel: "SCMARKtype",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: [const MapEntry("", "")],
                    onChangeinside: (d, k) {
                      setState(() {
                        INSPECTIONstdVAR.FINAL_SCMARKtype = d;
                      });
                    },
                    value: INSPECTIONstdVAR.FINAL_SCMARKtype,
                    height: 40,
                    width: 400,
                  ),
                ),
                ComInputText(
                  nLimitedChar: 100,
                  sLabel: "DOCUMENT",
                  height: 40,
                  width: 400,
                  isContr: INSPECTIONstdVAR.iscontrol,
                  isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
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
                SizedBox(
                  height: 64,
                  width: 400,
                  child: AdvanceDropDown(
                    sLabel: "METHOD",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: [const MapEntry("", "")],
                    onChangeinside: (d, k) {
                      setState(() {
                        INSPECTIONstdVAR.FINAL_METHOD = d;
                      });
                    },
                    value: INSPECTIONstdVAR.FINAL_METHOD,
                    height: 40,
                    width: 400,
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 400,
                  child: AdvanceDropDown(
                    sLabel: "IMGreaddata",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: [const MapEntry("", "")],
                    onChangeinside: (d, k) {
                      setState(() {
                        INSPECTIONstdVAR.FINAL_IMGreaddata = d;
                      });
                    },
                    value: INSPECTIONstdVAR.FINAL_IMGreaddata,
                    height: 40,
                    width: 400,
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 400,
                  child: AdvanceDropDown(
                    sLabel: "IMGno",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: [const MapEntry("", "")],
                    onChangeinside: (d, k) {
                      setState(() {
                        INSPECTIONstdVAR.FINAL_IMGno = d;
                      });
                    },
                    value: INSPECTIONstdVAR.FINAL_IMGno,
                    height: 40,
                    width: 400,
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 400,
                  child: AdvanceDropDown(
                    sLabel: "LOAD",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: [const MapEntry("", "")],
                    onChangeinside: (d, k) {
                      setState(() {
                        INSPECTIONstdVAR.FINAL_LOAD = d;
                      });
                    },
                    value: INSPECTIONstdVAR.FINAL_LOAD,
                    height: 40,
                    width: 400,
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 400,
                  child: AdvanceDropDown(
                    sLabel: "GT",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: [const MapEntry("", "")],
                    onChangeinside: (d, k) {
                      setState(() {
                        INSPECTIONstdVAR.FINAL_GT = d;
                      });
                    },
                    value: INSPECTIONstdVAR.FINAL_GT,
                    height: 40,
                    width: 400,
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 400,
                  child: AdvanceDropDown(
                    sLabel: "SPEC",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: [const MapEntry("", "")],
                    onChangeinside: (d, k) {
                      setState(() {
                        INSPECTIONstdVAR.FINAL_SPECIFICATION = d;
                      });
                    },
                    value: INSPECTIONstdVAR.FINAL_SPECIFICATION,
                    height: 40,
                    width: 400,
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 400,
                  child: AdvanceDropDown(
                    sLabel: "SPECve",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: [const MapEntry("", "")],
                    onChangeinside: (d, k) {
                      setState(() {
                        INSPECTIONstdVAR.FINAL_SPECIFICATIONve = d;
                      });
                    },
                    value: INSPECTIONstdVAR.FINAL_SPECIFICATIONve,
                    height: 40,
                    width: 400,
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
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 10, bottom: 10, start: 30, end: 30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 64,
                          width: 200,
                          child: AdvanceDropDown(
                            sLabel: "condition",
                            imgpath: 'assets/icons/icon-down_4@3x.png',
                            listdropdown: [const MapEntry("", "")],
                            onChangeinside: (d, k) {
                              setState(() {
                                INSPECTIONstdVAR
                                    .FINAL_SPECIFICATIONveOB.condition = d;
                              });
                            },
                            value: INSPECTIONstdVAR
                                .FINAL_SPECIFICATIONveOB.condition,
                            height: 40,
                            width: 200,
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "BTW_HI",
                          height: 40,
                          width: 200,
                          isContr: INSPECTIONstdVAR.iscontrol,
                          // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                          fnContr: (input) {
                            setState(() {
                              INSPECTIONstdVAR.iscontrol = input;
                            });
                          },
                          sValue:
                              INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.BTW_HI,
                          returnfunc: (String s) {
                            INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.BTW_HI = s;
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
                            setState(() {
                              INSPECTIONstdVAR.iscontrol = input;
                            });
                          },
                          sValue:
                              INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.BTW_LOW,
                          returnfunc: (String s) {
                            INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.BTW_LOW =
                                s;
                          },
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "HIM_L",
                          height: 40,
                          width: 200,
                          isContr: INSPECTIONstdVAR.iscontrol,
                          // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                          fnContr: (input) {
                            setState(() {
                              INSPECTIONstdVAR.iscontrol = input;
                            });
                          },
                          sValue:
                              INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.HIM_L,
                          returnfunc: (String s) {
                            INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.HIM_L = s;
                          },
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "LOL_H",
                          height: 40,
                          width: 200,
                          isContr: INSPECTIONstdVAR.iscontrol,
                          // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                          fnContr: (input) {
                            setState(() {
                              INSPECTIONstdVAR.iscontrol = input;
                            });
                          },
                          sValue:
                              INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.LOL_H,
                          returnfunc: (String s) {
                            INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.LOL_H = s;
                          },
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "TARGET",
                          height: 40,
                          width: 200,
                          isContr: INSPECTIONstdVAR.iscontrol,
                          // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                          fnContr: (input) {
                            setState(() {
                              INSPECTIONstdVAR.iscontrol = input;
                            });
                          },
                          sValue:
                              INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.TARGET,
                          returnfunc: (String s) {
                            INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.TARGET = s;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 400,
                  child: AdvanceDropDown(
                    sLabel: "UNIT",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: [const MapEntry("", "")],
                    onChangeinside: (d, k) {
                      setState(() {
                        INSPECTIONstdVAR.FINAL_UNIT = d;
                      });
                    },
                    value: INSPECTIONstdVAR.FINAL_UNIT,
                    height: 40,
                    width: 400,
                  ),
                ),
                ComInputText(
                  nLimitedChar: 100,
                  sLabel: "POINT",
                  height: 40,
                  width: 400,
                  isContr: INSPECTIONstdVAR.iscontrol,
                  // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
                  fnContr: (input) {
                    setState(() {
                      INSPECTIONstdVAR.iscontrol = input;
                    });
                  },
                  sValue: INSPECTIONstdVAR.FINAL_POINTPCS,
                  returnfunc: (String s) {
                    INSPECTIONstdVAR.FINAL_POINTPCS = s;
                  },
                ),
                ComInputText(
                  nLimitedChar: 100,
                  sLabel: "PCS",
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
                SizedBox(
                  height: 64,
                  width: 400,
                  child: AdvanceDropDown(
                    sLabel: "FREQUENCY",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: [const MapEntry("", "")],
                    onChangeinside: (d, k) {
                      setState(() {
                        INSPECTIONstdVAR.FINAL_FREQUENCY = d;
                      });
                    },
                    value: INSPECTIONstdVAR.FINAL_FREQUENCY,
                    height: 40,
                    width: 400,
                  ),
                ),
                ComInputText(
                  nLimitedChar: 100,
                  sLabel: "REMARK",
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
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 200,
                    color: Colors.blue,
                    child: const Center(
                        child: Text(
                      "SAVE",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ));
  }
}
