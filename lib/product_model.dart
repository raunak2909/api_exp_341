class DimensionModel {
  double? depth;
  double? height;
  double? width;

  DimensionModel(
      {required this.depth, required this.height, required this.width});

  factory DimensionModel.fromJson(Map<String, dynamic> json) => DimensionModel(
      depth: json["depth"], height: json["height"], width: json["width"]);
}

class ReviewModel {
  String? comment;
  String? date;
  String? reviewerEmail;
  String? reviewerName;
  num? rating;

  ReviewModel(
      {required this.date,
      required this.comment,
      required this.reviewerEmail,
      required this.reviewerName,
      required this.rating});

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        date: json["date"],
        comment: json["comment"],
        reviewerEmail: json["reviewerEmail"],
        reviewerName: json["reviewerName"],
        rating: json["rating"],
      );
}

class MetaModel {
  String? barcode;
  String? createdAt;
  String? qrCode;
  String? updatedAt;

  MetaModel(
      {required this.createdAt,
      required this.barcode,
      required this.qrCode,
      required this.updatedAt});

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
      createdAt: json["createdAt"],
      barcode: json["barcode"],
      qrCode: json["qrCode"],
      updatedAt: json["updatedAt"]);
}

class ProductModel {
  String? availabilityStatus;
  String? brand;
  String? category;
  String? description;
  DimensionModel? dimensions;
  double? discountPercentage;
  int? id;
  List<dynamic>? images;
  MetaModel? meta;
  int? minimumOrderQuantity;
  num? price;
  num? rating;
  String? returnPolicy;
  List<ReviewModel>? reviews;
  String? shippingInformation;
  String? sku;
  int? stock;
  List<dynamic>? tags;
  String? thumbnail;
  String? title;
  String? warrantyInformation;
  num? weight;

  ProductModel(
      {required this.availabilityStatus,
      required this.brand,
      required this.category,
      required this.description,
      required this.dimensions,
      required this.discountPercentage,
      required this.id,
      required this.images,
      required this.meta,
      required this.minimumOrderQuantity,
      required this.price,
      required this.rating,
      required this.returnPolicy,
      required this.reviews,
      required this.shippingInformation,
      required this.sku,
      required this.stock,
      required this.tags,
      required this.thumbnail,
      required this.title,
      required this.warrantyInformation,
      required this.weight});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<ReviewModel> mReviews = [];

    for (Map<String, dynamic> eachReview in json['reviews']) {
      mReviews.add(ReviewModel.fromJson(eachReview));
    }

    return ProductModel(
        availabilityStatus: json['availabilityStatus'],
        brand: json['brand'],
        category: json['category'],
        description: json['description'],
        dimensions: DimensionModel.fromJson(json['dimensions']),
        discountPercentage: json['discountPercentage'],
        id: json['id'],
        images: json['images'],
        meta: MetaModel.fromJson(json['meta']),
        minimumOrderQuantity: json['minimumOrderQuantity'],
        price: json['price'],
        rating: json['rating'],
        returnPolicy: json['returnPolicy'],
        reviews: mReviews,
        shippingInformation: json['shippingInformation'],
        sku: json['sku'],
        stock: json['stock'],
        tags: json['tags'],
        thumbnail: json['thumbnail'],
        title: json['title'],
        warrantyInformation: json['warrantyInformation'],
        weight: json['weight']);
  }
}

class DataProductModel {
  int? limit;
  int? skip;
  int? total;
  List<ProductModel>? products;

  DataProductModel(
      {required this.limit,
      required this.skip,
      required this.total,
      required this.products});

  factory DataProductModel.fromJson(Map<String, dynamic> json){

    List<ProductModel> mProducts = [];

    for(Map<String, dynamic> eachProduct in json['products']){
      mProducts.add(ProductModel.fromJson(eachProduct));
    }

    return DataProductModel(
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
        products: mProducts);
  }
}
