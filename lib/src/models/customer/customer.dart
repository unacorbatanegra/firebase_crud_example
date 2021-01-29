class Customer {
  String uuid;
  final String name;
  final String lastName;
  final String email;
  final String userName;
  final bool creditAvailable;

  Customer({
    this.uuid,
    this.name,
    this.lastName,
    this.email,
    this.userName,
    this.creditAvailable = false,
  });

  Customer copyWith({
    String uuid,
    String name,
    String lastName,
    String email,
    String userName,
    bool creditAvailable,
  }) =>
      Customer(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        userName: userName ?? this.userName,
        creditAvailable: creditAvailable ?? this.creditAvailable,
      );

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'name': name,
        'lastName': lastName,
        'email': email,
        'userName': userName,
        'creditAvailable': creditAvailable,
      };

  factory Customer.fromJson(dynamic json) => Customer(
        uuid: json['uuid'] as String,
        name: json['name'] as String,
        lastName: json['lastName'] as String,
        email: json['email'] as String,
        userName: json['userName'] as String,
        creditAvailable: json['creditAvailable'] as bool ?? false,
      );
}
