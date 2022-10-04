import 'package:flutter/material.dart';

import '00EACHCALL.dart';

class PATTERNtable extends StatelessWidget {
  PATTERNtable({
    super.key,
    this.seq,
    this.ITEMs,
    this.CORStype,
    this.FORMULA,
    this.SCMARK,
    this.SCMARKtype,
    this.DOCUMENT,
    this.METHOD,
    this.IMGreaddata,
    this.IMGno,
    this.LOAD,
    this.GT,
    this.SPECIFICATIONve,
    this.UNIT,
    this.POSITION,
    this.PCS,
    this.FREQUENCY,
    this.REMARK,
    this.ACTION,
    this.isACTION,
    this.EditFN,
    this.DeleteFN,
    this.BGColorMain,
  });
  String? seq;
  String? ITEMs;
  String? CORStype;
  String? FORMULA;
  String? SCMARK;
  String? SCMARKtype;
  String? DOCUMENT;
  String? METHOD;
  String? IMGreaddata;
  String? IMGno;
  String? LOAD;
  String? GT;
  String? SPECIFICATIONve;
  String? UNIT;
  String? POSITION;
  String? PCS;
  String? FREQUENCY;
  String? REMARK;
  String? ACTION;
  bool? isACTION;
  Function(String)? EditFN;
  Function(String)? DeleteFN;
  Color? BGColorMain;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BGColorMain ?? Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              if (seq != null) ...[
                Expanded(
                  flex: 1,
                  child: EACHCELL(
                    data: seq ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (ITEMs != null) ...[
                Expanded(
                  flex: 2,
                  child: EACHCELL(
                    data: ITEMs ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (CORStype != null) ...[
                Expanded(
                  flex: 2,
                  child: EACHCELL(
                    data: CORStype ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (FORMULA != null) ...[
                Expanded(
                  flex: 2,
                  child: EACHCELL(
                    data: FORMULA ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (SCMARK != null) ...[
                Expanded(
                  flex: 1,
                  child: EACHCELL(
                    data: SCMARK ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (SCMARKtype != null) ...[
                Expanded(
                  flex: 1,
                  child: EACHCELL(
                    data: SCMARKtype ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (DOCUMENT != null) ...[
                Expanded(
                  flex: 1,
                  child: EACHCELL(
                    data: DOCUMENT ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (METHOD != null) ...[
                Expanded(
                  flex: 2,
                  child: EACHCELL(
                    data: METHOD ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (IMGreaddata != null) ...[
                Expanded(
                  flex: 2,
                  child: EACHCELL(
                    data: IMGreaddata ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (IMGno != null) ...[
                Expanded(
                  flex: 2,
                  child: EACHCELL(
                    data: IMGno ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (LOAD != null) ...[
                Expanded(
                  flex: 1,
                  child: EACHCELL(
                    data: LOAD ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (GT != null) ...[
                Expanded(
                  flex: 1,
                  child: EACHCELL(
                    data: GT ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (SPECIFICATIONve != null) ...[
                Expanded(
                  flex: 1,
                  child: EACHCELL(
                    data: SPECIFICATIONve ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (UNIT != null) ...[
                Expanded(
                  flex: 1,
                  child: EACHCELL(
                    data: UNIT ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (POSITION != null) ...[
                Expanded(
                  flex: 1,
                  child: EACHCELL(
                    data: POSITION ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (PCS != null) ...[
                Expanded(
                  flex: 1,
                  child: EACHCELL(
                    data: PCS ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (FREQUENCY != null) ...[
                Expanded(
                  flex: 1,
                  child: EACHCELL(
                    data: FREQUENCY ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              if (REMARK != null) ...[
                Expanded(
                  flex: 1,
                  child: EACHCELL(
                    data: REMARK ?? "",
                    tapCell: (v) {},
                  ),
                ),
              ],
              Expanded(
                flex: 1,
                child: isACTION ?? false
                    ? ACTIONCELL(
                        DeleteFN: (v) {
                          if (DeleteFN != null) {
                            DeleteFN!("DeleteFN");
                          }
                        },
                        EditFN: (v) {
                          if (EditFN != null) {
                            EditFN!("EditFN");
                          }
                        },
                      )
                    : EACHCELL(
                        data: ACTION ?? "",
                        tapCell: (v) {},
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
