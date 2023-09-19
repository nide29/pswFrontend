import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:frontend/model/support/Constants.dart';
import 'package:frontend/model/support/ErrorListener.dart';

enum TypeHeader { json, urlencoded }

class RestManager {
  ErrorListener? delegate;
  String? token;

  Future<String> _makeRequest(
      String serverAddress, String servicePath, String method, TypeHeader type,
      {required Map<String, String>? value, dynamic body}) async {
    print('makeRequest1');
    print('serverAddress: ' + serverAddress);
    print('servicePath: ' + servicePath);
    Uri uri = Uri.http(serverAddress, servicePath, value);
    //Uri uri = Uri.https(serverAddress, servicePath, value);
    bool errorOccurred = false;
    print('makeRequest2');
    while (true) {
      try {
        var response;
        // setting content type
        String contentType = '';
        dynamic formattedBody;
        if (type == TypeHeader.json) {
          contentType = "application/json;charset=utf-8";
          formattedBody = json.encode(body);
        } else if (type == TypeHeader.urlencoded) {
          contentType = "application/x-www-form-urlencoded";
          formattedBody = body.keys.map((key) => "$key=${body[key]}").join("&");
        }
        // setting headers
        Map<String, String> headers = Map();
        headers[HttpHeaders.contentTypeHeader] = contentType;
        if (token != null) {
          headers[HttpHeaders.authorizationHeader] = 'bearer $token';
        }

        //headers[HttpHeaders.accessControlAllowOriginHeader] = '*';
        //headers[HttpHeaders.acceptHeader] = '*/*';
        //headers[HttpHeaders.accessControlAllowHeadersHeader] = 'Origin, X-Requested-With, Content-Type, Accept';
        //headers[HttpHeaders.accessControlAllowMethodsHeader] = 'GET,PUT,PATCH,POST,DELETE';

        print('DEBUG: makeRequest3');
        print('case = ' + method);
        // making request
        switch (method) {
          case "post":
            print('uri : ' + uri.toString());
            print('headers : ' + headers.toString());
            print('formattedBody: ' + formattedBody);
            try {
              response = await post(
                uri,
                headers: headers,
                body: formattedBody,
              );
            } catch (e) {
              print('ECCEZIONE IN POST: ' + e.toString() );
            }
            break;
          case "get":
            print('justCuriosity1');

            print('uri : ' + uri.toString());
            print('headers : ' + headers.toString());
            try {
              response = await get(
                uri,
                headers: headers,
              );
            } catch (e) {
              print('ECCEZIONE IN GET: ' + e.toString());
            }
            print('GET RESPONSE: ' + response.toString());

            print('justCuriosity2');
            break;
          case "put":
            response = await put(
              uri,
              headers: headers,
            );
            break;
          case "delete":
            print('DELETE');
            print('uri : ' + uri.toString());
            print('headers : ' + headers.toString());
            response = await delete(
              uri,
              headers: headers,
            );
            break;
        }
        if (delegate != null && errorOccurred) {
          delegate?.errorNetworkGone();
          errorOccurred = false;
        }
        print('response body: ' + response.body);
        return response.body;
      } catch (err) {
        if (delegate != null && !errorOccurred) {
          delegate?.errorNetworkOccurred(Constants.MESSAGE_CONNECTION_ERROR);
          errorOccurred = true;
        }
        await Future.delayed(const Duration(seconds: 5), () => null);
      }
    }
  }

  Future<String> makePostRequest(String serverAddress, String servicePath, dynamic value, {TypeHeader type = TypeHeader.json}) async {
    print('postRequest1: ' + serverAddress +' '+ servicePath +' '+ value.toString() +' '+ type.toString());
    return _makeRequest(serverAddress, servicePath, "post", type, body: value, value: {});
  }

  Future<String> makeGetRequest(String serverAddress, String servicePath, [Map<String, String>? value, TypeHeader? type]) async {
    print('getRequest1' + serverAddress + servicePath + value.toString() + type.toString());
    return _makeRequest(serverAddress, servicePath, "get", type!, value: value);
  }

  Future<String> makePutRequest(String serverAddress, String servicePath,
      [Map<String, String>? value, TypeHeader? type]) async {
    return _makeRequest(serverAddress, servicePath, "put", type!, value: value);
  }

  Future<String> makeDeleteRequest(String serverAddress, String servicePath, [Map<String, String>? value, TypeHeader? type]) async {
    return _makeRequest(serverAddress, servicePath, "delete", type!,
        value: value);
  }
}
