class Result<T> {
  bool success;
  String? message;
  String? errCode;
  T? response;

  Result({
    required this.success,
    this.message,
    this.errCode,
    this.response,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      success: json['success'],
      message: json['message'],
      errCode: json['errCode'],
      response: json['response'],
    );
  }
}