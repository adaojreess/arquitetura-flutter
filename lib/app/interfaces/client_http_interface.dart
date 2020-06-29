abstract class ICLientHttp {
  void addToken(String token);
  
  Future get(String url);
}