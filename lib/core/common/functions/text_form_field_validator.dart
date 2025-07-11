enum TextFormFieldEnums {
  email,
  password,
  fullName,
  categories,
  title,
  price,
  description,
}

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
          return 'Please enter your name';
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
    case TextFormFieldEnums.title:
      return (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the title';
        }
        return null;
      };
    case TextFormFieldEnums.price:
      return (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the price';
        } else if (double.tryParse(value) == null) {
          return 'Please enter a valid number';
        } else if (double.parse(value) <= 0) {
          return 'Price must be greater than 0';
        }
        return null;
      };
    case TextFormFieldEnums.description:
      return (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the description';
        }
        return null;
      };
  }
}
