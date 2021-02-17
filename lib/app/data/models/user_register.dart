class UserRegister {
  String document,
      expedido,
      docType,
      name,
      lastName,
      phone,
      email,
      address,
      photo,
      token,
      sex;
  int birthDay, nacionalityId, profileId;

  UserRegister(
      {this.document,
      this.expedido,
      this.docType,
      this.name,
      this.lastName,
      this.phone,
      this.email,
      this.address,
      this.photo,
      this.token,
      this.sex,
      this.birthDay,
      this.nacionalityId,
      this.profileId});

  String get getDocument {
    return document;
  }

  set setDocument(String val) {
    document = val;
  }

  List<String> expedidoList() {
    return ['LP', 'CB', 'SC', 'OR', 'PT', 'BN', 'PA', 'CH', 'TA'];
  }

  Map<String, dynamic> toMap() {
    return {
      'document': document,
      'expedido': expedido,
      'docType': docType,
      'name': name,
      'lastName': lastName,
      'birthDay': birthDay,
      'phone': phone,
      'email': email,
      'sex': sex,
      'address': address,
      'nacionalityId': nacionalityId,
      'profileId': profileId,
      'photo': photo,
      'token_firebase': token
    };
  }

  UserRegister.fromJson(Map<String, dynamic> json)
      : document = json['document'],
        docType = json['doc_type'],
        expedido = '',
        name = json['name'],
        lastName = json['last_name'],
        phone = json['cell_phone_number'],
        email = '',
        address = '',
        photo = '',
        token = '',
        birthDay = json['birth_day'],
        nacionalityId = 0,
        profileId = 1;

  UserRegister.fromJsonUser(Map<String, dynamic> json)
      : document = json['document'],
        docType = '',
        expedido = '',
        name = json['name'],
        lastName = json['lastname'],
        phone = json['phone'],
        email = json['email'],
        address = '',
        photo = json['image'],
        token = json['tokenfirebase'],
        sex = json['sex'],
        birthDay = json['birthdate'],
        nacionalityId = 0,
        profileId = 1;
}
