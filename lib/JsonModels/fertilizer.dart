// fertilizer.dart
class Fertilizer {
  final int? id;
  final String fertilizerName;
  final String description;
  final int quantity;

  Fertilizer({
    this.id,
    required this.fertilizerName,
    required this.description,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fertilizerName': fertilizerName,
      'description': description,
      'quantity': quantity,
    };
  }

  static Fertilizer fromMap(Map<String, dynamic> map) {
    return Fertilizer(
      id: map['id'],
      fertilizerName: map['fertilizerName'],
      description: map['description'],
      quantity: map['quantity'],
    );
  }
}
