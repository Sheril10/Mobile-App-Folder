import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      
      home: const TabNavScreen(),
    );
  }
}

class TabNavScreen extends StatelessWidget {
  const TabNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Navigation'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.search), text: 'Search'),
              Tab(icon: Icon(Icons.notifications), text: 'Alerts'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
              Tab(icon: Icon(Icons.settings), text: 'More'), // New Tab
            ],
          ),        
          ),
          body: const TabBarView(
          children: [
            HomeTab(), 
            SearchTab(), 
            NotificationsTab(), 
            ProfileTab(),
            NewTab(), 
          ],
        ),
      ),
    );
  }
}

// --- EXISTING TABS ---
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const ListTile(
          leading: Icon(Icons.home, color: Colors.pink),
          title: Text('Home Tab', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Displays the user\'s feed'),
        ),
        const Divider(),
        ...List.generate(5, (i) => Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text('Post #${i + 1}'),
            subtitle: const Text('Posted 2 hours ago'),
          ),
        )),
      ],
    );
  }
}

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Search',
              hintText: 'Search for content...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Search Tab', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});
  final _notifications = const ['Alice liked your post', 'Bob followed you'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _notifications.length,
      itemBuilder: (_, i) => ListTile(
        leading: const Icon(Icons.notifications, color: Colors.pink),
        title: Text(_notifications[i]),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(radius: 48, child: Icon(Icons.person, size: 48)),
          const Text('John Doe', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ElevatedButton(onPressed: () {}, child: const Text('Edit Profile')),
        ],
      ),
    );
  }
}

//newtab
class NewTab extends StatelessWidget {
  const NewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'More',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SwitchListTile(
          title: const Text('Theme'),
          value: false,
          onChanged: (bool value) {},
          secondary: const Icon(Icons.dark_mode),
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('Language'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.lock),
          title: const Text('Privacy'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
      ],
    );
  }
}