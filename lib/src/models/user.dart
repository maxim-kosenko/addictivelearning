class User {
  String name;
  String email;
  String lastName;
  String middleName;
  String phone;
  int subscription;
  String password;
  String passwordConfirmation;

  User({
    this.name,
    this.email,
    this.lastName,
    this.middleName,
    this.phone,
    this.subscription,
    this.password,
    this.passwordConfirmation,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    phone = json['phone'];
    subscription = json['subscription'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name ?? "Vasiliy";
    data['email'] = this.email ?? "user@example.com";
    data['last_name'] = this.lastName ?? "Pupkin";
    data['middle_name'] = this.middleName ?? "Alibabaevich";
    data['phone'] = this.phone ?? "+380937467766";
    data['subscription'] = this.subscription ?? 1;
    data['password'] = this.password ?? "secret";
    data['password_confirmation'] = this.passwordConfirmation ?? "secret";
    return data;
  }
}
