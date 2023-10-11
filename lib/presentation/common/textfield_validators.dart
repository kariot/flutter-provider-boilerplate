String? getUsernameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username should not be empty';
  }
  return null;
}

String? getPasswordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password should not be empty';
  }
  return null;
}
