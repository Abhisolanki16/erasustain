class LogOutResponse {
  final String code;
  final String message;
  final String data;

  LogOutResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory LogOutResponse.fromJson(Map<String, dynamic> json) => LogOutResponse(
        code: json["code"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data,
      };
}
