class NetworkResponse {
  final int? responseCode;
  final String? errorMessage;
  final dynamic responseData;
  final bool isSuccess;

  NetworkResponse({
    required this.responseCode,
    required this.isSuccess,
    this.errorMessage = 'Somthing went wrong',
    this.responseData,
  });
}
