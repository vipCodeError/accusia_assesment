import 'dart:async';

import 'package:accusia_assesment/model/eproduct.dart';
import 'package:accusia_assesment/service/model_converter/ecom_model_convert.dart';
import 'package:accusia_assesment/service/stark_spire_service.dart';
import 'package:chopper/chopper.dart';

import 'bloc.dart';


class FetchData extends Bloc{
  final _controller = StreamController<Response<EProduct>>();
  final _client = StarkSpireService.create(EcomModelConverter());

  Stream<Response<EProduct>> get actorStream => _controller.stream;

  void fetchEComData() async{
    final result = await _client.getECommerceData();
    _controller.sink.add(result);
  }

  @override
  void dispose() {
    _controller.close();
  }

}
