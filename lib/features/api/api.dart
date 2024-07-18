import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/models.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class RhymesApiClient {
  factory RhymesApiClient(Dio dio, {String baseUrl}) = _RhymesApiClient;

  factory RhymesApiClient.create({String? apiUrl}){
    final dio = Dio();
    if(apiUrl != null){
      return RhymesApiClient(dio, baseUrl: apiUrl);
    }
    return RhymesApiClient(dio);
  }

  @GET('allwords/{word}')
  Future<List<Rhymes>> getRhymes(@Path('word') String word);
}