enum TextFormFieldEnums { email, password, fullName, categories }

String? Function(String?)? textFormFieldValidator(TextFormFieldEnums field) {
  switch (field) {
    case TextFormFieldEnums.email:
      return (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      };
    case TextFormFieldEnums.password:
      return (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 6) {
          return 'Please enter a valid password';
        }
        return null;
      };
    case TextFormFieldEnums.fullName:
      return (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Name';
        }
        return null;
      };
    case TextFormFieldEnums.categories:
      return (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the category name';
        }
        return null;
      };
  }
}
