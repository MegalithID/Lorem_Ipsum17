import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HalamanDepanMahasiswa(),
    );
  }
}

class Mahasiswa {
  final String nama;
  final String nim;
  final String prodi;
  final String email;
  final String noHp;
  final String hobi;
  final String ipk;

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.email,
    required this.noHp,
    required this.hobi,
    required this.ipk,
  });
}

class HalamanDepanMahasiswa extends StatelessWidget {
  const HalamanDepanMahasiswa({super.key});

  @override
  Widget build(BuildContext context) {
    final mahasiswas = [
      Mahasiswa(
        nama: 'Fahmi Syamsul Bahrie Syahputra',
        nim: 'F12.2022.00073',
        prodi: 'Sistem Informasi',
        ipk: '3.5',
        email: 'bahriesyahputra@email.com',
        noHp: '081234567890',
        hobi: 'Musik dan Olahraga',
      ),
      Mahasiswa(
        nama: 'IDK its Just Test :v',
        nim: 'F12.2022.00075',
        prodi: 'Sistem Informasi',
        ipk: '3.5',
        email: 'hwwhwhwh@email.com',
        noHp: '087654321098',
        hobi: 'Membaca dan Menulis',
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mahasiswa'),
        backgroundColor: Colors.blue[300],
      ),
      body: ListView.builder(
        itemCount: mahasiswas.length,
        itemBuilder: (context, index) {
          final mahasiswa = mahasiswas[index];
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(mahasiswa.nama),
            subtitle: Text(mahasiswa.nim),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilMahasiswa(mahasiswa: mahasiswa),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProfilMahasiswa extends StatelessWidget {
  final Mahasiswa mahasiswa;

  const ProfilMahasiswa({super.key, required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: Colors.blue[300],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(  
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.person, size: 70, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      mahasiswa.nama,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildDetailRow(Icons.numbers, 'NIM', mahasiswa.nim),
                    _buildDetailRow(Icons.school, 'Prodi', mahasiswa.prodi),
                    _buildDetailRow(Icons.email, 'Email', mahasiswa.email),
                    _buildDetailRow(Icons.grade, 'IPK', mahasiswa.ipk),
                    _buildDetailRow(Icons.phone, 'No. HP', mahasiswa.noHp),
                    _buildDetailRow(Icons.favorite, 'Hobi', mahasiswa.hobi),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                value,
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}