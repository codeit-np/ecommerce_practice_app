class LoginModel {
    LoginModel({
        required this.success,
        required this.token,
        required this.message,
    });

    final dynamic success;
    final String? token;
    final String? message;

    factory LoginModel.fromJson(Map<String, dynamic> json){ 
        return LoginModel(
            success: json["success"],
            token: json["token"],
            message: json["message"],
        );
    }

}
