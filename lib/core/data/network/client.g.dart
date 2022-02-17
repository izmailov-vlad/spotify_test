// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _SpotifyClient implements SpotifyClient {
  _SpotifyClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.spotify.com/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<NewReleases> getNewReleases() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NewReleases>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'browse/new-releases',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NewReleases.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Album?> getAlbum(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<Album>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'albums/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null ? null : Album.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Tracks?> getSeveralTracks(ids) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ids': ids};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<Tracks>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/tracks',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null ? null : Tracks.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
