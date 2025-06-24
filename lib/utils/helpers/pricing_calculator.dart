abstract class HasTotalPrice {
  double get totalPrice;
}

class EPricingCalculator {
  /// Calculates subtotal for all cart items
  static double calculateSubtotal(List<HasTotalPrice> cartItems) {
    return cartItems.fold(0.0, (sum, item) => sum + (item.totalPrice));
  }

  /// Calculates tax based on location
  static double calculateTax(double subtotal, String location) {
    final taxRate = _getTaxRateForLocation(location);
    return subtotal * taxRate;
  }

  /// Calculates discount from coupon (in %)
  static double calculateDiscount(double subtotal, {double discountPercentage = 0.0}) {
    return subtotal * (discountPercentage / 100);
  }

  /// Gets flat shipping cost by location
  static double getShippingCost(String location) {
    switch (location.toLowerCase()) {
      case 'usa':
        return 5.99;
      case 'canada':
        return 7.99;
      case 'uk':
        return 6.99;
      case 'pakistan':
        return 3.50;
      case 'uae':
        return 4.50;
      default:
        return 10.00;
    }
  }

  /// Calculates the grand total
  static double calculateTotal({
    required List<HasTotalPrice> cartItems,
    required String location,
    double discountPercentage = 0.0,
  }) {
    final subtotal = calculateSubtotal(cartItems);
    final tax = calculateTax(subtotal, location);
    final discount = calculateDiscount(subtotal, discountPercentage: discountPercentage);
    final shipping = getShippingCost(location);
    return subtotal + tax + shipping - discount;
  }

  /// Returns all calculated details as a map (both raw and formatted)
  static Map<String, dynamic> calculateFullBreakdown({
    required List<HasTotalPrice> cartItems,
    required String location,
    double discountPercentage = 0.0,
  }) {
    final subtotal = calculateSubtotal(cartItems);
    final tax = calculateTax(subtotal, location);
    final shipping = getShippingCost(location);
    final discount = calculateDiscount(subtotal, discountPercentage: discountPercentage);
    final total = subtotal + tax + shipping - discount;

    return {
      'subtotal': subtotal,
      'subtotalFormatted': subtotal.toStringAsFixed(2),
      'tax': tax,
      'taxFormatted': tax.toStringAsFixed(2),
      'shipping': shipping,
      'shippingFormatted': shipping.toStringAsFixed(2),
      'discount': discount,
      'discountFormatted': discount.toStringAsFixed(2),
      'total': total,
      'totalFormatted': total.toStringAsFixed(2),
    };
  }

  /// Private tax rate lookup
  static double _getTaxRateForLocation(String location) {
    switch (location.toLowerCase()) {
      case 'usa':
        return 0.07;
      case 'canada':
        return 0.13;
      case 'uk':
        return 0.20;
      case 'pakistan':
        return 0.16;
      case 'uae':
        return 0.05;
      default:
        return 0.10;
    }
  }
}
