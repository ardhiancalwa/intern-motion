class PostModel {
  String fotoProfile;
  String namaAkun;
  bool isSponsor;
  String postingGambar;
  bool isLike;
  bool isBookmark;
  int jumlahLike;
  String description;
  PostModel({
    required this.fotoProfile,
    required this.namaAkun,
    required this.postingGambar,
    required this.jumlahLike,
    required this.description,
    this.isSponsor = false,
    this.isLike = false,
    this.isBookmark = false,
  });
}
