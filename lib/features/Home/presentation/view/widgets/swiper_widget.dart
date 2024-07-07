import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shopsmart_users/core/loading/image_loading.dart';

class SwiperWidget extends StatelessWidget {
  const SwiperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SizedBox(
      height: size.height *0.24,
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(20),
        child: Swiper(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: "https://th.bing.com/th/id/OIP.IVJnH-IgjutT-MAldsMlTAHaFL?rs=1&pid=ImgDetMain",
              placeholder: (context, url) => const ImageLoading(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            );
          },
          pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.white,
              activeColor: Colors.red,
            ),
          ),
          autoplay: true,
        ),
      ),
    );
  }
}
