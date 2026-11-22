class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final String image;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.image,
    required this.description,
  });
}

class SampleProducts {
  static const List<Product> products = [
    Product(
      id: 'p1',
      name: 'Fresh Organic Apples',
      category: 'Fruits',
      price: 180.0,
      rating: 4.8,
      image: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=500',
      description: 'Crisp, sweet, and locally sourced fresh organic red apples.',
    ),
    Product(
      id: 'p2',
      name: 'Whole Milk 1L',
      category: 'Dairy',
      price: 66.0,
      rating: 4.6,
      image: 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=500',
      description: 'Fresh farm whole milk packed with calcium and nutrients.',
    ),
    Product(
      id: 'p3',
      name: 'Multi-grain Bread',
      category: 'Bakery',
      price: 45.0,
      rating: 4.5,
      image: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500',
      description: 'Healthy and freshly baked multi-grain bread loaf.',
    ),
    Product(
      id: 'p4',
      name: 'Crunchy Potato Chips',
      category: 'Snacks',
      price: 20.0,
      rating: 4.2,
      image: 'https://images.unsplash.com/photo-1566478989037-eec170784d0b?w=500',
      description: 'Crispy salted potato chips perfect for evening tea time.',
    ),
    Product(
      id: 'p5',
      name: 'Organic Bananas 1 Dozen',
      category: 'Fruits',
      price: 60.0,
      rating: 4.7,
      image: 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=500',
      description: 'Naturally ripened sweet bananas rich in potassium.',
    ),
    Product(
      id: 'p6',
      name: 'Fresh Paneer 200g',
      category: 'Dairy',
      price: 90.0,
      rating: 4.9,
      image: 'https://images.unsplash.com/photo-1631452180519-c014fe946bc7?w=500',
      description: 'Soft and fresh cottage cheese made from pure milk.',
    ),
  ];
}
