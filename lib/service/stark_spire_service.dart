import 'package:accusia_assesment/model/eproduct.dart';
import 'package:chopper/chopper.dart';
import 'header_interceptor.dart';

part 'stark_spire_service.chopper.dart';

@ChopperApi()
abstract class StarkSpireService extends ChopperService{

  @Get(path: 'json')
  Future<Response<EProduct>> getECommerceData();


  static StarkSpireService create(Converter converter) {
    final client = ChopperClient(
      baseUrl: 'https://stark-spire-93433.herokuapp.com',
      interceptors: [HttpLoggingInterceptor()],
      converter: converter,
      errorConverter: JsonConverter(),

      services: [
        _$StarkSpireService(),
      ],
    );
    return _$StarkSpireService(client);
  }
}