import 'package:equatable/equatable.dart';

class UploadedFileEntity extends Equatable{
  final int id;
  final String url;
  final String ref;

  const UploadedFileEntity({required this.id, required this.url, required this.ref});

  @override
  List<Object?> get props => [id];

}