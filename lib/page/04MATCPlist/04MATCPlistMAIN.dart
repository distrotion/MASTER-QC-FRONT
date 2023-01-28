import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-1-MATCPlistGET.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/TABLE/12-SEARCHMATCP.dart';
import '../05INSPECTIONstd/INSPECTIONstdVAR.dart';
import '../page5.dart';

class MATCPlistMAIN extends StatefulWidget {
  MATCPlistMAIN({
    super.key,
    this.data,
  });
  List<MATCPlistClass>? data;
  @override
  State<MATCPlistMAIN> createState() => _MATCPlistMAINState();
}

class _MATCPlistMAINState extends State<MATCPlistMAIN> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MATCPlistGET_Bloc>().add(MATCPlistGET_MATCP());
  }

  int pagelist = 0;
  int pageselect = 0;

  @override
  Widget build(BuildContext context) {
    List<MATCPlistClass> _data = widget.data ?? [];

    if (_data.length > 0) {
      pagelist = (_data.length ~/ 20) + 1;
      print(pagelist);
      print(_data.length);
    }

    return SingleChildScrollView(
      child: _data.length > 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: InkWell(
                            onTap: () {
                              //
                              if (pagelist > 0) {
                                setState(() {
                                  pageselect--;
                                });
                              }
                            },
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/icons/icon-L@3x.png'))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Text(pageselect.toString() +
                              " / " +
                              pagelist.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: InkWell(
                            onTap: () {
                              //
                              if (pageselect < pagelist) {
                                setState(() {
                                  pageselect++;
                                });
                              }
                            },
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/icons/icon-R@3x.png'))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 2500,

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      // color: Colors.orange,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    // height: 1000,
                    // width: 1000,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: MATCPlistTABLE(
                            CP: "CP",
                            FG: "FG",
                            CUSTOMMER: "CUSTOMMER",
                            PART: "PART",
                            PARTNAME: "PARTNAME",
                            MATERIAL: "MATERIAL",
                            STATUS: "STATUS",
                            BGColorMain: Colors.grey.shade600,
                          ),
                        ),
                        for (int i = 20 * pageselect;
                            i < 20 * pageselect + 19;
                            i++) ...[
                          SizedBox(
                            height: 40,
                            child: MATCPlistTABLE(
                              CP: _data[i].CP,
                              FG: _data[i].FG,
                              CUSTOMMER: _data[i].CUSTOMER,
                              PART: _data[i].PART,
                              PARTNAME: _data[i].PARTNAME,
                              MATERIAL: _data[i].MATERIAL,
                              STATUS: _data[i].STATUS,
                              BGColorMain: i.isEven
                                  ? Colors.grey.shade50
                                  : Colors.grey.shade200,
                              isACTION: true,
                              EditFN: (v) {
                                INSPECTIONstdVAR.CP = _data[i].CP;
                                INSPECTIONstdVAR.FG = _data[i].FG;
                                INSPECTIONstdVAR.CUSTOMER = _data[i].CUSTOMER;
                                INSPECTIONstdVAR.PART = _data[i].PART;
                                INSPECTIONstdVAR.PARTNAME = _data[i].PARTNAME;
                                INSPECTIONstdVAR.MATERIAL = _data[i].MATERIAL;
                                INSPECTIONstdVAR.CUST_FULLNM =
                                    _data[i].CUST_FULLNM;

                                CuPage = Page5();
                                MainBodyContext.read<ChangePage_Bloc>()
                                    .add(ChangePage_nodrower());
                              },
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            )
          : SizedBox(
              height: 75,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SizedBox(width: 30),
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text("Loading"),
                ],
              ),
            ),
    );
  }
}
