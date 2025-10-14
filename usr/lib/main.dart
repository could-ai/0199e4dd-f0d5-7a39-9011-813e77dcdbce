import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter VS Code',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF007ACC),
        hintColor: const Color(0xFF007ACC),
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF333333),
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF333333),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFF252526),
        ),
      ),
      home: const VSCodeHomePage(),
    );
  }
}

class VSCodeHomePage extends StatefulWidget {
  const VSCodeHomePage({super.key});

  @override
  State<VSCodeHomePage> createState() => _VSCodeHomePageState();
}

class _VSCodeHomePageState extends State<VSCodeHomePage> {
  int _bottomNavIndex = 0;
  final TextEditingController _codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _codeController.text = '''
// Welcome to your mobile VS Code!
// Start typing your code here.

void main() {
  print('Hello, Flutter!');
}
''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('main.dart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF007ACC),
              ),
              child: Text(
                'EXPLORER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.folder_open, color: Colors.white),
              title: const Text('my_flutter_app', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                children: [
                   ListTile(
                    leading: const Icon(Icons.folder, color: Colors.grey),
                    title: const Text('lib', style: TextStyle(color: Colors.grey)),
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      leading: const Icon(Icons.description, color: Colors.blueAccent),
                      title: const Text('main.dart', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.description, color: Colors.yellowAccent),
                    title: const Text('pubspec.yaml', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _codeController,
          maxLines: null, // Allows for multiline input
          expands: true, // Expands to fill the available space
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontFamily: 'monospace', color: Colors.white, fontSize: 16),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Start coding...',
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.terminal),
            label: 'Terminal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bug_report),
            label: 'Debug',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error_outline),
            label: 'Problems',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.output),
            label: 'Output',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }
}
