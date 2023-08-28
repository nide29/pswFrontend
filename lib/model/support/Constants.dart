class Constants {
  //App Info
  static final String APP_VERSION = '0.0.1';
  static final String APP_NAME = 'obiettivamenteStore';

  //addresses
  static final String ADDRESS_STORE_SERVER = "localhost:8443";
  static final String ADDRESS_AUTHENTICATION_SERVER = "localhost:8080";

  // authentication
  static final String REALM = "psw-realm";
  static final String CLIENT_ID = "psw-admin-client";
  static final String CLIENT_SECRET = "";
  static final String REQUEST_LOGIN =
      "/auth/realms/" + REALM + "/protocol/openid-connect/token";
  static final String REQUEST_LOGOUT =
      "/auth/realms/" + REALM + "/protocol/openid-connect/logout";

  // requests
  static final String REQUEST_SEARCH_PRODUCTS = "/prodotto";
  static final String REQUEST_SEARCH_PRODUCTS_BY_NAME = "/prodotto/nome";
  static final String REQUEST_SEARCH_PRODUCTS_BY_MARCA = "/prodotto/marca";
  static final String REQUEST_SEARCH_PRODUCTS_BY_CODICE =
      "/prodotto/cerca/codice";
  static final String REQUEST_SEARCH_PRODUCTS_BY_CATEGORIA =
      "/prodotto/categoria";
  static final String REQUEST_GET_ICON = "/prodotto/icon";
  static final String REQUEST_ADD_PRODUCT = "/prodotto";
  static final String REQUEST_ADD_USER = "/utente";
  static final String REQUEST_DELETE_USER = "/utente/id";
  static final String REQUEST_SEARCH_USERS = "/utente";
  static final String REQUEST_UPDATE_USER = "/utente";
  static final String REQUEST_SEARCH_USER_BY_EMAIL = "/utente/email";
  static final String REQUEST_ADD_ORDINE = "/ordine";
  static final String REQUEST_SEARCH_ORDINI = "/ordine";
  static final String REQUEST_SEARCH_ORDINE_BY_ACQUIRENTE =
      "/ordine/acquirente";
  static final String REQUEST_SEARCH_ORDINE_BY_DATA_ACQUISTO =
      "/ordine/dataAcquisto";

  // states
  static final String STATE_CLUB = "club";

  // responses
  static final String RESPONSE_ERROR_MAIL_USER_ALREADY_EXISTS =
      "ERROR_MAIL_USER_ALREADY_EXISTS";

  // messages
  static final String MESSAGE_CONNECTION_ERROR = "connection_error";
}//Constants
