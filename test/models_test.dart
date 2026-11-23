import 'dart:convert';
import 'dart:io';

import 'package:api_catalog/models/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses the saved product fixture', () {
    final raw = File('test/fixtures/product.json').readAsStringSync();
    final product = Product.fromJson(jsonDecode(raw) as Map<String, dynamic>);

    expect(product.title, 'Essence Mascara Lash Princess');
    expect(product.price, isA<double>());
    expect(product.price, 9.99);
    expect(product.tags, ['beauty', 'mascara']);
    expect(product.reviews, hasLength(3));
  });

  test('does not crash when brand and tags are missing', () {
    final product = Product.fromJson({
      'id': 99,
      'title': 'Plain thing',
      'description': 'No brand, no tags',
      'price': 10,
      'rating': 4,
      'thumbnail': 'https://example.com/t.png',
      'dimensions': {'width': 1, 'height': 2, 'depth': 3},
    });

    expect(product.brand, isNull);
    expect(product.tags, isEmpty);
    expect(product.price, 10.0);
  });
}
