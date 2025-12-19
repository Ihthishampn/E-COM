class AuthModel {
  final String uid;
  final String userName;
  final String email;
  final DateTime createdAt;


  AuthModel({required this.uid, required this.userName, required this.email, required this.createdAt});

  //to

  Map<String,dynamic> toFirebase()=> {

  "uid": uid,
  "UserName": userName,
  "email": email,
  "dateTime": createdAt.toIso8601String(),




  };
}
