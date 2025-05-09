import 'package:flutter/material.dart';
import '../models/user.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  UserDetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Pengguna')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CircleAvatar(child: Text(user.name[0]), radius: 40)),
            SizedBox(height: 20),
            _buildInfoSection('Informasi Pribadi', [
              _buildInfoRow('Nama', user.name),
              _buildInfoRow('Username', user.username),
              _buildInfoRow('Email', user.email),
              _buildInfoRow('Telepon', user.phone),
              _buildInfoRow('Website', user.website),
            ]),
            SizedBox(height: 20),
            _buildInfoSection('Alamat', [
              _buildInfoRow('Jalan', user.address.street),
              _buildInfoRow('Suite', user.address.suite),
              _buildInfoRow('Kota', user.address.city),
              _buildInfoRow('Kode Pos', user.address.zipcode),
              _buildInfoRow(
                'Koordinat',
                '${user.address.geo.lat}, ${user.address.geo.lng}',
              ),
            ]),
            SizedBox(height: 20),
            _buildInfoSection('Perusahaan', [
              _buildInfoRow('Nama', user.company.name),
              _buildInfoRow('Slogan', user.company.catchPhrase),
              _buildInfoRow('BS', user.company.bs),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Card(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(children: children),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '$label:',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(flex: 2, child: Text(value)),
        ],
      ),
    );
  }
}
