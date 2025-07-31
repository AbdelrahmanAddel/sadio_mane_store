class UsersGraphql {
  UsersGraphql._();
  static Map<String, dynamic> getUsers() {
    return {
      'query': '''
{
  users{
		id
		name
		email
  }
}
''',
    };
  }

  static Map<String, dynamic> deleteUserById({required int userId}) {
    return {
      'query': r'''

 mutation deleteUser($id: ID!){
	deleteUser(id:$id )


}
''',
      'variables': {'id': userId},
    };
  }
}
