import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.cardBg, // The product list background is slightly gray, the card itself is white
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Inside the Column of your ProductCard build method:
              children: [
                // 1. The Image (REPLACE THE OLD IMAGE BLOCK WITH THIS)
                AspectRatio(
                  aspectRatio: 1, 
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imageUrl, // This will now look for paths like 'assets/images/product_mask.png'
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // If you haven't added the image to assets yet, this gray box appears
                        return Container(
                          color: Colors.grey[200], 
                          child: const Icon(Icons.image, color: Colors.grey)
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 12),
            
            // 2. Title
            Text(title, style: AppTextStyles.productTitle, maxLines: 2, overflow: TextOverflow.ellipsis),
            
            // 3. Price & Add to Cart (Bottom Row)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rs. $price", style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold)),
                
                // The small square 'Add to Cart' button
                SizedBox(
                  width: 36, height: 36,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Outline button style in design
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Color(0xFFEEEEEE)), // Light border
                      ),
                    ),
                    child: const Icon(Icons.add, color: AppColors.textMain, size: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}