import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetPostsCall {
  static Future<ApiCallResponse> call({
    String? categories = '41,40,36,37,38,39',
    String? search = '',
    String? perPage = '10',
    String? page = '',
    String? categoriesExclude = '43,55,1',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPosts',
      apiUrl: 'https://consultabeneficios.com.br/wp-json/wp/v2/posts',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        '_embed': true,
        'per_page': perPage,
        'orderby': "date",
        'order': "desc",
        'categories_exclude': categoriesExclude,
        'categories': categories,
        'search': search,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic postTitle(dynamic response) => getJsonField(
        response,
        r'''$[:].title.rendered''',
        true,
      );
  static dynamic postContent(dynamic response) => getJsonField(
        response,
        r'''$[:].content.rendered''',
        true,
      );
  static dynamic postCategory(dynamic response) => getJsonField(
        response,
        r'''$[:].categories[0]''',
        true,
      );
}

class GetMediaCall {
  static Future<ApiCallResponse> call({
    String? idPosts = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMedia',
      apiUrl: 'https://consultabeneficios.com.br/wp-json/wp/v2/media',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'per_page': "10",
        'orderby': "date",
        'order': "desc",
        'include': idPosts,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic sourceImage(dynamic response) => getJsonField(
        response,
        r'''$[:].source_url''',
        true,
      );
}

class GetCategoriesCall {
  static Future<ApiCallResponse> call({
    String? perPage = '30',
    String? exclude = '43,1,55',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCategories',
      apiUrl: 'https://consultabeneficios.com.br/wp-json/wp/v2/categories',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'exclude': exclude,
        'per_page': perPage,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic idCat(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  static dynamic nomeCat(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      );
}

class PostReplyCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? name = '',
    String? mensagem = '',
    String? post = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'postReply',
      apiUrl:
          'https://consultabeneficios.com.br/wp-json/wp/v2/comments?post=${post}&author_email=${email}&author_name=${name}&content=${mensagem}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetPostCall {
  static Future<ApiCallResponse> call({
    String? slug = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPost',
      apiUrl: 'https://consultabeneficios.com.br/wp-json/wp/v2/posts',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        '_embed': true,
        'per_page': "1",
        'slug': slug,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
