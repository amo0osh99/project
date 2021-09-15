// @dart=2.9

class User {
  final String uid;
  final String email;

  User(this.uid, this.email);
}



class UserModel{
  String id;
  String email;
  String password;
  String name ;
  String phone ;
  String location ;
  String type ;
  String state ;

  UserModel({this.email, this.password, this.name,this.phone,this.location,this.type,this.state="NONE"});
  UserModel.withId({this.id, this.email, this.password, this.name,this.phone,this.location,this.type,this.state="NONE"});

  Map<String, dynamic> toMap() {


    final  map = Map<String,dynamic>();
    if(id!=null){
      map['id'] = this.id;
    }
    map['email'] = this.email;
    map['password'] = this.password;
    map['name'] = this.name;
    map['phone'] = this.phone;
    map['location'] = this.location;
    map['type'] = this.type;
    map['state'] = this.state;
    print(map);
    return map;
  }

  @override
  String toString() {
    return '{id: $id, email: $email, password: $password, name: $name, phone: $phone, location: $location, type: $type}';
  } //return new object from map
  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel.withId(id:map['id'],email:map['email'],state: map['state'],
        password: map['password'],name: map['name'],phone: map['phone'],location: map['location'],type: map['type']);
  }
}
