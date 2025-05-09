import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';
import './post_detail_screen.dart';

class PostsScreen extends StatefulWidget {
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late Future<List<Post>> futurePosts;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futurePosts = apiService.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Postingan'),
        actions: [
          IconButton(
            icon: Icon(Icons.comment),
            onPressed: () {
              Navigator.pushNamed(context, '/comments');
            },
            tooltip: 'Lihat Komentar',
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/users');
            },
            tooltip: 'Lihat Pengguna',
          ),
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(
                      snapshot.data![index].title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      snapshot.data![index].body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  PostDetailScreen(post: snapshot.data![index]),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_post');
        },
        child: Icon(Icons.add),
        tooltip: 'Buat Postingan Baru',
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Aplikasi Pelihat Komentar',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Beranda'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('Postingan'),
              selected: true,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.comment),
              title: Text('Komentar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/comments');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Pengguna'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/users');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Buat Postingan Baru'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/create_post');
              },
            ),
          ],
        ),
      ),
    );
  }
}
