import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/02-2-FINALMASTERmsg.dart';
import '../../../model/model.dart';
import '../../../widget/TABLE/01TYPEtable.dart';
import '../../../widget/common/ComInputText.dart';
import '../FINALMASTERvar.dart';

//context.read<FINALMASTER_Bloc>().add(FINALMASTER_TYPEget());

class TYPEStable extends StatelessWidget {
  TYPEStable({
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
              FINALMASTERvar.TYPE_TYPE_ACTION = "";
              FINALMASTERvar.masterID_TYPE_ACTION = "";
              TYPEPOPUP(context);
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
          child: TYPEtableWidget(
            BGColorMain: Colors.grey.shade400,
            TYPEtext: "TYPE",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
          ),
        ),
        for (int i = 0; i < _data.length; i++) ...[
          SizedBox(
            height: 40,
            child: TYPEtableWidget(
              BGColorMain:
                  i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              TYPEtext: _data[i].f01,
              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                FINALMASTERvar.masterID_TYPE = _data[i].f21;
                context
                    .read<FINALMASTERmsg_Bloc>()
                    .add(FINALMASTERmsg_TYPE_DROP());
              },
              EditFN: (v) {
                FINALMASTERvar.iscontrol = true;
                FINALMASTERvar.TYPE_TYPE_ACTION = _data[i].f01;
                FINALMASTERvar.masterID_TYPE_ACTION = _data[i].f21;
                TYPEPOPUP(context);
              },
              masterIDtext: _data[i].f21,
            ),
          ),
        ]
      ],
    );
  }
}

void TYPEPOPUP(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: TYPEACTION(),
      );
    },
  );
}

class TYPEACTION extends StatefulWidget {
  const TYPEACTION({super.key});

  @override
  State<TYPEACTION> createState() => _TYPEACTIONState();
}

class _TYPEACTIONState extends State<TYPEACTION> {
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
              child: Text("TYPE"),
            ),
          ),
          ComInputText(
            sLabel: "TYPE",
            height: 40,
            width: 400,
            isContr: FINALMASTERvar.iscontrol,
            fnContr: (input) {
              setState(() {
                FINALMASTERvar.iscontrol = input;
              });
            },
            sValue: FINALMASTERvar.TYPE_TYPE_ACTION,
            returnfunc: (String s) {
              FINALMASTERvar.TYPE_TYPE_ACTION = s;
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
            sValue: FINALMASTERvar.masterID_TYPE_ACTION,
            returnfunc: (String s) {
              FINALMASTERvar.masterID_TYPE_ACTION = s;
            },
          ),
          const SizedBox(
            height: 24,
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
        ],
      )),
    );
  }
}
