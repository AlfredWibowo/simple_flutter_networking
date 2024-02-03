class cData {
  String cId;
  String cNama;
  String cAvatar;
  String cAlamat;
  String cEmail;
  String cPekerjaan;
  String cQuote;

  cData(
      {required this.cId,
      required this.cNama,
      required this.cAvatar,
      required this.cAlamat,
      required this.cEmail,
      required this.cPekerjaan,
      required this.cQuote});

  factory cData.fromJson(Map<String, dynamic> json) {
    return cData(
        cId: json['id'],
        cNama: json['nama'],
        cAvatar: json['avatar'],
        cAlamat: json['alamat'],
        cEmail: json['email'],
        cPekerjaan: json['pekerjaan'],
        cQuote: json['quote']);
  }
}
