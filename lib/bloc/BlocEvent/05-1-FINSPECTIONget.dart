import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

String server = serverGB;

abstract class FINSPECTIONget_Event {}

class FINSPECTIONget_MATCP extends FINSPECTIONget_Event {}

class FINSPECTIONget_FLUSH extends FINSPECTIONget_Event {}

class FINSPECTIONget_Bloc extends Bloc<FINSPECTIONget_Event, int> {
  FINSPECTIONget_Bloc() : super(0) {
    on<FINSPECTIONget_MATCP>((event, emit) {
      return _FINSPECTIONget_MATCP(0, emit);
    });
    on<FINSPECTIONget_FLUSH>((event, emit) {
      return _FINSPECTIONget_FLUSH(0, emit);
    });
  }
  Future<void> _FINSPECTIONget_MATCP(int toAdd, Emitter<int> emit) async {
    final response = await Dio().post(
      server + "GET_MATCP_DATA",
      data: {
        "MATCP": "24008527",
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff);
    }
    emit(0);
  }

  Future<void> _FINSPECTIONget_FLUSH(int toAdd, Emitter<int> emit) async {
    emit(0);
  }
}
