import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/02-2-FINALMASTERmsg.dart';
import '../../../model/model.dart';
import '../../../widget/TABLE/02UNITtable.dart';
import '../../../widget/common/Advancedropdown.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../FINALMASTERvar.dart';

//context.read<FINALMASTER_Bloc>().add(FINALMASTER_UNITget());

class UNITStable extends StatelessWidget {
  UNITStable({
    super.key,
    this.data,
  });
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    List<dataset> _data = data ?? [];

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              FINALMASTERvar.iscontrol = true;
              FINALMASTERvar.TYPEid_UNIT_ACTION = "";
              FINALMASTERvar.UNIT_UNIT_ACTION = "";
              FINALMASTERvar.masterID_UNIT_ACTION = "";
              UNITPOPUP(context);
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
          child: UNITtableWidget(
            BGColorMain: Colors.grey.shade400,
            TYPEtext: "TYPE",
            UNITtext: "UNIT",
            DESIMALtext: "DESIMAL",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
          ),
        ),
        for (int i = 0; i < _data.length; i++) ...[
          SizedBox(
            height: 40,
            child: UNITtableWidget(
              BGColorMain:
                  i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              TYPEtext: _data[i].f11,
              UNITtext: _data[i].f02,
              DESIMALtext: "",
              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                FINALMASTERvar.masterID_UNIT = _data[i].f21;
                // context
                //     .read<FINALMASTERmsg_Bloc>()
                //     .add(FINALMASTERmsg_UNIT_DROP());
                POPUPyn(context, (v) {
                  context
                      .read<FINALMASTERmsg_Bloc>()
                      .add(FINALMASTERmsg_UNIT_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                FINALMASTERvar.iscontrol = true;
                FINALMASTERvar.TYPEid_UNIT_ACTION = _data[i].f01;
                FINALMASTERvar.UNIT_UNIT_ACTION = _data[i].f02;
                FINALMASTERvar.masterID_UNIT_ACTION = _data[i].f21;
                UNITPOPUP(context);
              },
              masterIDtext: _data[i].f21,
            ),
          ),
        ]
      ],
    );
  }
}

void UNITPOPUP(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: UNITACTION(),
      );
    },
  );
}

class UNITACTION extends StatefulWidget {
  const UNITACTION({super.key});

  @override
  State<UNITACTION> createState() => _UNITACTIONState();
}

class _UNITACTIONState extends State<UNITACTION> {
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
                child: Text("UNIT"),
              ),
            ),
            SizedBox(
              height: 64,
              width: 400,
              child: AdvanceDropDown(
                sLabel: "TYPE",
                imgpath: 'assets/icons/icon-down_4@3x.png',
                listdropdown: FINALMASTERvar.TYPEddBUFF,
                onChangeinside: (d, k) {
                  setState(() {
                    FINALMASTERvar.TYPEid_UNIT_ACTION = d;
                  });
                },
                value: FINALMASTERvar.TYPEid_UNIT_ACTION,
                height: 40,
                width: 400,
              ),
            ),
            ComInputText(
              sLabel: "UNIT",
              height: 40,
              width: 400,
              isContr: FINALMASTERvar.iscontrol,
              fnContr: (input) {
                setState(() {
                  FINALMASTERvar.iscontrol = input;
                });
              },
              sValue: FINALMASTERvar.UNIT_UNIT_ACTION,
              returnfunc: (String s) {
                FINALMASTERvar.UNIT_UNIT_ACTION = s;
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
              sValue: FINALMASTERvar.masterID_UNIT_ACTION,
              returnfunc: (String s) {
                FINALMASTERvar.masterID_UNIT_ACTION = s;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                // context
                //     .read<FINALMASTERmsg_Bloc>()
                //     .add(FINALMASTERmsg_UNIT_EDIT());
              },
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
          ],
        ),
      ),
    );
  }
}
