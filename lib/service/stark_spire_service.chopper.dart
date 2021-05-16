// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stark_spire_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$StarkSpireService extends StarkSpireService {
  _$StarkSpireService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = StarkSpireService;

  @override
  Future<Response<EProduct>> getECommerceData() {
    final $url = 'json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<EProduct, EProduct>($request);
  }
}
