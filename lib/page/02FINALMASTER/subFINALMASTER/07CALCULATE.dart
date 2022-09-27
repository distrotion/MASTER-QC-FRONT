import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widget/TABLE/07CALCULATEtable.dart';
import '../../../widget/common/CheckboxC.dart';
import '../../../widget/common/ComInputText.dart';
import '../FINALMASTERvar.dart';

class CALCULATEtable extends StatelessWidget {
  const CALCULATEtable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              CALCULATEPOPUP(context);
            },
            child: Container(
              height: 30,
              width: 100,
              color: Colors.blue,
              child: const Center(
                  child: Text(
                "NEW",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: CALCULATEtableWidget(
            BGColorMain: Colors.grey.shade400,
            CALCULATEtext: "CAL NAME",
            FORMULAtext: " FORMULA",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
          ),
        ),
        for (int i = 1; i < 10; i++)
          SizedBox(
            height: 40,
            child: CALCULATEtableWidget(
              BGColorMain:
                  i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              CALCULATEtext: "NAME",
              FORMULAtext: "X*Y+Z*K",
              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {},
              EditFN: (v) {
                CALCULATEPOPUP(context);
              },
              masterIDtext: "masterID",
            ),
          )
      ],
    );
  }
}

void CALCULATEPOPUP(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: CALCULATEACTION(),
      );
    },
  );
}

class CALCULATEACTION extends StatefulWidget {
  const CALCULATEACTION({super.key});

  @override
  State<CALCULATEACTION> createState() => _CALCULATEACTIONState();
}

class _CALCULATEACTIONState extends State<CALCULATEACTION> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        width: 450,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                child: Center(
                  child: Text("CALCULATE"),
                ),
              ),
              ComInputText(
                sLabel: "CAL NAME",
                height: 40,
                width: 400,
                isContr: FINALMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    FINALMASTERvar.iscontrol = input;
                  });
                },
                sValue: FINALMASTERvar.CALCULATE_CALCULATE_ACTION,
                returnfunc: (String s) {
                  FINALMASTERvar.CALCULATE_CALCULATE_ACTION = s;
                },
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 40,
                              child: CheckBoxC(
                                getChbox: (v) {
                                  setState(() {
                                    FINALMASTERvar.Xb_CALCULATE_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.Xb_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          sLabel: "X NAME",
                          height: 40,
                          width: 300,
                          isContr: FINALMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              FINALMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: FINALMASTERvar.X_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.X_CALCULATE_ACTION = s;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 40,
                              child: CheckBoxC(
                                getChbox: (v) {
                                  setState(() {
                                    FINALMASTERvar.Yb_CALCULATE_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.Yb_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          sLabel: "Y NAME",
                          height: 40,
                          width: 300,
                          isContr: FINALMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              FINALMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: FINALMASTERvar.Y_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.Y_CALCULATE_ACTION = s;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 40,
                              child: CheckBoxC(
                                getChbox: (v) {
                                  setState(() {
                                    FINALMASTERvar.Zb_CALCULATE_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.Zb_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          sLabel: "Z NAME",
                          height: 40,
                          width: 300,
                          isContr: FINALMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              FINALMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: FINALMASTERvar.Z_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.Z_CALCULATE_ACTION = s;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 40,
                              child: CheckBoxC(
                                getChbox: (v) {
                                  setState(() {
                                    FINALMASTERvar.Ib_CALCULATE_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.Ib_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          sLabel: "I NAME",
                          height: 40,
                          width: 300,
                          isContr: FINALMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              FINALMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: FINALMASTERvar.I_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.I_CALCULATE_ACTION = s;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 40,
                              child: CheckBoxC(
                                getChbox: (v) {
                                  setState(() {
                                    FINALMASTERvar.K1b_CALCULATE_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.K1b_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          sLabel: "K1 NAME",
                          height: 40,
                          width: 300,
                          isContr: FINALMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              FINALMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: FINALMASTERvar.K1_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.K1_CALCULATE_ACTION = s;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 40,
                              child: CheckBoxC(
                                getChbox: (v) {
                                  setState(() {
                                    FINALMASTERvar.K2b_CALCULATE_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.K2b_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          sLabel: "K2 NAME",
                          height: 40,
                          width: 300,
                          isContr: FINALMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              FINALMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: FINALMASTERvar.K2_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.K2_CALCULATE_ACTION = s;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    )
                  ],
                ),
              ),
              ComInputText(
                sLabel: "FORMULA",
                height: 40,
                width: 400,
                isContr: FINALMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    FINALMASTERvar.iscontrol = input;
                  });
                },
                sValue: FINALMASTERvar.FORMULA_CALCULATE_ACTION,
                returnfunc: (String s) {
                  FINALMASTERvar.FORMULA_CALCULATE_ACTION = s;
                },
              ),
              ComInputText(
                sLabel: "masterID",
                height: 40,
                width: 400,
                isContr: FINALMASTERvar.iscontrol,
                isEnabled: FINALMASTERvar.masterID_ACTION_isEnabled,
                fnContr: (input) {
                  setState(() {
                    FINALMASTERvar.iscontrol = input;
                  });
                },
                sValue: FINALMASTERvar.masterID_CALCULATE_ACTION,
                returnfunc: (String s) {
                  FINALMASTERvar.masterID_CALCULATE_ACTION = s;
                },
              ),
            ],
          ),
        ));
  }
}
