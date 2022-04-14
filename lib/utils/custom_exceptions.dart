class ValueException implements Exception {
  String message;

  ValueException({this.message = 'Invalid value'});

  @override
  String toString() {
    return message;
  }
}
