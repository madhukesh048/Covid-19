import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../base/base_service.dart';

class HttpService extends BaseService {
  Future<T> makeGetRequest<T>({
    @required String url,
    Map<String, dynamic> headers,
  }) async {
    log.i('makeGetRequest: url: $url');
    Response<T> response = await Dio().get<T>(
      url,
      options: Options(headers: headers),
    );

    return response.data;
  }
}
