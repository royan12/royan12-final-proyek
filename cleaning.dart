import 'dart:io';

class Node {
  String data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;

  void remove(String data) {
    if (head == null) 
    return;
    if (head!.data == data) {
      head = head!.next;
      return;
    }
  }
}

class JadwalPembersihan {
  Map<String, List<String>> jadwal = {
    'Senin': ['Dana', 'Dunu'],
    'Selasa': ['Yahya', 'Yayak'],
    'Rabu': ['Imi', 'Umu'],
    'Kamis': ['Fer', 'Pur'],
    'Jumat': ['Jeki', 'Jaka'],
    'Sabtu': ['Surya', 'Supra'],
  };

  LinkedList daftarNama = LinkedList();

  void tambahOrang(String hari, String orang1, String orang2) {
  if (jadwal.containsKey(hari)) {
    if (jadwal[hari]!.length < 2) {
      if (!jadwal[hari]!.contains(orang1)) {
        jadwal[hari]!.add(orang1);
      }
      if (!jadwal[hari]!.contains(orang2)) {
        jadwal[hari]!.add(orang2);
      }
      print('Orang berhasil ditambahkan ke jadwal pada $hari.');
    } else {
      print('Jadwal untuk hari $hari sudah penuh.');
    }
  } else {
    print('Hari tidak valid: $hari');
  }
}

  void hapusOrang(String hari, String orang) {
    if (jadwal.containsKey(hari)) {
      if (jadwal[hari]!.contains(orang)) {
        jadwal[hari]!.remove(orang);
        daftarNama.remove(orang);
        print('Orang berhasil dihapus dari jadwal pada $hari.');
      } else {
        print('Orang tidak ditemukan dalam jadwal pada $hari.');
      }
    } else {
      print('Hari tidak valid: $hari');
    }
  }

  void tampilkanAntrianPembersihan(String hari) {
    if (jadwal.containsKey(hari)) {
      print('Antrian Pembersihan pada $hari:');
      if (jadwal[hari]!.isEmpty) {
        print('Tidak ada yang piket pada hari $hari.');
      } else {
        jadwal[hari]!.forEach((orang) {
          print(orang);
        });
      }
    } else {
      print('Hari tidak valid: $hari');
    }
  }

  void tampilkanSemuaJadwal() {
    jadwal.forEach((hari, orang) {
      print('$hari: ${orang.join(', ')}');
    });
  }

  void cariOrang(String nama) {
  bool ditemukan = false;
  jadwal.forEach((hari, orang) {
    for (String namaOrang in orang) {
      if (namaOrang == nama) {
        print('$nama ditemukan pada $hari');
        ditemukan = true;
        break;
      }
    }
  });
  if (!ditemukan) {
      print('$nama tidak ditemukan dalam jadwal.');
    } 
  }
}

void main() {
  JadwalPembersihan jadwal = JadwalPembersihan();

  bool selesai = false;
  while (!selesai) {
    print('\nMenu:');
    print('1. Tampilkan Semua Jadwal Pembersihan');
    print('2. Tambah Orang ke Jadwal');
    print('3. Hapus Orang dari Jadwal');
    print('4. Tampilkan Antrian Pembersihan');
    print('5. Cari Orang');
    print('6. Keluar');
 
    stdout.write('Pilihan Anda: ');
    String? input = stdin.readLineSync();
    switch (input) {
      case '1':
        jadwal.tampilkanSemuaJadwal();
        break;
      case '2':
        stdout.write('Hari (Senin-Sabtu): ');
        String hari = stdin.readLineSync()!;
        stdout.write('Orang 1: ');
        String orang1 = stdin.readLineSync()!;
        stdout.write('Orang 2: ');
        String orang2 = stdin.readLineSync()!;
        jadwal.tambahOrang(hari, orang1, orang2);
        break;
      case '3':
        stdout.write('Hari (Senin-Sabtu): ');
        String hari = stdin.readLineSync()!;
        stdout.write('Orang yang akan dihapus: ');
        String orang = stdin.readLineSync()!;
        jadwal.hapusOrang(hari, orang);
        break;
      case '4':
        stdout.write('Masukkan hari (Senin-Sabtu): ');
        String hari = stdin.readLineSync()!;
        jadwal.tampilkanAntrianPembersihan(hari);
        break;
      case '5':
        stdout.write('Masukkan nama yang akan dicari: ');
        String nama = stdin.readLineSync()!;
        jadwal.cariOrang(nama);
        break;
      case '6':
        selesai = true;
        break;
      default:
        print('Pilihan tidak valid. Silakan coba lagi.');
    }
  }
}
