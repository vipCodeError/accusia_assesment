import 'dart:async';
import 'package:chopper/chopper.dart';

// 1
class HeaderInterceptor implements RequestInterceptor {
  // 2
  static const String AUTH_HEADER = "Authorization";
  // 3
  static const String BEARER = "Bearer ";
  // 4
  static const String V4_AUTH_HEADER =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNmY1MWJhODg4Nzg5NTMwNjk2ODE5OGMyZWRlN2ViMSIsInN1YiI6IjVmZWFmZTAxY2MyNzdjMDA0MDA2MDJlYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.1mWfltO_oOguv633U723W86SOlh_pIz3neMTsmMw79Q";

  @override
  FutureOr<Request> onRequest(Request request) async {
    // 5
    Request newRequest = request.copyWith(headers: {AUTH_HEADER: BEARER + V4_AUTH_HEADER});
    return newRequest;
  }

}