class Question {
  String id;
  String nama;
  String notelepon;
  String alamat;
  String pertanyaan;

  Question({
    this.id,
    this.nama,
    this.notelepon,
    this.alamat,
    this.pertanyaan,
  });

  factory Question.fromMap(Map<String, dynamic> map) => Question(
        id: map['id'],
        nama: map['nama'],
        notelepon: map['notelepon'],
        alamat: map['alamat'],
        pertanyaan: map['pertanyaan'],
      );

  Map<String, dynamic> toMap() => {
        'id': this.id,
        'nama': this.nama,
        'notelepon': this.notelepon,
        'alamat': this.alamat,
        'question': this.pertanyaan,
      };
}