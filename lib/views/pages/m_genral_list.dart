class GeneralListModel {
  final String jenisKecelakaan;
  final String tanggalKecelakaan;
  final String waktuKecelakaan;
  final String lokasiKecelakaan;
  final String uraianKecelakaan;
  final String namaPelapor;
  final String noPelapor;
  final String alamatPelapor;
  final String status;
  final String updateBy;

  GeneralListModel(
      {
        this.jenisKecelakaan,
        this.tanggalKecelakaan,
        this.waktuKecelakaan,
        this.lokasiKecelakaan,
        this.uraianKecelakaan,
        this.namaPelapor,
        this.noPelapor,
        this.alamatPelapor,
        this.status,
        this.updateBy});
}

List<GeneralListModel> listGeneral = [
  GeneralListModel(
      jenisKecelakaan : "Kecelakaan Tunggal",
      tanggalKecelakaan : "02/10/2020",
      waktuKecelakaan : "15:30",
      lokasiKecelakaan : "Jl Raya Veteran Kuninan no 23",
      uraianKecelakaan : "Terjadi kecelakaan Mobil dan Motor",
      namaPelapor : "Dede Muktamar",
      noPelapor : "0895675643",
      alamatPelapor : "Desa Ciseureuh, Kecamatan kuningan",
      status : "1",
      updateBy : "2019-01-28",
  ),GeneralListModel(
      jenisKecelakaan : "Kecelakaan Ganda",
      tanggalKecelakaan : "02/10/2020",
      waktuKecelakaan : "15:30",
      lokasiKecelakaan : "Jl Raya Kuda Kuninan no 23",
      uraianKecelakaan : "Terjadi kecelakaan Tabrak Lari",
      namaPelapor : "Dede Muktamar",
      noPelapor : "0895675643",
      alamatPelapor : "Desa Ciseureuh, Kecamatan kuningan",
      status : "1",
      updateBy : "2019-01-28",
  ),GeneralListModel(
      jenisKecelakaan : "Kecelakaan Tunggal",
      tanggalKecelakaan : "02/10/2020",
      waktuKecelakaan : "15:30",
      lokasiKecelakaan : "Jl Raya Singa Kuninan no 23",
      uraianKecelakaan : "Terjadi kecelakaan Mobil Becak",
      namaPelapor : "Dede Muktamar",
      noPelapor : "0895675643",
      alamatPelapor : "Desa Ciseureuh, Kecamatan kuningan",
      status : "1",
      updateBy : "2019-01-28",
  ),GeneralListModel(
      jenisKecelakaan : "Kecelakaan Tunggal",
      tanggalKecelakaan : "02/10/2020",
      waktuKecelakaan : "15:30",
      lokasiKecelakaan : "Jl Raya Veteran Kuninan no 23",
      uraianKecelakaan : "Terjadi kecelakaan Mobil dan Motor",
      namaPelapor : "Dede Muktamar",
      noPelapor : "0895675643",
      alamatPelapor : "Desa Ciseureuh, Kecamatan kuningan",
      status : "1",
      updateBy : "2019-01-28",
  ),GeneralListModel(
      jenisKecelakaan : "Kecelakaan Tunggal",
      tanggalKecelakaan : "02/10/2020",
      waktuKecelakaan : "15:30",
      lokasiKecelakaan : "Jl Raya Veteran Kuninan no 23",
      uraianKecelakaan : "Terjadi kecelakaan Mobil dan Motor",
      namaPelapor : "Dede Muktamar",
      noPelapor : "0895675643",
      alamatPelapor : "Desa Ciseureuh, Kecamatan kuningan",
      status : "1",
      updateBy : "2019-01-28",
  ),GeneralListModel(
      jenisKecelakaan : "Kecelakaan Tunggal",
      tanggalKecelakaan : "02/10/2020",
      waktuKecelakaan : "15:30",
      lokasiKecelakaan : "Jl Raya Veteran Kuninan no 23",
      uraianKecelakaan : "Terjadi kecelakaan Hamil diluar nikah",
      namaPelapor : "Dede Muktamar",
      noPelapor : "0895675643",
      alamatPelapor : "Desa Ciseureuh, Kecamatan kuningan",
      status : "1",
      updateBy : "2019-01-28",
  ),
];
