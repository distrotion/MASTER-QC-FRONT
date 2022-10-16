import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget/TABLE/11-PATTRENtable.dart';
import 'FINAL_INSpopup.dart';
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
                          INSPECTIONstdVAR.FINAL_seq = "";
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
