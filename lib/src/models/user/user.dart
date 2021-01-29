class User {
  final String email;
  final String user;
  final String name;
  final String lastName;
  final String dni;
  final String phone;
  final String uid;
  final String urlImg;
  final bool block;

  User({
    this.email,
    this.user,
    this.name,
    this.lastName,
    this.dni,
    this.phone,
    this.uid,
    this.block = false,
    this.urlImg,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'user': user,
        'name': name,
        'lastName': lastName,
        'dni': dni,
        'telefono': phone,
        'uid': uid,
        'block': block,
      };

  factory User.fromJson(dynamic json) => User(
        email: json['email'] as String,
        user: json['user'] as String,
        name: json['name'] as String,
        lastName: json['lastName'] as String,
        dni: json['dni'] as String,
        phone: json['telefono'] as String,
        uid: json['uid'] as String,
        block: json['block'] as bool,
      );
      
  User copyWith({
    String email,
    String user,
    String name,
    String lastName,
    String dni,
    String phone,
    String uid,
    String urlImg,
    bool block,
  }) =>
      User(
        email: email ?? this.email,
        user: user ?? this.user,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        dni: dni ?? this.dni,
        phone: phone ?? this.phone,
        uid: uid ?? this.uid,
        block: block ?? this.block,
        urlImg: urlImg ?? this.urlImg,
      );
}
