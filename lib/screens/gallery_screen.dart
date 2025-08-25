import 'package:flutter/material.dart';
import '../models/gallery_item.dart';
import '../widgets/gallery_item_card.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<GalleryItem> _items = [];
  String _viewMode = 'grid'; // 'grid' or 'list'
  String _filterMode = 'all'; // 'all' or 'favorites'

  @override
  void initState() {
    super.initState();
    _items = List.from(galleryItems);
  }

  void _toggleViewMode() {
    setState(() {
      _viewMode = _viewMode == 'grid' ? 'list' : 'grid';
    });
  }

  void _setFilterMode(String mode) {
    setState(() {
      _filterMode = mode;
    });
  }

  void _onItemFavoriteToggle(int index, bool isFavorite) {
    setState(() {
      _items[index] = _items[index].copyWith(isFavorite: isFavorite);
    });
  }

  List<GalleryItem> get _filteredItems {
    if (_filterMode == 'favorites') {
      return _items.where((item) => item.isFavorite).toList();
    }
    return _items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: Icon(_viewMode == 'grid' ? Icons.list : Icons.grid_view),
            onPressed: _toggleViewMode,
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter chips
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildFilterChip('All', 'all'),
                  const SizedBox(width: 8),
                  _buildFilterChip('Favorites', 'favorites'),
                ],
              ),
            ),
          ),

          // Gallery content
          Expanded(
            child: _filteredItems.isEmpty
                ? _buildEmptyState()
                : _viewMode == 'grid'
                ? _buildGridView()
                : _buildListView(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String mode) {
    final isSelected = _filterMode == mode;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        _setFilterMode(mode);
      },
      backgroundColor: Colors.grey[200],
      selectedColor: Theme.of(context).colorScheme.primaryContainer,
      checkmarkColor: Theme.of(context).colorScheme.primary,
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.photo_library_outlined,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            _filterMode == 'favorites'
                ? 'No favorite items yet'
                : 'No gallery items available',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          if (_filterMode == 'favorites')
            TextButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text('Show All Items'),
              onPressed: () {
                _setFilterMode('all');
              },
            ),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: _filteredItems.length,
      itemBuilder: (context, index) {
        final item = _filteredItems[index];
        return GalleryItemCard(
          item: item,
          onTap: () {
            Navigator.pushNamed(context, '/detail', arguments: item);
          },
          onFavoriteToggle: (isFavorite) {
            final originalIndex = _items.indexOf(item);
            _onItemFavoriteToggle(originalIndex, isFavorite);
          },
        );
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: _filteredItems.length,
      itemBuilder: (context, index) {
        final item = _filteredItems[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                item.imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              item.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              icon: Icon(
                item.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: item.isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                final originalIndex = _items.indexOf(item);
                _onItemFavoriteToggle(originalIndex, !item.isFavorite);
              },
            ),
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: item);
            },
          ),
        );
      },
    );
  }
}
