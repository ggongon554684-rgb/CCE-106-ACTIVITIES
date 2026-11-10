import 'package:flutter/material.dart';

const Color _blue = Color(0xFF2196F3);
const Color _lightBlue = Color(0xFFBBDEFB);
const Color _textColor = Color(0xFF212121);
const Color _mutedTextColor = Color(0xFF757575);
const Color _borderColor = Color(0xFFBDBDBD);
const Color _backgroundColor = Color(0xFFF4F6FA);

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => debugPrint('Back button pressed'),
        ),
        backgroundColor: _backgroundColor,
        foregroundColor: _textColor,

        actions: [
          IconButton(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_bag_outlined, size: 25),
                Positioned(
                  top: -7,
                  right: -7,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: _blue,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () => debugPrint('Cart clicked'),
          ),
        ],
      ),

      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: _lightBlue,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'CAMPUS STORE',
                  style: TextStyle(
                    color: _blue,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ready for checkout',
                style: TextStyle(
                  color: _textColor,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                'Review your items before placing your order.',
                style: TextStyle(color: _mutedTextColor, fontSize: 13),
              ),
              const SizedBox(height: 16),

              _deliveryCard(),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Order Items',
                    style: TextStyle(
                      color: _textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '3 items',
                    style: TextStyle(color: _mutedTextColor, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              const CartItemCard(
                productName: 'Wireless Mouse',
                price: 450,
                quantity: 1,
                icon: Icons.mouse_outlined,
              ),

              const SizedBox(height: 8),
              const CartItemCard(
                productName: 'USB-C Hub',
                price: 850,
                quantity: 1,
                icon: Icons.usb_outlined,
              ),

              const SizedBox(height: 8),
              const CartItemCard(
                productName: 'Laptop Stand',
                price: 700,
                quantity: 1,
                icon: Icons.laptop_outlined,
              ),
              const SizedBox(height: 12),

              _discountBanner(),
              const SizedBox(height: 12),

              _paymentSummary(),
              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton.icon(
                  onPressed: () =>
                      debugPrint('Place Order button pressed Total: 1850.00'),
                  icon: const Icon(Icons.lock, size: 18),
                  label: const Text(
                    'Place Order',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: _blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _deliveryCard() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: _cardDecoration(),
    child: Row(
      children: [
        const Icon(Icons.location_on, color: _blue, size: 23),
        const SizedBox(width: 10),
        Container(width: 1, height: 34, color: _borderColor),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deliver to Gabriel Gongon',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: _textColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Matina, Davao City',
                style: TextStyle(color: _mutedTextColor, fontSize: 12),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => debugPrint('Change delivery address clicked'),
          child: const Text(
            'Change',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Widget _discountBanner() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(
      color: _lightBlue,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        const Icon(Icons.sell_outlined, color: _blue, size: 22),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'STUDENT10 applied',
                style: TextStyle(
                  color: _textColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '10% discount on items',
                style: TextStyle(color: _mutedTextColor, fontSize: 11),
              ),
            ],
          ),
        ),
        const Icon(Icons.check_circle, color: _blue, size: 22),
      ],
    ),
  );
}

Widget _paymentSummary() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: _cardDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Summary',
          style: TextStyle(
            color: _textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        _summaryRow('Subtotal', 'PHP 2,000.00'),
        _summaryRow('Discount (10%)', '- PHP 200.00'),
        _summaryRow('Delivery Fee', 'PHP 50.00'),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Divider(height: 1, color: _borderColor),
        ),
        _summaryRow('Total', 'PHP 1,850.00', bold: true, fontSize: 15),
      ],
    ),
  );
}

Widget _summaryRow(
  String label,
  String amount, {
  bool bold = false,
  double fontSize = 12,
}) {
  final TextStyle style = TextStyle(
    color: _textColor,
    fontSize: fontSize,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
  );

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      children: [
        Expanded(child: Text(label, style: style)),
        const SizedBox(width: 8),
        Text(amount, style: style),
      ],
    ),
  );
}

class CartItemCard extends StatelessWidget {
  final String productName;
  final double price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: _lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Icon(icon, color: const Color(0xFF174A9C), size: 31),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: _textColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'PHP ${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: _blue,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    _quantityButton(
                      icon: Icons.remove,
                      onPressed: () =>
                          debugPrint('Decrease quantity: $productName'),
                    ),
                    Container(
                      width: 40,
                      height: 25,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: _borderColor),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(color: _textColor, fontSize: 12),
                      ),
                    ),
                    _quantityButton(
                      icon: Icons.add,
                      onPressed: () =>
                          debugPrint('Increase quantity: $productName'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => debugPrint('Remove item: $productName'),
            icon: const Icon(Icons.delete_outline, size: 20),
            color: Colors.blueGrey,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        ],
      ),
    );
  }

  Widget _quantityButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 32,
      height: 25,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: _blue,
          side: const BorderSide(color: _blue),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Icon(icon, size: 17),
      ),
    );
  }
}

BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: _borderColor),
  );
}
