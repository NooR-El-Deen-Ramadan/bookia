import 'data.dart';

class CartResponse {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  CartResponse({this.data, this.message, this.error, this.status});

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];

    return CartResponse(
      data: rawData == null
          ? null
          : rawData is Map<String, dynamic>
              ? Data.fromJson(rawData)
              : null, // fallback if it's List (to avoid crash)
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'message': message,
        'error': error,
        'status': status,
      };
}
