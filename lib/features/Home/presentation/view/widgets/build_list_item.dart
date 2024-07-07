import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopsmart_users/features/Search/data/model/product_model.dart';

import '../../../../../core/loading/image_loading.dart';
import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/const.dart';
import '../../../../Details/presentaton/view/details_view.dart';

class BuildListItem extends StatelessWidget {
  const BuildListItem({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        navigateTo(
            context,
            DetailsView(
              image: model.productImage!,
              title: model.productTitle,
              price: model.productPrice,
              category:model.productCategory!,
              description: model.productDescription,
            ));
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
                    imageUrl: model.productImage!,
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
                        child: Text(
                          model.productTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
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
                       Text(
                        '\$${model.productPrice}',
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
