class ServiceProvider {
  final int? spId;
  final String spName;
  final String address;
  final String emailId;
  final String mobileNo;
  final String category;
  final String description;
  final String availability;
  final String pwd;
  final int verificationStatus;

  ServiceProvider(
      {this.spId,
      required this.spName,
      required this.address,
      required this.emailId,
      required this.mobileNo,
      required this.category,
      required this.description,
      required this.availability,
      required this.pwd,
      required this.verificationStatus});

  Map<String, dynamic> toMap() {
    return {
      'spId': spId,
      'spName': spName,
      'address': address,
      'emailId': emailId,
      'mobileNo': mobileNo,
      'category': category,
      'description': description,
      'availability': availability,
      'pwd': pwd,
      'verificationStatus': verificationStatus,
    };
  }

  factory ServiceProvider.fromMap(Map<String, dynamic> map) {
    return ServiceProvider(
      spId: map['spId'],
      spName: map['spName'],
      address: map['address'],
      emailId: map['emailId'],
      mobileNo: map['mobileNo'],
      category: map['category'],
      description: map['description'],
      availability: map['availability'],
      pwd: map['pwd'],
      verificationStatus: map['verificationStatus'],
    );
  }
}
