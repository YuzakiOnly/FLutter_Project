import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'Selamat Datang di Halaman Utama',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Ini adalah halaman beranda dari aplikasi kami.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Kami'),
        backgroundColor: Colors.green,
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                'https://via.placeholder.com/150',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Yuzaki Arya',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Saya adalah seorang pengembang Flutter yang berdedikasi. Passion saya adalah menciptakan aplikasi mobile yang inovatif dan berguna.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman lainnya dibuat serupa dengan drawer yang sama.
class PortofolioPage extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {
      'name': 'Aplikasi Manajemen Tugas',
      'description': 'Aplikasi untuk mengelola dan melacak tugas harian.',
      'icon': '📋'
    },
    {
      'name': 'Aplikasi Kesehatan',
      'description': 'Pelacak aktivitas dan nutrisi harian.',
      'icon': '❤️'
    },
    {
      'name': 'Game Edukasi',
      'description': 'Game interaktif untuk pembelajaran anak-anak.',
      'icon': '🎮'
    },
  ];

  PortofolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portofolio'),
        backgroundColor: Colors.purple,
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Text(
                projects[index]['icon']!,
                style: const TextStyle(fontSize: 30),
              ),
              title: Text(
                projects[index]['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(projects[index]['description']!),
            ),
          );
        },
      ),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontak Kami'),
        backgroundColor: Colors.orange,
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.contact_mail, size: 100, color: Colors.orange),
            const SizedBox(height: 20),
            const Text(
              'Hubungi Kami',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Email: yuzakiarya@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Telepon: +62 123 4567 8900',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pesan terkirim!')),
                );
              },
              child: const Text('Kirim Pesan'),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: FlutterLogo(size: 50),
            ),
            decoration: BoxDecoration(color: Colors.blueAccent),
            accountName: Text(
              'Yuzaki Arya',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            accountEmail: Text(
              'yuzakiarya@gmail.com',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Us'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AboutUsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: const Text('Portofolio'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PortofolioPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ContactUsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Drawer Example',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const HomePage(),
  ));
}
