import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class HttpAuth {
  String _authPass = 'everis123';

  SecurityContext _context;

  HttpAuth();

  Future<HttpClientResponse> getRequest(String url) async {
    debugPrint("API : $url");

    await this._loadContext();

    var method = 'GET';

    HttpClient client = new HttpClient(context: this._context);
    client.connectionTimeout = Duration(seconds: 5);
    var request = await client.openUrl(method, Uri.parse(url));
    request.headers
        .set(HttpHeaders.CONTENT_TYPE, 'application/x-www-form-urlencoded');

    return await request.close();
  }

  Future<HttpClientResponse> postRequest(String url, Map body) async {

    await this._loadContext();

    var method = 'POST';

    var data = '';
    body.forEach((key, value) =>
        {data = (data == '') ? "$key=$value" : "${data}&$key=$value"});

    debugPrint("data => $data");

    HttpClient client = new HttpClient(context: this._context);

    var request = await client.openUrl(method, Uri.parse(url));
    request.headers
        .set(HttpHeaders.CONTENT_TYPE, 'application/x-www-form-urlencoded');

    request.write(data);

    return await request.close();
  }

  Future _loadContext() async {
  
    ByteData certificateCrt =
        await rootBundle.load('assets/certificates/client.p12');

    this._context = SecurityContext.defaultContext;

    this._context.useCertificateChainBytes(certificateCrt.buffer.asUint8List(), password: this._authPass);
    this._context.usePrivateKeyBytes(certificateCrt.buffer.asUint8List(),password: this._authPass);
  }

  static Future<String> parseBody(HttpClientResponse response) async {
    return response.transform(Utf8Decoder()).join();
  }
}
