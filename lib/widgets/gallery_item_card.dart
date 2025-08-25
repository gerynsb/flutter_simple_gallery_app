import 'package:flutter/material.dart';
import '../models/gallery_item.dart';

class GalleryItemCard extends StatelessWidget {
  final GalleryItem item;
  final Function onTap;
  final Function(bool) onFavoriteToggle;

  const GalleryItemCard({
    super.key,
    required this.item,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  item.imagePath,
                  height: 150, // Reduced height from 200 to 150
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                IconButton(
                  icon: Icon(
                    item.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: item.isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: () => onFavoriteToggle(!item.isFavorite),
                ),
              ],
            ),
            Expanded(
              // Wrapped in Expanded to prevent overflow
              child: Padding(
                padding: const EdgeInsets.all(8.0), // Reduced padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 14.0, // Reduced font size
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      item.description,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[600],
                      ), // Reduced font size
                      maxLines: 1, // Reduced to 1 line
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
