class SuccessModel {
    SuccessModel({
        required this.success,
        required this.message,
    });

    final bool? success;
    final String? message;

    factory SuccessModel.fromJson(Map<String, dynamic> json){ 
        return SuccessModel(
            success: json["success"],
            message: json["message"],
        );
    }

}
