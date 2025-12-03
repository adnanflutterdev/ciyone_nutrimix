class Product {
  final String id;
  final String title;
  final String by;
  final Rating rating;
  final Pricing pricing;
  final CurrentVarient currentVarient;
  final String primaryCategory;
  final String secondaryCategory;
  final String tertiaryCategory;
  final List<String>? baseImages;
  final Info info;
  final List<VarientImages> varientImages;
  final List<VarientProducts> varientProducts;

  Product({
    required this.id,
    required this.by,
    required this.title,
    required this.rating,
    required this.pricing,
    required this.currentVarient,
    required this.primaryCategory,
    required this.secondaryCategory,
    required this.tertiaryCategory,
    this.baseImages,
    required this.info,
    required this.varientImages,
    required this.varientProducts,
  });

  factory Product.fromJson(Map<String, dynamic> product) {
    return Product(
      id: product['id'],
      by: product['by'],
      title: product['title'],
      currentVarient: CurrentVarient.fromJson(product['currentVarient']),
      rating: Rating.fromJson(product['rating']),
      pricing: Pricing.fromJson(product['pricing']),
      primaryCategory: product['primaryCategory'],
      secondaryCategory: product['secondaryCategory'],
      tertiaryCategory: product['tertiaryCategory'],
      info: Info.fromJson(product['info']),
      varientImages: (product['varientImages'] as List<dynamic>)
          .map(
            (varient) =>
                VarientImages.fromJson(varient as Map<String, dynamic>),
          )
          .toList(),
      varientProducts: (product['varientProducts'] as List<dynamic>)
          .map(
            (varient) =>
                VarientProducts.fromJson(varient as Map<String, dynamic>),
          )
          .toList(),
      baseImages: (product['baseImages'] as List<dynamic>)
          .map((url) => url.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'by': by,
      'title': title,
      'rating': rating.toJson(),
      'currentVarient': currentVarient.toJson(),
      'pricing': pricing.toJson(),
      'primaryCategory': primaryCategory,
      'secondaryCategory': secondaryCategory,
      'tertiaryCategory': tertiaryCategory,
      'info': info.toJson(),
      'varientImages': varientImages
          .map((varients) => varients.toJson())
          .toList(),
      'varientProducts': varientProducts
          .map((varients) => varients.toJson())
          .toList(),
      'baseImages': baseImages,
    };
  }
}

class CurrentVarient {
  final String label;
  final String value;

  CurrentVarient({required this.label, required this.value});
  factory CurrentVarient.fromJson(Map<String, dynamic> varient) {
    return CurrentVarient(
      label: varient['label'] ?? '',
      value: varient['value'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'label': label, 'value': value};
  }
}

class Rating {
  final int ratings;
  final double average;
  final int oneStars;
  final int twoStars;
  final int threeStars;
  final int fourStars;
  final int fiveStars;

  Rating({
    this.ratings = 0,
    this.average = 0,
    this.oneStars = 0,
    this.twoStars = 0,
    this.threeStars = 0,
    this.fourStars = 0,
    this.fiveStars = 0,
  });

  factory Rating.fromJson(Map<String, dynamic> rating) {
    return Rating(
      ratings: rating['ratings'],
      average: rating['average'],
      oneStars: rating['oneStars'],
      twoStars: rating['twoStars'],
      threeStars: rating['threeStars'],
      fourStars: rating['fourStars'],
      fiveStars: rating['fiveStars'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ratings': ratings,
      'average': average,
      'oneStars': oneStars,
      'twoStars': twoStars,
      'threeStars': threeStars,
      'fourStars': fourStars,
      'fiveStars': fiveStars,
    };
  }
}

class Pricing {
  final int mrp;
  final int price;
  final int discountPercentage;

  Pricing({
    required this.mrp,
    required this.price,
    required this.discountPercentage,
  });

  factory Pricing.fromJson(Map<String, dynamic> pricing) {
    return Pricing(
      mrp: pricing['mrp'].toInt(),
      price: pricing['price'].toInt(),
      discountPercentage: pricing['discountPercentage'].toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mrp': mrp,
      'price': price,
      'discountPercentage': discountPercentage,
    };
  }
}

class Info {
  final List<String> benefits;
  final List<Extras> extras;

  Info({required this.benefits, required this.extras});
  factory Info.fromJson(Map<String, dynamic> info) {
    return Info(
      benefits: (info['benefits'] as List<dynamic>)
          .map((benefit) => benefit.toString())
          .toList(),
      extras: (info['extras'] as List<dynamic>)
          .map((extra) => Extras.fromJson(extra as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'benefits': benefits,
      'extras': extras.map((extra) => extra.toJson()).toList(),
    };
  }
}

class Extras {
  final String label;
  final String value;

  Extras({required this.label, required this.value});
  factory Extras.fromJson(Map<String, dynamic> extras) {
    return Extras(label: extras['label'] ?? '', value: extras['value'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'label': label, 'value': value};
  }
}

class VarientImages {
  final String label;
  final String value;
  final List<String> images;

  VarientImages({
    required this.label,
    required this.value,
    required this.images,
  });
  factory VarientImages.fromJson(Map<String, dynamic> varient) {
    return VarientImages(
      label: varient['label'],
      value: varient['value'],
      images: (varient['images'] as List<dynamic>)
          .map((image) => image.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'label': label, 'value': value, 'images': images};
  }
}

class VarientProducts {
  final String label;
  final String value;
  final String varientId;

  VarientProducts({
    required this.label,
    required this.value,
    required this.varientId,
  });
  factory VarientProducts.fromJson(Map<String, dynamic> varients) {
    return VarientProducts(
      label: varients['label'] ?? '',
      value: varients['value'] ?? '',
      varientId: varients['varientId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'label': label, 'value': value, 'varientId': varientId};
  }
}
