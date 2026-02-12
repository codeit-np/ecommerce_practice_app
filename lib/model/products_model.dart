class ProductsModel {
    ProductsModel({
        required this.success,
        required this.data,
    });

    final bool? success;
    final List<Datum> data;

    factory ProductsModel.fromJson(Map<String, dynamic> json){ 
        return ProductsModel(
            success: json["success"],
            data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        );
    }

}

class Datum {
    Datum({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercent,
        required this.discountAmount,
        required this.discountedPrice,
        required this.image,
        required this.category,
    });

    final int? id;
    final String? title;
    final String? description;
    final dynamic price;
    final String? discountPercent;
    final dynamic discountAmount;
    final dynamic discountedPrice;
    final String? image;
    final String? category;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
            id: json["id"],
            title: json["title"],
            description: json["description"],
            price: json["price"],
            discountPercent: json["discount_percent"],
            discountAmount: json["discount_amount"],
            discountedPrice: json["discounted_price"],
            image: json["image"],
            category: json["category"],
        );
    }

}
