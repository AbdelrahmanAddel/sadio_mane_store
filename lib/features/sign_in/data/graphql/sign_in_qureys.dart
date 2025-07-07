import 'package:sadio_mane_store/features/sign_in/data/model/sign_in_request_body.dart';

class SignInQureys {
  SignInQureys._();
  static final SignInQureys instance = SignInQureys._();

  static Map<String, dynamic> signInQureys(SignInRequestBody signInRequestBody) {
    return {
      // ignore: leading_newlines_in_multiline_strings
      'query': r''' 
      mutation Login ($email: String!, $password: String!){
        login(email: $email, password: $password){
        access_token
        refresh_token
      }
    }    
      ''',
      'variables': {
        'email': signInRequestBody.email,
        'password': signInRequestBody.password,
      },
    };
  }
}
