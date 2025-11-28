import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:uuid/uuid.dart';

final List<NewProductModel> newProducts = [
  // Sports Nutrition/Proteins/Whey Proteins
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'MuscleBlaze',
    title: 'MuscleBlaze Biozyme Performance Whey',
    currentVarient: CurrentVarient(label: 'Weight', value: '2KG'),
    rating: Rating(
      average: 4.4,
      ratings: 3952,
      oneStars: 42,
      twoStars: 60,
      threeStars: 100,
      fourStars: 900,
      fiveStars: 2850,
    ),
    pricing: Pricing(mrp: 5609, price: 4899, discountPercentage: 12),
    primaryCategory: 'Sports Nutrition',
    secondaryCategory: 'Proteins',
    tertiaryCategory: 'Whey Proteins',
    info: Info(
      benefits: ['Helps in Muscle Building'],
      extras: [
        Extras(label: 'Protein', value: '25 g'),
        Extras(label: 'BCAA', value: '5.51 g'),
        Extras(label: 'EAA', value: '11.75 g'),
        Extras(label: 'Glutamic acid', value: '4.38 g'),
        Extras(label: 'Kcal', value: '139.61'),
        Extras(label: 'Protein % per Serving', value: '69.0'),
      ],
    ),
    baseImages: [
      'https://img4.hkrtcdn.com/41387/prd_4138663-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Rich-Chocolate_o.jpg',
      'https://img8.hkrtcdn.com/41387/prd_4138667-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Rich-Chocolate_o.jpg',
      'https://img10.hkrtcdn.com/39076/prd_3907559-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Rich-Chocolate_o.jpg',
    ],
    varientImages: [
      VarientImages(
        label: 'Flavour',
        value: 'Rich Chocolate',
        images: [
          'https://img6.hkrtcdn.com/39076/prd_3907565-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Rich-Chocolate_o.jpg',
          'https://img2.hkrtcdn.com/41388/prd_4138721-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Rich-Chocolate_o.jpg',
          'https://img10.hkrtcdn.com/41387/prd_4138659-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Rich-Chocolate_o.jpg',
          'https://img6.hkrtcdn.com/41388/prd_4138725-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Rich-Chocolate_o.jpg',
        ],
      ),
      VarientImages(
        label: 'Flavour',
        value: 'Butter Cookie',
        images: [
          'https://img2.hkrtcdn.com/41686/prd_4168521-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Butter-Cookie_o.jpg',
          'https://img10.hkrtcdn.com/41685/prd_4168469-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Butter-Cookie_o.jpg',
          'https://img2.hkrtcdn.com/41685/prd_4168471-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Butter-Cookie_o.jpg',
          'https://img8.hkrtcdn.com/41685/prd_4168477-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Butter-Cookie_o.jpg',
        ],
      ),
      VarientImages(
        label: 'Flavour',
        value: 'Kesar Thandai',
        images: [
          'https://img2.hkrtcdn.com/41684/prd_4168381-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Kesar-Thandai_o.jpg',
          'https://img6.hkrtcdn.com/41684/prd_4168335-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Kesar-Thandai_o.jpg',
          'https://img8.hkrtcdn.com/41684/prd_4168337-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Kesar-Thandai_o.jpg',
          'https://img8.hkrtcdn.com/41685/prd_4168427-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Kesar-Thandai_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'MuscleBlaze',
    title: 'MuscleBlaze Biozyme Performance Whey',
    currentVarient: CurrentVarient(label: 'Weight', value: '1KG'),
    rating: Rating(
      average: 4.4,
      ratings: 3952,
      oneStars: 42,
      twoStars: 60,
      threeStars: 100,
      fourStars: 900,
      fiveStars: 2850,
    ),
    pricing: Pricing(mrp: 2989, price: 2629, discountPercentage: 12),
    primaryCategory: 'Sports Nutrition',
    secondaryCategory: 'Proteins',
    tertiaryCategory: 'Whey Proteins',
    info: Info(
      benefits: ['Helps in Muscle Building'],
      extras: [
        Extras(label: 'Protein', value: '25 g'),
        Extras(label: 'BCAA', value: '5.51 g'),
        Extras(label: 'EAA', value: '11.75 g'),
        Extras(label: 'Glutamic acid', value: '4.38 g'),
        Extras(label: 'Kcal', value: '139.61'),
        Extras(label: 'Protein % per Serving', value: '69.0'),
      ],
    ),
    baseImages: [
      'https://img4.hkrtcdn.com/41387/prd_4138663-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Rich-Chocolate_o.jpg',
      'https://img8.hkrtcdn.com/41387/prd_4138667-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Rich-Chocolate_o.jpg',
      'https://img10.hkrtcdn.com/39076/prd_3907559-MuscleBlaze-Biozyme-Performance-Whey-4.4-lb-Rich-Chocolate_o.jpg',
    ],
    varientImages: [
      VarientImages(
        label: 'Flavour',
        value: 'Rich Chocolate',
        images: [
          'https://img10.hkrtcdn.com/41389/prd_4138859_o.jpg',
          'https://img10.hkrtcdn.com/41387/prd_4138669-MuscleBlaze-Biozyme-Performance-Whey-2.2-lb-Rich-Chocolate_o.jpg',
          'https://img2.hkrtcdn.com/41387/prd_4138671-MuscleBlaze-Biozyme-Performance-Whey-2.2-lb-Rich-Chocolate_o.jpg',
          'https://img2.hkrtcdn.com/41388/prd_4138731-MuscleBlaze-Biozyme-Performance-Whey-2.2-lb-Rich-Chocolate_o.jpg',
        ],
      ),
      VarientImages(
        label: 'Flavour',
        value: 'Chocolate Hazelnut',
        images: [
          'https://img6.hkrtcdn.com/41684/prd_4168325-MuscleBlaze-Biozyme-Performance-Whey-2.2-lb-Chocolate-Hazelnut_o.jpg',
          'https://img4.hkrtcdn.com/41684/prd_4168323-MuscleBlaze-Biozyme-Performance-Whey-2.2-lb-Chocolate-Hazelnut_o.jpg',
          'https://img8.hkrtcdn.com/41684/prd_4168327-MuscleBlaze-Biozyme-Performance-Whey-2.2-lb-Chocolate-Hazelnut_o.jpg',
          'https://img10.hkrtcdn.com/41684/prd_4168379-MuscleBlaze-Biozyme-Performance-Whey-2.2-lb-Chocolate-Hazelnut_o.jpg',
        ],
      ),
      VarientImages(
        label: 'Flavour',
        value: 'Magical Mango',
        images: [
          'https://img4.hkrtcdn.com/41684/prd_4168303-MuscleBlaze-Biozyme-Performance-Whey-2.2-lb-Magical-Mango_o.jpg',
          'https://img10.hkrtcdn.com/41684/prd_4168359-MuscleBlaze-Biozyme-Performance-Whey-2.2-lb-Magical-Mango_o.jpg',
          'https://img2.hkrtcdn.com/41684/prd_4168361-MuscleBlaze-Biozyme-Performance-Whey-2.2-lb-Magical-Mango_o.jpg',
          'https://img6.hkrtcdn.com/41684/prd_4168365-MuscleBlaze-Biozyme-Performance-Whey-2.2-lb-Magical-Mango_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'ON',
    title: 'ON (Optimum Nutrition) Gold Standard 100% Whey Protein',
    currentVarient: CurrentVarient(label: 'Weight', value: '2.27KG'),
    rating: Rating(
      average: 4.4,
      ratings: 3676,
      oneStars: 86,
      twoStars: 100,
      threeStars: 200,
      fourStars: 1000,
      fiveStars: 2280,
    ),
    pricing: Pricing(mrp: 9299, price: 6999, discountPercentage: 24),
    primaryCategory: 'Sports Nutrition',
    secondaryCategory: 'Proteins',
    tertiaryCategory: 'Whey Proteins',
    info: Info(
      benefits: [
        'Comprise of  WPI',
        'Helps in Muscle Building',
        'Generally Consumed With Water or Milk',
      ],
      extras: [
        Extras(label: 'Protein', value: '24 g'),
        Extras(label: 'Protein % per Serving', value: '79.0'),
      ],
    ),
    baseImages: [
      'https://img8.hkrtcdn.com/41395/prd_4139437-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-5-lb-Vanilla-Ice-Cream_o.jpg',
      'https://img4.hkrtcdn.com/41394/prd_4139363-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-5-lb-Vanilla-Ice-Cream_o.jpg',
      'https://img6.hkrtcdn.com/41394/prd_4139365-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-5-lb-Vanilla-Ice-Cream_o.jpg',
    ],
    varientImages: [
      VarientImages(
        label: 'Flavour',
        value: 'Double Rich Chocolate',
        images: [
          'https://img2.hkrtcdn.com/41395/prd_4139401-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-5-lb-Double-Rich-Chocolate_o.jpg',
          'https://img8.hkrtcdn.com/41395/prd_4139407-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-5-lb-Double-Rich-Chocolate_o.jpg',
          'https://img10.hkrtcdn.com/41395/prd_4139419-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-5-lb-Double-Rich-Chocolate_o.jpg',
          'https://img2.hkrtcdn.com/41395/prd_4139421-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-5-lb-Double-Rich-Chocolate_o.jpg',
        ],
      ),
      VarientImages(
        label: 'Flavour',
        value: 'Vanilla Ice Cream',
        images: [
          'https://img8.hkrtcdn.com/41394/prd_4139357-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-5-lb-Vanilla-Ice-Cream_o.jpg',
          'https://img10.hkrtcdn.com/41394/prd_4139359-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-5-lb-Vanilla-Ice-Cream_o.jpg',
          'https://img10.hkrtcdn.com/41395/prd_4139439-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-5-lb-Vanilla-Ice-Cream_o.jpg',
          'https://img10.hkrtcdn.com/41394/prd_4139369-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-5-lb-Vanilla-Ice-Cream_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'ON',
    title: 'ON (Optimum Nutrition) Gold Standard 100% Whey Protein',
    currentVarient: CurrentVarient(label: 'Weight', value: '455G'),
    rating: Rating(
      average: 4.4,
      ratings: 3676,
      oneStars: 86,
      twoStars: 100,
      threeStars: 200,
      fourStars: 1000,
      fiveStars: 2280,
    ),
    pricing: Pricing(mrp: 9299, price: 6999, discountPercentage: 24),
    primaryCategory: 'Sports Nutrition',
    secondaryCategory: 'Proteins',
    tertiaryCategory: 'Whey Proteins',
    info: Info(
      benefits: ['Helps in Muscle Building'],
      extras: [
        Extras(label: 'Protein', value: '24 g'),
        Extras(label: 'BCAA', value: '5.5 g'),
        Extras(label: 'Glutamic acid', value: '4 g'),
        Extras(label: 'Kcal', value: '121'),
        Extras(label: 'Protein % per Serving', value: '77.0'),
      ],
    ),
    baseImages: [
      'https://img8.hkrtcdn.com/41395/prd_4139437-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-5-lb-Vanilla-Ice-Cream_o.jpg',
      'https://img4.hkrtcdn.com/41394/prd_4139363-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-5-lb-Vanilla-Ice-Cream_o.jpg',
      'https://img6.hkrtcdn.com/41394/prd_4139365-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-5-lb-Vanilla-Ice-Cream_o.jpg',
    ],
    varientImages: [
      VarientImages(
        label: 'Flavour',
        value: 'Double Rich Chocolate',
        images: [
          'https://img6.hkrtcdn.com/41385/prd_4138435-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-1-lb-Double-Rich-Chocolate_o.jpg',
          'https://img2.hkrtcdn.com/41384/prd_4138351-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-1-lb-Double-Rich-Chocolate_o.jpg',
          'https://img6.hkrtcdn.com/41384/prd_4138345-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-1-lb-Double-Rich-Chocolate_o.jpg',
          'https://img4.hkrtcdn.com/41384/prd_4138353-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-1-lb-Double-Rich-Chocolate_o.jpg',
        ],
      ),
      VarientImages(
        label: 'Flavour',
        value: 'Vanilla Ice Cream',
        images: [
          'https://img6.hkrtcdn.com/41384/prd_4138355-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-1-lb-Vanilla-Ice-Cream_o.jpg',
          'https://img6.hkrtcdn.com/41384/prd_4138365-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-1-lb-Vanilla-Ice-Cream_o.jpg',
          'https://img10.hkrtcdn.com/41384/prd_4138359-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-1-lb-Vanilla-Ice-Cream_o.jpg',
          'https://img8.hkrtcdn.com/41384/prd_4138367-ON-Optimum-Nutrition-Gold-Standard-100-Whey-Protein-1-lb-Vanilla-Ice-Cream_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
  //
  // Sports Nutrition/Gainers/Weight gainers
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'MuscleBlaze',
    title: 'MuscleBlaze Weight Gainer with Added Digezyme',
    currentVarient: CurrentVarient(label: 'Weight', value: '2KG'),
    rating: Rating(
      average: 4.5,
      ratings: 1142,
      oneStars: 12,
      twoStars: 20,
      threeStars: 50,
      fourStars: 300,
      fiveStars: 760,
    ),
    pricing: Pricing(mrp: 2669, price: 1559, discountPercentage: 12),
    primaryCategory: 'Sports Nutrition',
    secondaryCategory: 'Gainers',
    tertiaryCategory: 'Weight Gainers',
    info: Info(
      benefits: ['Helps in Gaining Weight', 'Generally Consumed With Milk'],
      extras: [],
    ),
    baseImages: [
      'https://img7.hkrtcdn.com/26450/prd_2644986-MuscleBlaze-Weight-Gainer-with-Added-Digezyme-6.6-lb-Chocolate_o.jpg',
      'https://img9.hkrtcdn.com/26450/prd_2644988-MuscleBlaze-Weight-Gainer-with-Added-Digezyme-6.6-lb-Chocolate_o.jpg',
      'https://img10.hkrtcdn.com/39212/prd_3921199-MuscleBlaze-Weight-Gainer-with-Added-Digezyme-6.6-lb-Chocolate_o.jpg',
    ],
    varientImages: [
      VarientImages(
        label: 'Flavour',
        value: 'Chocolate',
        images: [
          'https://img6.hkrtcdn.com/39212/prd_3921145-MuscleBlaze-Weight-Gainer-with-Added-Digezyme-4.4-lb-Chocolate_o.jpg',
          'https://img8.hkrtcdn.com/39212/prd_3921147-MuscleBlaze-Weight-Gainer-with-Added-Digezyme-4.4-lb-Chocolate_o.jpg',
          'https://img10.hkrtcdn.com/39212/prd_3921149-MuscleBlaze-Weight-Gainer-with-Added-Digezyme-4.4-lb-Chocolate_o.jpg',
          'https://img6.hkrtcdn.com/39213/prd_3921205-MuscleBlaze-Weight-Gainer-with-Added-Digezyme-4.4-lb-Chocolate_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'MuscleBlaze',
    title: 'MuscleBlaze Weight Gainer with Added Digezyme',
    currentVarient: CurrentVarient(label: 'Weight', value: '1KG'),
    rating: Rating(
      average: 4.5,
      ratings: 1142,
      oneStars: 12,
      twoStars: 20,
      threeStars: 50,
      fourStars: 300,
      fiveStars: 760,
    ),
    pricing: Pricing(mrp: 2669, price: 1559, discountPercentage: 41),
    primaryCategory: 'Sports Nutrition',
    secondaryCategory: 'Gainers',
    tertiaryCategory: 'Weight Gainers',
    info: Info(
      benefits: ['Helps in Gaining Weight', 'Generally Consumed With Milk'],
      extras: [],
    ),
    baseImages: [
      'https://img7.hkrtcdn.com/26450/prd_2644986-MuscleBlaze-Weight-Gainer-with-Added-Digezyme-6.6-lb-Chocolate_o.jpg',
      'https://img9.hkrtcdn.com/26450/prd_2644988-MuscleBlaze-Weight-Gainer-with-Added-Digezyme-6.6-lb-Chocolate_o.jpg',
      'https://img10.hkrtcdn.com/39212/prd_3921199-MuscleBlaze-Weight-Gainer-with-Added-Digezyme-6.6-lb-Chocolate_o.jpg',
    ],
    varientImages: [
      VarientImages(
        label: 'Flavour',
        value: 'Chocolate',
        images: [
          'https://img2.hkrtcdn.com/39078/prd_3907731-MuscleBlaze-Weight-Gainer-with-Added-Digezyme-2.2-lb-Chocolate_o.jpg',
          'https://img5.hkrtcdn.com/18227/prd_1822664-MuscleBlaze-Weight-Gainer-with-Added-Digezyme-2.2-lb-Chocolate_o.jpg',
          'https://img8.hkrtcdn.com/39077/prd_3907687-MuscleBlaze-Weight-Gainer-with-Added-Digezyme-2.2-lb-Chocolate_o.jpg',
          'https://img4.hkrtcdn.com/39078/prd_3907733-MuscleBlaze-Weight-Gainer-with-Added-Digezyme-2.2-lb-Chocolate_o.jpg ',
        ],
      ),
    ],
    varientProducts: [],
  ),
  //
  // Vitamins & Supplements/ Omega fatty acids /Omega 3
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'HealthKart',
    title: 'HealthKart HK Vitals Omega 3 1000mg with 180mg EPA and 120mg DHA',
    currentVarient: CurrentVarient(label: 'Quantity', value: '90 Capsules'),
    rating: Rating(
      average: 4.6,
      ratings: 785,
      oneStars: 8,
      twoStars: 12,
      threeStars: 45,
      fourStars: 230,
      fiveStars: 490,
    ),
    pricing: Pricing(mrp: 629, price: 469, discountPercentage: 25),
    primaryCategory: 'Vitamins & Supplements',
    secondaryCategory: 'Omega fatty acids',
    tertiaryCategory: 'Omega 3',
    info: Info(
      benefits: [
        'Comprise of  Omega3',
        'Helps in Healthy Heartk',
        'Generally Consumed With Water',
      ],
      extras: [],
    ),
    baseImages: [],
    varientImages: [
      VarientImages(
        label: 'Base',
        value: '',
        images: [
          'https://img8.hkrtcdn.com/35425/prd_3542407-HealthKart-HK-Vitals-Omega-3-1000mg-with-180mg-EPA-and-120mg-DHA-90-capsules_o.jpg',
          'https://img2.hkrtcdn.com/35425/prd_3542451-HealthKart-HK-Vitals-Omega-3-1000mg-with-180mg-EPA-and-120mg-DHA-90-capsules_o.jpg',
          'https://img10.hkrtcdn.com/35425/prd_3542409-HealthKart-HK-Vitals-Omega-3-1000mg-with-180mg-EPA-and-120mg-DHA-90-capsules_o.jpg',
          'https://img8.hkrtcdn.com/35425/prd_3542447-HealthKart-HK-Vitals-Omega-3-1000mg-with-180mg-EPA-and-120mg-DHA-90-capsules_o.jpg',
          'https://img4.hkrtcdn.com/35425/prd_3542403-HealthKart-HK-Vitals-Omega-3-1000mg-with-180mg-EPA-and-120mg-DHA-90-capsules_o.jpg',
          'https://img10.hkrtcdn.com/35425/prd_3542449-HealthKart-HK-Vitals-Omega-3-1000mg-with-180mg-EPA-and-120mg-DHA-90-capsules_o.jpg',
          'https://img2.hkrtcdn.com/35425/prd_3542411-HealthKart-HK-Vitals-Omega-3-1000mg-with-180mg-EPA-and-120mg-DHA-90-capsules_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'HealthKart',
    title: 'HealthKart HK Vitals Omega 3 1000mg with 180mg EPA and 120mg DHA',
    currentVarient: CurrentVarient(label: 'Quantity', value: '90 Capsules'),
    rating: Rating(
      average: 4.6,
      ratings: 785,
      oneStars: 8,
      twoStars: 12,
      threeStars: 45,
      fourStars: 230,
      fiveStars: 490,
    ),
    pricing: Pricing(mrp: 559, price: 359, discountPercentage: 35),
    primaryCategory: 'Vitamins & Supplements',
    secondaryCategory: 'Omega fatty acids',
    tertiaryCategory: 'Omega 3',
    info: Info(
      benefits: [
        'Comprise of  Omega3',
        'Helps in Healthy Heartk',
        'Generally Consumed With Water',
      ],
      extras: [],
    ),
    baseImages: [],
    varientImages: [
      VarientImages(
        label: 'Base',
        value: '',
        images: [
          'https://img8.hkrtcdn.com/35425/prd_3542407-HealthKart-HK-Vitals-Omega-3-1000mg-with-180mg-EPA-and-120mg-DHA-90-capsules_o.jpg',
          'https://img2.hkrtcdn.com/35425/prd_3542451-HealthKart-HK-Vitals-Omega-3-1000mg-with-180mg-EPA-and-120mg-DHA-90-capsules_o.jpg',
          'https://img10.hkrtcdn.com/35425/prd_3542409-HealthKart-HK-Vitals-Omega-3-1000mg-with-180mg-EPA-and-120mg-DHA-90-capsules_o.jpg',
          'https://img8.hkrtcdn.com/34916/prd_3491547-HealthKart-HK-Vitals-Omega-3-1000mg-with-180mg-EPA-and-120mg-DHA-60-capsules_o.jpg',
          'https://img6.hkrtcdn.com/34977/prd_3497685-HealthKart-HK-Vitals-Omega-3-1000mg-with-180mg-EPA-and-120mg-DHA-60-capsules_o.jpg',
          'https://img10.hkrtcdn.com/34977/prd_3497639-HealthKart-HK-Vitals-Omega-3-1000mg-with-180mg-EPA-and-120mg-DHA-60-capsules_o.jpg',
          'https://img4.hkrtcdn.com/34977/prd_3497633-HealthKart-HK-Vitals-Omega-3-1000mg-with-180mg-EPA-and-120mg-DHA-60-capsules_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'TrueBasics',
    title: 'TrueBasics Ultra Omega-3 Fatty Acids (EPA 525mg & DHA 375mg)',
    currentVarient: CurrentVarient(label: 'Quantity', value: '90 Capsules'),
    rating: Rating(
      average: 4.6,
      ratings: 256,
      oneStars: 4,
      twoStars: 5,
      threeStars: 12,
      fourStars: 70,
      fiveStars: 165,
    ),
    pricing: Pricing(mrp: 1999, price: 1609, discountPercentage: 19),
    primaryCategory: 'Vitamins & Supplements',
    secondaryCategory: 'Omega fatty acids',
    tertiaryCategory: 'Omega 3',
    info: Info(
      benefits: [
        'Comprise of  Omega3',
        'Helps in Heart, Joint, Eye & Brain',
        'Generally Consumed With Water',
      ],
      extras: [],
    ),
    baseImages: [],
    varientImages: [
      VarientImages(
        label: 'Base',
        value: '',
        images: [
          'https://img6.hkrtcdn.com/30837/prd_3083695-TrueBasics-Ultra-Omega3-EPA-525mg-DHA-400mg-90-capsules_o.jpg',
          'https://img6.hkrtcdn.com/30838/prd_3083705-TrueBasics-Ultra-Omega3-EPA-525mg-DHA-400mg-90-capsules_o.jpg',
          'https://img1.hkrtcdn.com/22095/prd_2209450-TrueBasics-Ultra-Omega3-EPA-525mg-DHA-400mg-90-capsules_o.jpg',
          'https://img2.hkrtcdn.com/33252/prd_3325151-TrueBasics-Ultra-Omega3-EPA-525mg-DHA-400mg-90-capsules_o.jpg',
          'https://img6.hkrtcdn.com/33252/prd_3325155-TrueBasics-Ultra-Omega3-EPA-525mg-DHA-400mg-90-capsules_o.jpg',
          'https://img4.hkrtcdn.com/33252/prd_3325153-TrueBasics-Ultra-Omega3-EPA-525mg-DHA-400mg-90-capsules_o.jpg',
          'https://img4.hkrtcdn.com/30838/prd_3083703-TrueBasics-Ultra-Omega3-EPA-525mg-DHA-400mg-90-capsules_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'TrueBasics',
    title: 'TrueBasics Ultra Omega-3 Fatty Acids (EPA 525mg & DHA 375mg)',
    currentVarient: CurrentVarient(label: 'Quantity', value: '30 Capsules'),
    rating: Rating(
      average: 4.6,
      ratings: 256,
      oneStars: 4,
      twoStars: 5,
      threeStars: 12,
      fourStars: 70,
      fiveStars: 165,
    ),
    pricing: Pricing(mrp: 799, price: 629, discountPercentage: 21),
    primaryCategory: 'Vitamins & Supplements',
    secondaryCategory: 'Omega fatty acids',
    tertiaryCategory: 'Omega 3',
    info: Info(
      benefits: [
        'Comprise of  Omega3',
        'Helps in Heart, Joint, Eye & Brain',
        'Generally Consumed With Water',
      ],
      extras: [],
    ),
    baseImages: [],
    varientImages: [
      VarientImages(
        label: 'Base',
        value: '',
        images: [
          'https://img6.hkrtcdn.com/30837/prd_3083695-TrueBasics-Ultra-Omega3-EPA-525mg-DHA-400mg-90-capsules_o.jpg',
          'https://img6.hkrtcdn.com/30838/prd_3083705-TrueBasics-Ultra-Omega3-EPA-525mg-DHA-400mg-90-capsules_o.jpg',
          'https://img1.hkrtcdn.com/22095/prd_2209450-TrueBasics-Ultra-Omega3-EPA-525mg-DHA-400mg-90-capsules_o.jpg',
          'https://img6.hkrtcdn.com/41403/prd_4140205-TrueBasics-Ultra-Omega3-EPA-525mg-DHA-400mg-30-capsules_o.jpg',
          'https://img8.hkrtcdn.com/41403/prd_4140207-TrueBasics-Ultra-Omega3-EPA-525mg-DHA-400mg-30-capsules_o.jpg',
          'https://img2.hkrtcdn.com/41403/prd_4140201-TrueBasics-Ultra-Omega3-EPA-525mg-DHA-400mg-30-capsules_o.jpg',
          'https://img4.hkrtcdn.com/41403/prd_4140203-TrueBasics-Ultra-Omega3-EPA-525mg-DHA-400mg-30-capsules_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
  //
  //Ayurveda & Herbs/ Herbs for weight loss
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'InLife',
    title: 'INLIFE Green Coffee Beans (800mg)',
    currentVarient: CurrentVarient(label: 'Quantity', value: '60 Capsules'),
    rating: Rating(
      average: 0,
      ratings: 0,
      oneStars: 0,
      twoStars: 0,
      threeStars: 0,
      fourStars: 0,
      fiveStars: 0,
    ),
    pricing: Pricing(mrp: 799, price: 398, discountPercentage: 50),
    primaryCategory: 'Ayurveda & Herbss',
    secondaryCategory: 'Herbs for weight loss',
    tertiaryCategory: 'Green Coffee Beans Extract',
    info: Info(
      benefits: [
        'Comprise of  Omega3',
        'Helps in Healthy Heart',
        'Generally Consumed With Water',
      ],
      extras: [],
    ),
    baseImages: [],
    varientImages: [
      VarientImages(
        label: 'Base',
        value: '',
        images: [
          'https://img10.hkrtcdn.com/38924/prd_3892369-INLIFE-Green-Coffee-Beans-800mg-60-veggie-capsules_o.jpg',
          'https://img8.hkrtcdn.com/38924/prd_3892307-INLIFE-Green-Coffee-Beans-800mg-60-veggie-capsules_o.jpg',
          'https://img2.hkrtcdn.com/38924/prd_3892371-INLIFE-Green-Coffee-Beans-800mg-60-veggie-capsules_o.jpg',
          'https://img6.hkrtcdn.com/38924/prd_3892305-INLIFE-Green-Coffee-Beans-800mg-60-veggie-capsules_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'NutraFirst',
    title: 'NutraFirst Pure Green Coffee Bean Extract',
    currentVarient: CurrentVarient(label: 'Quantity', value: '60 Capsules'),
    rating: Rating(
      average: 4.8,
      ratings: 4,
      oneStars: 0,
      twoStars: 0,
      threeStars: 0,
      fourStars: 1,
      fiveStars: 3,
    ),
    pricing: Pricing(mrp: 1398, price: 591, discountPercentage: 31),
    primaryCategory: 'Ayurveda & Herbss',
    secondaryCategory: 'Herbs for weight loss',
    tertiaryCategory: 'Green Coffee Beans Extract',
    info: Info(benefits: ['Helps in Weight Management'], extras: []),
    baseImages: [],
    varientImages: [
      VarientImages(
        label: 'Base',
        value: '',
        images: [
          'https://img9.hkrtcdn.com/19555/prd_1955438-NutraFirst-Pure-Green-Coffee-Bean-Extract-60-capsules_o.jpg',
          'https://img7.hkrtcdn.com/19555/prd_1955436-NutraFirst-Pure-Green-Coffee-Bean-Extract-60-capsules_o.jpg',
          'https://img1.hkrtcdn.com/19555/prd_1955450-NutraFirst-Pure-Green-Coffee-Bean-Extract-60-capsules_o.jpg',
          'https://img5.hkrtcdn.com/19555/prd_1955444-NutraFirst-Pure-Green-Coffee-Bean-Extract-60-capsules_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'NutraFirst',
    title: 'NutraFirst Pure Green Coffee Bean Extract',
    currentVarient: CurrentVarient(label: 'Quantity', value: '180 Capsules'),
    rating: Rating(
      average: 4.8,
      ratings: 4,
      oneStars: 0,
      twoStars: 0,
      threeStars: 0,
      fourStars: 1,
      fiveStars: 3,
    ),
    pricing: Pricing(mrp: 2397, price: 1343, discountPercentage: 43),
    primaryCategory: 'Ayurveda & Herbss',
    secondaryCategory: 'Herbs for weight loss',
    tertiaryCategory: 'Green Coffee Beans Extract',
    info: Info(benefits: ['Helps in Weight Management'], extras: []),
    baseImages: [],
    varientImages: [
      VarientImages(
        label: 'Base',
        value: '',
        images: [
          'https://img6.hkrtcdn.com/41576/prd_4157515-NutraFirst-Pure-Green-Coffee-Bean-Extract-180-capsules_o.jpg',
          'https://img2.hkrtcdn.com/41577/prd_4157611-NutraFirst-Pure-Green-Coffee-Bean-Extract-180-capsules_o.jpg',
          'https://img8.hkrtcdn.com/41576/prd_4157537-NutraFirst-Pure-Green-Coffee-Bean-Extract-180-capsules_o.jpg',
          'https://img4.hkrtcdn.com/41577/prd_4157613-NutraFirst-Pure-Green-Coffee-Bean-Extract-180-capsules_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
  // Health Food & Drinks/ Protein foods & bars
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'MuscleBlaze',
    title: 'MuscleBlaze High Protein Oats',
    currentVarient: CurrentVarient(label: 'Weight', value: '2KG'),
    rating: Rating(
      average: 4.5,
      ratings: 530,
      oneStars: 10,
      twoStars: 15,
      threeStars: 35,
      fourStars: 160,
      fiveStars: 310,
    ),
    pricing: Pricing(mrp: 1159, price: 1069, discountPercentage: 7),
    primaryCategory: 'Health Food & Drinks',
    secondaryCategory: 'Protein foods & bars',
    tertiaryCategory: 'Oats',
    info: Info(benefits: ['Helps in Weight Management'], extras: []),
    baseImages: [],
    varientImages: [
      VarientImages(
        label: 'Flavour',
        value: 'Dark Chocolate',
        images: [
          'https://img2.hkrtcdn.com/30236/prd_3023511-MuscleBlaze-High-Protein-Oats-2-kg-Dark-Chocolate_o.jpg',
          'https://img4.hkrtcdn.com/30236/prd_3023513-MuscleBlaze-High-Protein-Oats-2-kg-Dark-Chocolate_o.jpg',
          'https://img6.hkrtcdn.com/30236/prd_3023515-MuscleBlaze-High-Protein-Oats-2-kg-Dark-Chocolate_o.jpg',
          'https://img10.hkrtcdn.com/30236/prd_3023519-MuscleBlaze-High-Protein-Oats-2-kg-Dark-Chocolate_o.jpg',
          'https://img6.hkrtcdn.com/30236/prd_3023525-MuscleBlaze-High-Protein-Oats-2-kg-Dark-Chocolate_o.jpg',
          'https://img2.hkrtcdn.com/35980/prd_3597941-MuscleBlaze-High-Protein-Oats-2-kg-Dark-Chocolate_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'MuscleBlaze',
    title: 'MuscleBlaze High Protein Oats',
    currentVarient: CurrentVarient(label: 'Weight', value: '2KG'),
    rating: Rating(
      average: 4.5,
      ratings: 530,
      oneStars: 10,
      twoStars: 15,
      threeStars: 35,
      fourStars: 160,
      fiveStars: 310,
    ),
    pricing: Pricing(mrp: 699, price: 579, discountPercentage: 17),
    primaryCategory: 'Health Food & Drinks',
    secondaryCategory: 'Protein foods & bars',
    tertiaryCategory: 'Oats',
    info: Info(benefits: ['Helps in Weight Management'], extras: []),
    baseImages: [],
    varientImages: [
      VarientImages(
        label: 'Flavour',
        value: 'Dark Chocolate',
        images: [
          'https://img6.hkrtcdn.com/39671/prd_3967085-MuscleBlaze-High-Protein-Oats-1-kg-Dark-Chocolate_o.jpg',
          'https://img10.hkrtcdn.com/35980/prd_3597939-MuscleBlaze-High-Protein-Oats-1-kg-Dark-Chocolate_o.jpg',
          'https://img6.hkrtcdn.com/30550/prd_3054945-MuscleBlaze-High-Protein-Oats-1-kg-Dark-Chocolate_o.jpg',
          'https://img4.hkrtcdn.com/30550/prd_3054943-MuscleBlaze-High-Protein-Oats-1-kg-Dark-Chocolate_o.jpg',
          'https://img2.hkrtcdn.com/30550/prd_3054941-MuscleBlaze-High-Protein-Oats-1-kg-Dark-Chocolate_o.jpg',
          'https://img10.hkrtcdn.com/30550/prd_3054929-MuscleBlaze-High-Protein-Oats-1-kg-Dark-Chocolate_o.jpg',
        ],
      ),
      VarientImages(
        label: 'Flavour',
        value: 'Fruit and Super Seed',
        images: [
          'https://img4.hkrtcdn.com/39607/prd_3960643-MuscleBlaze-High-Protein-Oats-1-kg-Fruit-Super-Seeds_o.jpg',
          'https://img2.hkrtcdn.com/30611/prd_3061071-MuscleBlaze-High-Protein-Oats-1-kg-Fruit-Super-Seeds_o.jpg',
          'https://img4.hkrtcdn.com/30611/prd_3061073-MuscleBlaze-High-Protein-Oats-1-kg-Fruit-Super-Seeds_o.jpg',
          'https://img2.hkrtcdn.com/39607/prd_3960621-MuscleBlaze-High-Protein-Oats-1-kg-Fruit-Super-Seeds_o.jpg',
          'https://img8.hkrtcdn.com/30611/prd_3061077-MuscleBlaze-High-Protein-Oats-1-kg-Fruit-Super-Seeds_o.jpg',
          'https://img6.hkrtcdn.com/39607/prd_3960625-MuscleBlaze-High-Protein-Oats-1-kg-Fruit-Super-Seeds_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
  // Wellness/ Hair care
  //
  //
  NewProductModel(
    id: const Uuid().v4(),
    by: 'MuscleBlaze',
    title: 'MuscleBlaze High Protein Oats',
    currentVarient: CurrentVarient(label: 'Weight', value: '2KG'),
    rating: Rating(
      average: 4.4,
      ratings: 8,
      oneStars: 10,
      twoStars: 15,
      threeStars: 35,
      fourStars: 160,
      fiveStars: 310,
    ),
    pricing: Pricing(mrp: 649, price: 249, discountPercentage: 61),
    primaryCategory: 'Wellness',
    secondaryCategory: 'Hair care',
    tertiaryCategory: 'Hair Serum',
    info: Info(benefits: ['Helps in hair care'], extras: []),
    baseImages: [],
    varientImages: [
      VarientImages(
        label: 'Base',
        value: '',
        images: [
          'https://img9.hkrtcdn.com/18564/prd_1856328-ForMen-Minoxidil-Topical-Hair-Growth-Solution-60-ml-for-All-Types-of-Hair_o.jpg',
          'https://img3.hkrtcdn.com/18564/prd_1856332-ForMen-Minoxidil-Topical-Hair-Growth-Solution-60-ml-for-All-Types-of-Hair_o.jpg',
          'https://img5.hkrtcdn.com/18564/prd_1856334-ForMen-Minoxidil-Topical-Hair-Growth-Solution-60-ml-for-All-Types-of-Hair_o.jpg',
          'https://img1.hkrtcdn.com/18564/prd_1856330-ForMen-Minoxidil-Topical-Hair-Growth-Solution-60-ml-for-All-Types-of-Hair_o.jpg',
          'https://img7.hkrtcdn.com/18564/prd_1856336-ForMen-Minoxidil-Topical-Hair-Growth-Solution-60-ml-for-All-Types-of-Hair_o.jpg',
          'https://img9.hkrtcdn.com/18564/prd_1856338-ForMen-Minoxidil-Topical-Hair-Growth-Solution-60-ml-for-All-Types-of-Hair_o.jpg',
        ],
      ),
    ],
    varientProducts: [],
  ),
];
