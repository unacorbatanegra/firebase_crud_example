class Customer {
  String uuid;
  final String name;
  final String lastName;
  final String email;
  final String dni;
  final double creditLimit;

  Customer({
    this.uuid,
    this.name,
    this.lastName,
    this.email,
    this.dni,
    this.creditLimit,
  });

  Customer copyWith({
    String uuid,
    String name,
    String lastName,
    String email,
    String dni,
    double creditLimit,
  }) =>
      Customer(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        dni: dni ?? this.dni,
        creditLimit: creditLimit ?? this.creditLimit,
      );

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'name': name,
        'lastName': lastName,
        'email': email,
        'dni': dni,
        'creditLimit': creditLimit,
      };

  factory Customer.fromJson(dynamic json) => Customer(
        uuid: json['uuid'] as String,
        name: json['name'] as String,
        lastName: json['lastName'] as String,
        email: json['email'] as String,
        dni: json['dni'] as String,
        creditLimit: double.tryParse(json['creditLimit'] as String),
      );
}
