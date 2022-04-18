class CommonResponse {
  final String status;
  final String message;
  final dynamic data;

  CommonResponse(
      {required this.status, required this.message, required this.data});

  factory CommonResponse.fromJson(Map<String, dynamic> json) => CommonResponse(
        status: json['status'],
        message: json['message'] ?? '',
        data: json['data'],
      );
}
