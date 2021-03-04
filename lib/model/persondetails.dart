


class Person {
  int sl=0;

  String name="";
  String designation="";
  String phone="";
  String email="";
  String fbLink="";


  Person();


  Person.namedParams({this.sl, this.name, this.designation, this.phone, this.email,
  this.fbLink});



  dynamic toJson() => {
    'name': name,
    'designation': designation,
    'phone': phone,
    'email': email,
    'fbLink': fbLink,
  };

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person.namedParams(
      name: json['name'],
      designation: json['designation'],
      phone: json['phone'],
      email: json['email'],
      fbLink: json['fbLink'],
    );
  }

   toMap() => {
    'name': name,
    'designation': designation,
    'phone': phone,
    'email': email,
    'fbLink': fbLink,
  };
}
