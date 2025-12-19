abstract class AuthRepository {
  //signUp
  Future<void> signUp(String email, String username, String password);
  //sign In
  Future<void> signIn(String email, String password);
  //signOut
  Future<void> signOut();
}
