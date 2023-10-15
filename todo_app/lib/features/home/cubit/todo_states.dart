import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInit extends TodoState {} 

class TodoLoading extends TodoState {} 

class TodoSuccess extends TodoState {}

class TodoError extends TodoState {
  final String errorMsg;
  const TodoError({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
