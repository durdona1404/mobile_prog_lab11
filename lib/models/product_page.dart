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

  bool get hasMore => skip + products.length < total;

  factory ProductPage.fromJson(Map<String, dynamic> json) {
    return ProductPage(
      products: (json['products'] as List<dynamic>? ?? [])
          .map((item) => Product.fromJson(item as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num? ?? 0).toInt(),
      skip: (json['skip'] as num? ?? 0).toInt(),
      limit: (json['limit'] as num? ?? 0).toInt(),
    );
  }
}
