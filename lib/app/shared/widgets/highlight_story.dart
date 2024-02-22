import 'package:deep_dive_get_cli/app/data/model/story_model.dart';
import 'package:flutter/material.dart';

class HighlightStory extends StatelessWidget {
  final void Function()? onTap;
  final StoryModel highlightStory;
  const HighlightStory({
    super.key,
    required this.highlightStory,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(72),
                  child: Image.asset(
                    'assets/images/story/${highlightStory.image}.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 72,
              child: Text(
                highlightStory.namaAkun,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
