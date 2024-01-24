import 'package:equatable/equatable.dart';

class APIException extends Equatable implements Exception {
  final dynamic message;
  final int statusCode;

  const APIException({required this.message, required this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class CacheException extends Equatable implements Exception {
  final String message;

  const CacheException({required this.message});

  @override
  List<Object?> get props => [message];
}
