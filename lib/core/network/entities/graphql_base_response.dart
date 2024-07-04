class GraphqlBaseResponse<T> {
  final T? data;
  final String? message;
  final bool successful;

  GraphqlBaseResponse({this.data, this.message, required this.successful});
}
