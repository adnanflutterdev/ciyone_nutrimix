class ProductModel {
  final String id;
  final String title;
  final String image;
  final String? subTitle;
  final int price;
  final int discount;
  final Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.image,
    this.subTitle,
    required this.price,
    required this.discount,
    required this.rating,
  });

  factory ProductModel.fromJson(Map product) {
    return ProductModel(
      id: product['id'],
      title: product['title'],
      subTitle: product['subTitle'],
      image: product['image'],
      price: product['price'],
      discount: product['discount'],
      rating: Rating.fromJson(product['rating']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'title': title,
      'subTitle': subTitle,
      'image': image,
      'price': price,
      'discount': discount,
      'rating': rating.toJson(),
    };
  }
}

class Rating {
  final double average;
  final int ratings;
  final List userIds;

  Rating({required this.average, required this.ratings, required this.userIds});

  factory Rating.fromJson(Map rating) {
    return Rating(
      average: rating['average'],
      ratings: rating['ratings'],
      userIds: rating['userIds'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'average': average, 'ratings': ratings, 'userIds': userIds};
  }
}
