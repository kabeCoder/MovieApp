class ApiResult<T> {
  final T? data;
  final String? error;

  ApiResult({this.data, this.error});
}
