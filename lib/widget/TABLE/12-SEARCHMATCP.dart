import 'package:flutter/material.dart';

import '00EACHCALL.dart';

class MATCPlistTABLE extends StatelessWidget {
  MATCPlistTABLE({super.key});
  Function(String)? EditFN;
  Function(String)? DeleteFN;
  String? ACTION;
  bool? isACTION;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: "CP",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: "FG",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: "CUSTOMMER",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 2,
            child: EACHCELL(
              data: "PART",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 2,
            child: EACHCELL(
              data: "PARTNAME",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: "MATERIAL",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: "STATUS",
              tapCell: (v) {},
            ),
          ),
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
                    data: "ACTION",
                    tapCell: (v) {},
                  ),
          ),
        ],
      ),
    );
  }
}
