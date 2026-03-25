abstract class KarotterException implements Exception {
  const KarotterException(this.statusCode, this.message);

  final int statusCode;
  final String? message;

  @override
  String toString() {
    return 'KarotterException{statusCode: $statusCode, message: $message}';
  }
}

class KarotterServerException extends KarotterException {
  const KarotterServerException(super.statusCode, String super.message);

  @override
  String toString() {
    return 'KarotterServerException{statusCode: $statusCode, message: $message}';
  }
}

class KarotterClientException extends KarotterException {
  const KarotterClientException(super.statusCode, String super.message);

  @override
  String toString() {
    return 'KarotterClientException{statusCode: $statusCode, message: $message}';
  }
}
