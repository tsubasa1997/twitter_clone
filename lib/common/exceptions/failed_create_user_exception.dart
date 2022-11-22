class FailedCreateUserException implements Exception {
  const FailedCreateUserException(this.name);

  final String name;

  String get message => '!!FailedCreateUserException!!\n'
      'create user: $name is failed';

  @override
  String toString() => message;
}
