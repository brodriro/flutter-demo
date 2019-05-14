import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class HttpAuth {
  // ignore: non_constant_identifier_names
  static final String METHOD_POST = "POST";

  // ignore: non_constant_identifier_names
  static final String METHOD_GET = "GET";
  String _authPass = 'everis123';

  SecurityContext _context;

  HttpAuth();

  Future<HttpClientResponse> getRequest(String url) async {
    debugPrint("API : $url");

    await this._loadContext();

    HttpClient client = new HttpClient(context: this._context);
    client.connectionTimeout = Duration(seconds: 5);
    var request = await client.openUrl(METHOD_GET, Uri.parse(url));
    request.headers.set(
        HttpHeaders.contentTypeHeader, 'application/x-www-form-urlencoded');

    return await request.close();
  }

  Future<HttpClientResponse> postRequest(
      String url, Map<String, String> body) async {
    await this._loadContext();

    HttpClient client = new HttpClient(context: this._context);

    var request = await client.openUrl(METHOD_POST, Uri.parse(url));
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.add(utf8.encode(json.encode(body)));

    return await request.close();
  }

  Future _loadContext() async {
    ByteData certificate = await rootBundle.load('assets/certificates/client.p12');

    this._context = SecurityContext.defaultContext;

    this._context.useCertificateChainBytes(certificate.buffer.asUint8List(), password: this._authPass);
    this._context.usePrivateKeyBytes(certificate.buffer.asUint8List(), password: this._authPass);
  }

  static Future<String> parseBody(HttpClientResponse response) async {
    return response.transform(Utf8Decoder()).join();
  }
}
