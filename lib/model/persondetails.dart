class Person {
  int sl;

  String name;
  String designation;
  String phone;
  String email;
  String fbLink;
  // int sl = 0;
  //
  // String name = "";
  // String designation = "";
  // String phone = "";
  // String email = "";
  // String fbLink = "";

  Person(this.sl, this.name, this.designation, this.phone, this.email,
      this.fbLink);

  Person.namedParams(
      {this.sl,
      this.name,
      this.designation,
      this.phone,
      this.email,
      this.fbLink});

  Person.fromJson(Map<String, dynamic> json)
      : sl = json['sl'],
        name = json['name'],
        designation = json['designation'],
        phone = json['phone'],
        email = json['email'],
        fbLink = json['fbLink'];

  Map<String, dynamic> toJson() => {
        'sl': sl,
        'name': name,
        'designation': designation,
        'phone': phone,
        'email': email,
        'fbLink': fbLink,
      };
}
