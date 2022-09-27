import '../../model/model.dart';

class FINALMASTERvar {
  static int currentStep = 0;
  static List<dataset> TYPEget = [];
  static List<dataset> UNITget = [];
  static List<dataset> ITEMSget = [];
  static List<dataset> MACHINENAMEget = [];
  static List<dataset> METHODEget = [];
  static List<dataset> SPECIALSPECget = [];
  static List<dataset> CALCULATEget = [];
  static String masterID_TYPE = '';
  static String masterID_UNIT = '';
  static String masterID_ITEMS = '';
  static String masterID_MACHINENAME = '';
  static String masterID_METHODE = '';
  static String masterID_SPECIALSPEC = '';
  static String masterID_CALCULATE = '';
  //
  static List<MapEntry<String, String>> TYPEddBUFF = [];
  static List<MapEntry<String, String>> ITEMSddBUFF = [];
  static List<MapEntry<String, String>> METHODddBUFF = [];
  static List<MapEntry<String, String>> RESULTFORMATBUFF = [];
  static List<MapEntry<String, String>> GRAPHTYPEBUFF = [];
  static List<MapEntry<String, String>> INSTRUMENTSBUFF = [];
//
  static bool masterID_ACTION_isEnabled = false;
  //--------TYPE
  static bool iscontrol = false;
  static String TYPE_TYPE_ACTION = '';
  static String masterID_TYPE_ACTION = '';

  //--------UNIT
  static String TYPEid_UNIT_ACTION = '';
  static String UNIT_UNIT_ACTION = '';
  static String DESIMAL_UNIT_ACTION = '';
  static String masterID_UNIT_ACTION = '';
  //--------ITEMS
  static String TYPEid_ITEMS_ACTION = '';
  static String ITEMS_ITEMS_ACTION = '';
  static String RESULTFORMAT_ITEMS_ACTION = '';
  static String GRAPHTYPE_ITEMS_ACTION = '';
  static String GRAPHINTERSECTION_ITEMS_ACTION = '';
  static String DOCUMENTS_ITEMS_ACTION = '';
  static String masterID_ITEMS_ACTION = '';
  //--------MACHINENAME
  static String METHOD_MACHINENAME_ACTION = '';
  static String MACHINE_MACHINENAME_ACTION = '';
  static String DESIMAL_MACHINENAME_ACTION = '';
  static String masterID_MACHINENAME_ACTION = '';
  static List<String> MACHINElist_MACHINENAME_ACTION = [];
  //--------METHOD
  static String ITEM_METHOD_ACTION = '';
  static String METHOD_METHOD_ACTION = '';
  static String DOCUMENT_METHOD_ACTION = '';
  static String masterID_METHOD_ACTION = '';
  //--------METHOD
  static String ITEM_SPECIALSPEC_ACTION = '';
  static String SPECIALSPEC_SPECIALSPEC_ACTION = '';
  static String masterID_SPECIALSPEC_ACTION = '';

  //--------CALCULATE
  static String CALCULATE_CALCULATE_ACTION = '';
  static String FORMULA_CALCULATE_ACTION = '';
  static String X_CALCULATE_ACTION = '';
  static bool Xb_CALCULATE_ACTION = false;
  static String Y_CALCULATE_ACTION = '';
  static bool Yb_CALCULATE_ACTION = false;
  static String Z_CALCULATE_ACTION = '';
  static bool Zb_CALCULATE_ACTION = false;
  static String I_CALCULATE_ACTION = '';
  static bool Ib_CALCULATE_ACTION = false;
  static String K1_CALCULATE_ACTION = '';
  static bool K1b_CALCULATE_ACTION = false;
  static String K2_CALCULATE_ACTION = '';
  static bool K2b_CALCULATE_ACTION = false;
  static String masterID_CALCULATE_ACTION = '';
}
