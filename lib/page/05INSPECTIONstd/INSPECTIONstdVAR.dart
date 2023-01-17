class INSPECTIONstdVAR {
  static bool iscontrol = false;
  static bool ACTION_isEnabled = false;
  //----------------------------
  static String CP = "";
  static String FG = "";
  static String CUSTOMER = "";
  static String PART = "";
  static String PARTNAME = "";
  static String MATERIAL = "";
  static String CUST_FULLNM = "";
  //----------------------------
  static List<MapEntry<String, String>> List_FINAL_ITEMs = [];
  static List<MapEntry<String, String>> List_FINAL_SCMARK = YESNO;
  static List<MapEntry<String, String>> List_FINAL_METHOD = [];
  static List<MapEntry<String, String>> List_FINAL_LOAD = [];
  static List<MapEntry<String, String>> List_FINAL_GT = [];
  static List<MapEntry<String, String>> List_FINAL_UNIT = [];
  static List<MapEntry<String, String>> List_FINAL_UNIT_CONVERST = [];
  static List<MapEntry<String, String>> List_FINAL_FREQUENCY = [];
  static List<MapEntry<String, String>> List_FINAL_IMGreaddata = YESNO;
  static List<MapEntry<String, String>> List_FINAL_SWreport = YESNO;
  static List<MapEntry<String, String>> List_FINAL_IMGno = NUM14;
  static List<MapEntry<String, String>> List_FINAL_CORETYPE = [];
  static List<MapEntry<String, String>> List_FINAL_CALCULATE = [];
  //------------------------------------------------------------------------------------

  static String FINAL_seq = "";
  static String FINAL_ITEMs = "";
  static String FINAL_COREtype = "";
  static String FINAL_FORMULA = "";
  static String FINAL_SCMARK = "";
  static String FINAL_SCMARKtype = "";
  static String FINAL_DOCUMENT = "";
  static String FINAL_METHOD = "";
  static String FINAL_IMGreaddata = "";
  static String FINAL_IMGno = "";
  static String FINAL_LOAD = "";
  static String FINAL_GT = "";
  static String FINAL_SPECIFICATION = "";
  static String FINAL_SPECIFICATIONve = "";
  static veOB FINAL_SPECIFICATIONveOB = veOB();
  static String FINAL_UNIT = "";
  static String FINAL_UNIT_CONVERST = "";
  static String FINAL_POINTPCS = "";
  static String FINAL_PCS = "";
  static String FINAL_FREQUENCY = "";
  static String FINAL_REMARK = "";
  static String FINAL_RESULTFORMATdata = "";
  static String FINAL_SWreport = "";

  static String FINAL_CALCULATE = "";
  static String FINAL_CAL_K1 = "";
  static String FINAL_CAL_K2 = "";
  static String FINAL_CAL_K3 = "";

  static String FINAL_CAL_K1_N = "";
  static String FINAL_CAL_K2_N = "";
  static String FINAL_CAL_K3_N = "";
  static bool FINAL_CAL_K1b = false;
  static bool FINAL_CAL_K2b = false;
  static bool FINAL_CAL_K3b = false;

  static bool FINAL_POP = false;

  static String CALCULATEp = "";

  //------------------------------------------------------------------------------------
}

class veOB {
  veOB({
    this.condition = "",
    this.BTW_HI = "",
    this.BTW_LOW = "",
    this.HIM_L = "",
    this.LOL_H = "",
    this.TARGET = "",
  });
  String condition;
  String BTW_HI;
  String BTW_LOW;
  String HIM_L;
  String LOL_H;
  String TARGET;
}

const List<MapEntry<String, String>> NUM14 = [
  MapEntry("", ""),
  MapEntry("1", "1"),
  MapEntry("2", "2"),
  MapEntry("3", "3"),
  MapEntry("4", "4"),
];

const List<MapEntry<String, String>> YESNO = [
  MapEntry("", ""),
  MapEntry("YES", "YES"),
  MapEntry("NO", "NO"),
];

const List<MapEntry<String, String>> specset = [
  MapEntry("", ""),
  MapEntry("BTW", "BTW"),
  MapEntry("LOL(<)", "LOL(<)"),
  MapEntry("HIM(>)", "HIM(>)"),
  MapEntry("Actual", "Actual"),
];
