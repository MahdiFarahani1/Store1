import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

class ItemNotif extends StatelessWidget {
  const ItemNotif({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
      width: EsaySize.width(context),
      height: EsaySize.height(context) / 6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "This is a notification text placeholder. You can replace this with any notification message.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: EsaySize.width(context) - 52,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16),
              child: const Center(
                child: Text(
                  'Footer text goes here',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: -20,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Theme.of(context).iconTheme.color!,
              child: SvgPicture.asset(
                Assets.icons.notification,
                width: 30,
                height: 30,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
