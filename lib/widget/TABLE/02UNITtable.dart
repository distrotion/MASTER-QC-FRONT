import 'package:flutter/material.dart';

import '00EACHCALL.dart';

class UNITtableWidget extends StatelessWidget {
  UNITtableWidget({
    super.key,
    this.BGColorMain,
    this.TYPEtext,
    this.UNITtext,
    this.DESIMALtext,
    this.ACTIONtext,
    this.isACTION,
    this.masterIDtext,
    this.EditFN,
    this.DeleteFN,
  });
  Color? BGColorMain;
  String? TYPEtext;
  String? UNITtext;
  String? DESIMALtext;
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
                  data: TYPEtext ?? "",
                  tapCell: (v) {},
                ),
              ),
              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: UNITtext ?? "",
                  tapCell: (v) {},
                ),
              ),
              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: DESIMALtext ?? "",
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
