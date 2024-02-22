import 'package:deep_dive_get_cli/app/data/model/edit_profile_model.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final EditProfileModel userProfile;
  const UserProfile({
    super.key,
    required this.userProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.asset(
                  'assets/images/profile/${userProfile.imageProfile}.jpg'),
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userProfile.numOfPosts,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('Post'),
                  ],
                ),
                const SizedBox(
                  width: 24,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userProfile.numOfFollowers,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('Followers'),
                  ],
                ),
                const SizedBox(
                  width: 24,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userProfile.numOfFollowing,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('Following'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
