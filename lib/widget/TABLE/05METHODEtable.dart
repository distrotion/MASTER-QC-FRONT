import 'package:flutter/material.dart';

import '00EACHCALL.dart';

class METHODtableWidget extends StatelessWidget {
  METHODtableWidget({
    super.key,
    this.BGColorMain,
    this.ITEMstext,
    this.METHODtext,
    this.DOCUMENTtext,
    this.ACTIONtext,
    this.isACTION,
    this.masterIDtext,
    this.EditFN,
    this.DeleteFN,
  });
  Color? BGColorMain;
  String? ITEMstext;
  String? METHODtext;
  String? DOCUMENTtext;
  String? ACTIONtext;
  bool? isACTION;
  String? masterIDtext;
  Function(String)? EditFN;
  Function(String)? DeleteFN;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BGColorMain ?? Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: ITEMstext ?? "",
                  tapCell: (v) {},
                ),
              ),
              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: METHODtext ?? "",
                  tapCell: (v) {},
                ),
              ),
              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: DOCUMENTtext ?? "",
                  tapCell: (v) {},
                ),
              ),
              Expanded(
                flex: 1,
                child: isACTION ?? false
                    ? ACTIONCELL(
                        DeleteFN: (v) {
                          DeleteFN!("DeleteFN");
                        },
                        EditFN: (v) {
                          EditFN!("EditFN");
                        },
                      )
                    : EACHCELL(
                        data: ACTIONtext ?? "",
                        tapCell: (v) {},
                      ),
              ),
              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: masterIDtext ?? "",
                  tapCell: (v) {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
