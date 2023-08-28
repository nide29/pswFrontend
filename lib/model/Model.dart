import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:frontend/model/managers/RestManager.dart';
import 'package:frontend/model/objects/Ordine.dart';
import 'package:frontend/model/objects/AuthenticationData.dart';
import 'package:frontend/model/objects/Prodotto.dart';
import 'package:frontend/model/objects/Utente.dart';
import 'package:frontend/model/support/Constants.dart';
import 'package:frontend/model/support/LogInResult.dart';

class Model {
  static Model sharedInstance = Model();

  RestManager _restManager = RestManager();
  AuthenticationData? _authenticationData;

  Future<LogInResult> logIn(String email, String password) async {
    try {
      Map<String, String> params = Map();

      params["grant_type"] = "password";

      params["client_id"] = Constants.CLIENT_ID;

      params["client_secret"] = Constants.CLIENT_SECRET;

      params["username"] = email;

      params["password"] = password;

      print(' ');
      print('params: ' + params.toString());

      String result = await _restManager.makePostRequest(
          Constants.ADDRESS_AUTHENTICATION_SERVER,
          Constants.REQUEST_LOGIN,
          params,
          type: TypeHeader.urlencoded);

      print('\n result: ' + result);

      print('\n auth dataaaa');
      _authenticationData = AuthenticationData.fromJson(jsonDecode(result));

      print(_authenticationData);

      if (_authenticationData!.hasError()) {
        if (_authenticationData!.error == "Invalid user credentials") {
          return LogInResult.error_wrong_credentials;
        } else if (_authenticationData!.error ==
            "Account is not fully set up") {
          return LogInResult.error_not_fully_setupped;
        } else {
          return LogInResult.error_unknown;
        }
      }
      _restManager.token = _authenticationData?.accessToken;
      Timer.periodic(Duration(seconds: (_authenticationData!.expiresIn - 50)),
          (Timer t) {
        _refreshToken();
      });
      return LogInResult.logged;
    } catch (e) {
      return LogInResult.error_unknown;
    }
  }

