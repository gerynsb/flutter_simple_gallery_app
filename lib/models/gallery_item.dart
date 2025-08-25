class GalleryItem {
  final String id;
  final String imagePath;
  final String title;
  final String description;
  final bool isFavorite;

  GalleryItem({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.description,
    this.isFavorite = false,
  });

  GalleryItem copyWith({
    String? id,
    String? imagePath,
    String? title,
    String? description,
    bool? isFavorite,
  }) {
    return GalleryItem(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

// Sample data
List<GalleryItem> galleryItems = [
  GalleryItem(
    id: '1',
    imagePath: 'images/Gambar1.jpg',
    title: 'Lorem ipsum dolor sit amet',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, sapien vel bibendum lacinia, nisi nisl aliquam nunc, vitae aliquam nisl nisl sit amet nunc.',
  ),
  GalleryItem(
    id: '2',
    imagePath: 'images/Gambar2.JPG',
    title: 'Consectetur adipiscing elit',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in dui mauris. Vivamus hendrerit arcu sed erat molestie vehicula.',
  ),
  GalleryItem(
    id: '3',
    imagePath: 'images/Gambar3.JPG',
    title: 'Sed euismod sapien',
    description:
        'Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat.',
  ),
  GalleryItem(
    id: '4',
    imagePath: 'images/Gambar4.JPG',
    title: 'Aliquam erat volutpat',
    description:
        'Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus. Phasellus ultrices nulla quis nibh. Quisque a lectus.',
  ),
  GalleryItem(
    id: '5',
    imagePath: 'images/Gambar5.jpeg',
    title: 'Nullam in dui mauris',
    description:
        'Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum.',
  ),
  GalleryItem(
    id: '6',
    imagePath: 'images/Gambar6.jpeg',
    title: 'Vivamus hendrerit arcu',
    description:
        'Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.',
  ),
];
