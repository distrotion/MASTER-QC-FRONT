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
  static String FINAL_seq = "";
  static String FINAL_ITEMs = "";
  static String FINAL_CORStype = "";
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
  static String FINAL_POINTPCS = "";
  static String FINAL_PCS = "";
  static String FINAL_FREQUENCY = "";
  static String FINAL_REMARK = "";
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
