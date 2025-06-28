import 'package:sadio_mane_store/features/sign_up/data/model/sign_up_request_model.dart';

class SignUpQureys {
  SignUpQureys._();
  static Map<String, dynamic> signUpQureys({
    required SignUpRequestModel signRequestModel,
  }) {
    return {
      'query': r'''
mutation AddUser ($name: String!, $email: String!, $password: String!, $avatar: String!) {
	addUser(
		data: {
			name: $name
			email: $email
			password: $password
			avatar: $avatar
            role: customer
		}
	) {
		id
		name
	}
}



''',
      'variables': {
        'name': signRequestModel.fullName,
        'email': signRequestModel.email,
        'password': signRequestModel.password,
        'avatar': signRequestModel.userAvatar,
      },
    };
  }
}
