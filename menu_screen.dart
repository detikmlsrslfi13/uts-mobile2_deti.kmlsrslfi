import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late List<String> _filteredList;
  String _keywords = '';
  final List<String> _originList = [
    'Topi Fedora',
    'Topi Trucker',
    'Topi Newsboy',
    'Topi Beanie',
    'Topi Bowler',
    'Topi Baseball',
    'Topi Bucket',
    'Topi Panama',
    'Topi Boater',
    'Topi Flat Cap',
    'Topi Beret',
    'Topi Visor',
    'Topi Homburg',
    'Topi Pork Pie',
    'Topi Fez',
    'Topi Sailo',
    'Topi Sun Hat',
    'Topi Ascot',
    'Topi Turban',
    'Topi Cloche',
    'Topi Cowboy',
    'Topi Stetson',
    'Topi Gatsby',
    'Topi Newsie',
    'Topi Sombrero',
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _filteredList = [];
    _originList.sort();
    _searchController.addListener(() {
      debugPrint('search value : ${_searchController.text}');
      setState(() => _keywords = _searchController.text);
      _search();
    });
    super.initState();
  }

  void _search() {
    _filteredList.clear();
    for (int i = 0; i < _originList.length; i++) {
      String item = _originList[i];
      if (item.toLowerCase().contains(_keywords.toLowerCase())) {
        _filteredList.add(item);
      }
    }
  }

  Widget _buildList({required List<String> list}) => Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) => SizedBox(
            height: 50,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                list[index],
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          separatorBuilder: (context, index) =>
              const Divider(height: 2, color: Colors.blue),
          itemCount: list.length,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 18)),
          ),
          _buildList(list: _keywords.isEmpty ? _originList : _filteredList)
        ],
      ),
    );
  }
}
