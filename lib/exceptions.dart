abstract class KarotatorException implements Exception {
  const KarotatorException(this.statusCode, this.message);

  final int statusCode;
  final String? message;

  @override
  String toString() {
    return 'KarotatorException{statusCode: $statusCode, message: $message}';
  }
}

class KarotterServerException extends KarotatorException {
  const KarotterServerException(super.statusCode, String super.message);

  @override
  String toString() {
    return 'KarotterServerException{statusCode: $statusCode, message: $message}';
  }
}

class KarotterClientException extends KarotatorException {
  const KarotterClientException(super.statusCode, String super.message);

  @override
  String toString() {
    return 'KarotterClientException{statusCode: $statusCode, message: $message}';
  }
}
