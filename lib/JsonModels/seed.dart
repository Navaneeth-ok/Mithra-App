class Seed {
  final int? id;
  final String seedName;
  final int quantity;

  Seed({
    this.id,
    required this.seedName,
    required this.quantity,
  });

  factory Seed.fromMap(Map<String, dynamic> json) => Seed(
        id: json["id"],
        seedName: json["seedName"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "seedName": seedName,
        "quantity": quantity,
      };
}
