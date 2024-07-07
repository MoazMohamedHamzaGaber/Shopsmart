import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/loading/image_loading.dart';
import '../../../../../core/utils/components.dart';

class BuildListItem extends StatelessWidget {
  const BuildListItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        // navigateTo(
        //     context,
        //     DetailsView(
        //       image: products['productImage'],
        //       title: products['productTitle'],
        //       price: products['productPrice'],
        //       category: products['productCategory'],
        //       description: products['productDescription'],
        //     ));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: SizedBox(
          width: size.width * 0.4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    height: size.height * 0.18,
                    width: size.width * 0.18,
                    fit: BoxFit.fill,
                    imageUrl: "https://th.bing.com/th/id/OIP.IVJnH-IgjutT-MAldsMlTAHaFL?rs=1&pid=ImgDetMain",
                    placeholder: (context, url) => const ImageLoading(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: const Text(
                          'productTitle',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              print('object');
                            },
                            child: const Icon(
                              Icons.add_shopping_cart,
                              size: 18,
                              //color: Colors.red,
                            ),
                          ),
                          const Spacer(),
                          myHeart(function: () {}),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'productPrice',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