  Future<bool> _refreshToken() async {
    try {
      Map<String, String> params = Map();
      params["grant_type"] = "refresh_token";
      params["client_id"] = Constants.CLIENT_ID;
      params["client_secret"] = Constants.CLIENT_SECRET;
      params["refresh_token"] = _authenticationData!.refreshToken;
      String result = await _restManager.makePostRequest(
          Constants.ADDRESS_AUTHENTICATION_SERVER,
          Constants.REQUEST_LOGIN,
          params,
          type: TypeHeader.urlencoded);
      _authenticationData = AuthenticationData.fromJson(jsonDecode(result));
      if (_authenticationData!.hasError()) {
        return false;
      }
      _restManager.token = _authenticationData?.accessToken;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logOut() async {
    try {
      Map<String, String> params = Map();
      _restManager.token = null;
      params["client_id"] = Constants.CLIENT_ID;
      params["client_secret"] = Constants.CLIENT_SECRET;
      params["refresh_token"] = _authenticationData!.refreshToken;
      await _restManager.makePostRequest(
          Constants.ADDRESS_AUTHENTICATION_SERVER,
          Constants.REQUEST_LOGOUT,
          params,
          type: TypeHeader.urlencoded);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Utente?> addUser(Utente utente) async {
    try {
      String rawResult = await _restManager.makePostRequest(
          Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_ADD_USER, utente);
      if (rawResult
          .contains(Constants.RESPONSE_ERROR_MAIL_USER_ALREADY_EXISTS)) {
        return null;
      } else {
        return Utente.fromJson(jsonDecode(rawResult));
      }
    } catch (e) {
      return null; // not the best solution
    }
  }

  Future<Utente?> deleteUser(String idUtente) async {
    Map<String, String> params = Map();
    params["id"] = idUtente;
    try {
      String rawResult = await _restManager.makeDeleteRequest(
          Constants.ADDRESS_STORE_SERVER,
          Constants.REQUEST_DELETE_USER,
          params,
          TypeHeader.json);
      print('model rawresult: ' + rawResult);
      return Utente.fromJson(jsonDecode(rawResult));
    } catch (e) {
      print('ECCEZIONE');
      print(e);
      return null; // not the best solution
    }
  }

  Future<Utente?> getUserByEmail(String email) async {
    Map<String, String> params = Map();
    params["email"] = email;
    print('parameters: ' + params.toString());
    try {
      String rawResult = await _restManager.makeGetRequest(
          Constants.ADDRESS_STORE_SERVER,
          Constants.REQUEST_SEARCH_USER_BY_EMAIL,
          params,
          TypeHeader.json);
      print('model rawresult: ' + rawResult);
      return Utente.fromJson(jsonDecode(rawResult));
    } catch (e) {
      print('ECCEZIONE');
      print(e);
      return null; // not the best solution
    }
  }

  Future<List<Utente>> getAllUsers() async {
    Map<String, String> params = Map();
    return List<Utente>.from(jsonDecode(await _restManager.makeGetRequest(
            Constants.ADDRESS_STORE_SERVER,
            Constants.REQUEST_SEARCH_USERS,
            params,
            TypeHeader.json))
        .map((i) => Utente.fromJson(i))
        .toList());
  }

  Future<Utente?> updateUser(Utente utente) async {
    try {
      String rawResult = await _restManager.makePostRequest(
          Constants.ADDRESS_STORE_SERVER,
          Constants.REQUEST_UPDATE_USER,
          utente);

      return Utente.fromJson(jsonDecode(rawResult));
    } catch (e) {
      return null; // not the best solution
    }
  }

  Future<Prodotto?> addProduct(Prodotto prodotto) async {
    try {
      String rawResult = await _restManager.makePostRequest(
          Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_ADD_USER, prodotto);
      if (rawResult
          .contains(Constants.RESPONSE_ERROR_MAIL_USER_ALREADY_EXISTS)) {
        return null;
      } else {
        return Prodotto.fromJson(jsonDecode(rawResult));
      }
    } catch (e) {
      return null; // not the best solution
    }
  }

  Future<List<Prodotto>> getAllProdotti() async {
    Map<String, String> params = Map();
    List<Prodotto> ret = List<Prodotto>.from(jsonDecode(
            await _restManager.makeGetRequest(Constants.ADDRESS_STORE_SERVER,
                Constants.REQUEST_SEARCH_PRODUCTS, params, TypeHeader.json))
        .map((i) => Prodotto.fromJson(i))
        .toList());
    return ret;
  }

  Future<Prodotto?> getProdottoByNome(String nome) async {
    Map<String, String> params = Map();
    params["nome"] = nome;
    try {
      String rawResult = await _restManager.makeGetRequest(
          Constants.ADDRESS_STORE_SERVER,
          Constants.REQUEST_SEARCH_PRODUCTS_BY_NAME,
          params);

      return Prodotto.fromJson(jsonDecode(rawResult));
    } catch (e) {
      return null; // not the best solution
    }
  }

  Future<Prodotto?> getProdottoByCodice(int codice) async {
    Map<String, String> params = Map();
    params["codice"] = codice.toString();
    try {
      String rawResult = await _restManager.makeGetRequest(
          Constants.ADDRESS_STORE_SERVER,
          Constants.REQUEST_SEARCH_PRODUCTS_BY_CODICE,
          params);

      return Prodotto.fromJson(jsonDecode(rawResult));
    } catch (e) {
      return null; // not the best solution
    }
  }

  Future<List<Prodotto>?> getProdottotByMarca(String marca) async {
    Map<String, String> params = Map();
    params["marca"] = marca;
    try {
      return List<Prodotto>.from(json
          .decode(await _restManager.makeGetRequest(
              Constants.ADDRESS_STORE_SERVER,
              Constants.REQUEST_SEARCH_PRODUCTS_BY_MARCA,
              params,
              TypeHeader.json))
          .map((i) => Prodotto.fromJson(i))
          .toList());
    } catch (e) {
      return null; // not the best solution
    }
  }

  Future<List<Prodotto>?> getProdottoByCategoria(String categoria) async {
    print('model1');
    Map<String, String> params = Map();
    params["categoria"] = categoria;
    try {
      print('model2');
      List<Prodotto> ret = List<Prodotto>.from(json
          .decode(await _restManager.makeGetRequest(
              Constants.ADDRESS_STORE_SERVER,
              Constants.REQUEST_SEARCH_PRODUCTS_BY_CATEGORIA,
              params,
              TypeHeader.json))
          .map((i) => Prodotto.fromJson(i))
          .toList());
      print('model3');
      return ret;
    } catch (e) {
      return null; // not the best solution
    }
  }

  Future<Image> getIcon(String nome) async {
    Map<String, String> params = Map();
    params["image_path"] = nome + ".jpg";

    var response = await get(
        Uri.http("localhost:8443", Constants.REQUEST_GET_ICON, params));
    return Image.memory(response.bodyBytes);
  }

  Future<Ordine?> addOrdine(Ordine ordine) async {
    try {
      String rawResult = await _restManager.makePostRequest(
          Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_ADD_ORDINE, ordine);
      print('ORDINE rawResult: ' + rawResult);
      return Ordine.fromJson(jsonDecode(rawResult));
    } catch (e) {
      return null; // not the best solution
    }
  }

  Future<List<Ordine>> getAllOrdini() async {
    Map<String, String> params = Map();
    return List<Ordine>.from(jsonDecode(await _restManager.makeGetRequest(
            Constants.ADDRESS_STORE_SERVER,
            Constants.REQUEST_SEARCH_ORDINI,
            params,
            TypeHeader.json))
        .map((i) => Ordine.fromJson(i))
        .toList());
  }

  Future<List<Ordine>?> getOrdineByUtente(String email) async {
    Map<String, String> params = Map();
    params["email"] = email;
    try {
      String rawResult = await _restManager.makeGetRequest(
          Constants.ADDRESS_STORE_SERVER,
          Constants.REQUEST_SEARCH_ORDINE_BY_ACQUIRENTE,
          params,
          TypeHeader.json);
      print('RAW RESULT getOrdineAcquirente: ' + rawResult);
      List<Ordine> temp = List<Ordine>.from(json.decode(rawResult).map((i) => Ordine.fromJson(i)).toList());
      return temp;
    } catch (e) {
      print('ECCEZIONEE: ' + e.toString());
      return null; // not the best solution
    }
  }

  Future<Ordine?> getOrdineByDataAcquisto(String dataAcquisto) async {
    Map<String, String> params = Map();
    params["dataAcquisto"] = dataAcquisto;
    try {
      String rawResult = await _restManager.makeGetRequest(
          Constants.ADDRESS_STORE_SERVER,
          Constants.REQUEST_SEARCH_ORDINE_BY_ACQUIRENTE,
          params);

      return Ordine.fromJson(jsonDecode(rawResult));
    } catch (e) {
      return null; // not the best solution
    }
  }
}
