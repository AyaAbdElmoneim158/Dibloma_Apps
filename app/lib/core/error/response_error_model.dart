// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponseError {
 final String message;
  final String error;
  final int statusCode;
  ResponseError({
    required this.message,
    required this.error,
    required this.statusCode,
  });

  

  ResponseError copyWith({
    String? message,
    String? error,
    int? statusCode,
  }) {
    return ResponseError(
      message: message ?? this.message,
      error: error ?? this.error,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'error': error,
      'statusCode': statusCode,
    };
  }

  factory ResponseError.fromMap(Map<String, dynamic> map) {
    return ResponseError(
      message: map['message'] as String,
      error: map['error'] as String,
      statusCode: map['statusCode'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseError.fromJson(String source) => ResponseError.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ResponseError(message: $message, error: $error, statusCode: $statusCode)';

  @override
  bool operator ==(covariant ResponseError other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      other.error == error &&
      other.statusCode == statusCode;
  }

  @override
  int get hashCode => message.hashCode ^ error.hashCode ^ statusCode.hashCode;
}
