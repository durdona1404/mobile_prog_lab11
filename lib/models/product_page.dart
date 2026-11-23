import 'product.dart';

class ProductPage {
  const ProductPage({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  factory ProductPage.fromJson(Map<String, dynamic> json) => ProductPage(
    products: [
      for (final p in json['products'] as List)
        Product.fromJson(p as Map<String, dynamic>),
    ],
    total: json['total'] as int,
    skip: json['skip'] as int,
    limit: json['limit'] as int,
  );
}
