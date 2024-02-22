import 'package:deep_dive_get_cli/app/data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modules/home/controllers/home_controller.dart';

class Post extends StatelessWidget {
  final PostModel postModel;
  final void Function()? onPressed;
  final void Function()? onPressed2;
  const Post({
    super.key,
    required this.postModel,
    this.onPressed,
    this.onPressed2,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = HomeController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => homeController.toProfileNewFollowing(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    36,
                  ),
                  child: SizedBox(
                    width: 36,
                    height: 36,
                    child: Image.asset(
                      postModel.fotoProfile.isEmpty
                          ? ""
                          : 'assets/images/profile/${postModel.fotoProfile}.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => homeController.toProfileNewFollowing(),
                      child: Text(
                        postModel.namaAkun.isEmpty ? "" : postModel.namaAkun,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    postModel.isSponsor
                        ? Text(
                            "Sponsored",
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Image.asset(
          'assets/images/story/${postModel.postingGambar}.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 390,
        ),
        postModel.isSponsor
            ? const SizedBox()
            : const SizedBox(
                height: 9.75,
              ),
        postModel.isSponsor
            ? Container(
                color: Colors.blue,
                width: double.infinity,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "CTA Copy Here",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    postModel.isLike
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: postModel.isLike
                        ? (Theme.of(context).brightness == Brightness.light
                            ? Colors.red
                            : Colors
                                .redAccent) // Set different colors for light and dark modes
                        : (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors
                                .black), // Set different colors for light and dark modes
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                  ),
                )
              ],
            ),
            IconButton(
              onPressed: onPressed2,
              icon: Icon(
                postModel.isBookmark ? Icons.bookmark : Icons.bookmark_border,
                color: postModel.isBookmark
                    ? (Theme.of(context).brightness == Brightness.light
                        ? Colors.yellow
                        : Colors
                            .yellowAccent) // Set different colors for light and dark modes
                    : (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors
                            .black), // Set different colors for light and dark modes
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '${postModel.jumlahLike} Likes',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: '${postModel.namaAkun} ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: postModel.description,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
                const TextSpan(
                  text: 'more',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Text(
            'View all comments',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
