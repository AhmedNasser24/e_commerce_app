abstract class AuthRepo {
  Future < Either < void , Failure >> login (String email , String password);
  Future < Either < void , Failure >> register (String name , String email , String password , String whatsappNumber , String accountKind);
}