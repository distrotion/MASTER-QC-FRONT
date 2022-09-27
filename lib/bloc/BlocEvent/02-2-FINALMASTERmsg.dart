import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/02FINALMASTER/FINALMASTERmain.dart';
import '../../page/02FINALMASTER/FINALMASTERvar.dart';
import '02-1-FINALMASTERget.dart';

//-------------------------------------------------
String server = serverGB;

abstract class FINALMASTERmsg_Event {}

class FINALMASTERmsg_TYPE_DROP extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_UNIT_DROP extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_ITEMS_DROP extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_MACHINENAME_DROP extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_METHODE_DROP extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_SPECIFICATION_DROP extends FINALMASTERmsg_Event {}

//----------------------------------------------------------------

class FINALMASTERmsg_TYPE_EDIT extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_Bloc extends Bloc<FINALMASTERmsg_Event, String> {
  FINALMASTERmsg_Bloc() : super('') {
    on<FINALMASTERmsg_TYPE_DROP>((event, emit) {
      return _FINALMASTERmsg_TYPE_DROP('', emit);
    });

    on<FINALMASTERmsg_UNIT_DROP>((event, emit) {
      return _FINALMASTERmsg_UNIT_DROP('', emit);
    });

    on<FINALMASTERmsg_ITEMS_DROP>((event, emit) {
      return _FINALMASTERmsg_ITEMS_DROP('', emit);
    });

    on<FINALMASTERmsg_MACHINENAME_DROP>((event, emit) {
      return _FINALMASTERmsg_MACHINENAME_DROP('', emit);
    });

    on<FINALMASTERmsg_METHODE_DROP>((event, emit) {
      return _FINALMASTERmsg_METHODE_DROP('', emit);
    });

    on<FINALMASTERmsg_SPECIFICATION_DROP>((event, emit) {
      return _FINALMASTERmsg_SPECIFICATION_DROP('', emit);
    });

    //----------------------------------------------

    on<FINALMASTERmsg_TYPE_EDIT>((event, emit) {
      return _FINALMASTERmsg_TYPE_EDIT('', emit);
    });
  }

  Future<void> _FINALMASTERmsg_TYPE_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      server + "DROP_TYPE_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_TYPE,
      },
    );
    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
    } else {
      //
    }
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>().add(FINALMASTER_TYPEget());
    emit(output);
  }

  Future<void> _FINALMASTERmsg_UNIT_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      server + "DROP_UNIT_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_UNIT,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>().add(FINALMASTER_UNITget());
    emit(output);
  }

  Future<void> _FINALMASTERmsg_ITEMS_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      server + "DROP_ITEMS_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_ITEMS,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>().add(FINALMASTER_ITEMSget());
    emit(output);
  }

  Future<void> _FINALMASTERmsg_MACHINENAME_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      server + "DROP_MACHINENAME_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_MACHINENAME,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_MACHINENAMEget());
    emit(output);
  }

  Future<void> _FINALMASTERmsg_METHODE_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      server + "DROP_METHODE_FINA",
      data: {
        "masterID": FINALMASTERvar.masterID_METHODE,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_METHODEget());
    emit(output);
  }

  Future<void> _FINALMASTERmsg_SPECIFICATION_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      server + "DROP_SPECIFICATION_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_SPECIALSPEC,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_SPECIALSPECget());
    emit(output);
  }

  //

  Future<void> _FINALMASTERmsg_TYPE_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>().add(FINALMASTER_TYPEget());
    emit(output);
  }
}
