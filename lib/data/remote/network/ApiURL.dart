
class ApiURL {

  ApiURL();
  static const String _baseURL = "https://my-json-server.typicode.com/rzkbrian/public_db";

  static const String userUrl = _baseURL + "/profile";
  static const String friends = _baseURL + "/users";
  static const String posts = _baseURL + "/posts";

  static const String authURL = "https://www.codeapp.us/api.php";

}