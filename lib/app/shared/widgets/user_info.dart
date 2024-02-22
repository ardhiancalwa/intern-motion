import 'package:deep_dive_get_cli/app/data/model/edit_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

class UserInfo extends StatelessWidget {
  final EditProfileModel userProfile;
  const UserInfo({
    super.key,
    required this.userProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userProfile.username,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            userProfile.category,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          Text(userProfile.description),
          Text(
            userProfile.hashtag,
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
          Text(
            userProfile.hyperlink,
            style:
                TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: FlutterImageStack.widgets(
                  totalCount: 3,
                  itemCount: 3,
                  itemRadius: 100,
                  itemBorderWidth: 10,
                  itemBorderColor:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : Colors.black,
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                          'assets/images/profile/rapli_profile.jpg'),
                    ),
                    CircleAvatar(
                      child: Image.asset(
                          'assets/images/profile/falah_profile.jpg'),
                    ),
                    CircleAvatar(
                      child:
                          Image.asset('assets/images/profile/dika_profile.jpg'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Flexible(
                child: RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: 'Followed by ',
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white, // set your desired color here
                    ),
                    children: const [
                      TextSpan(
                        text: 'username, username ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: 'and '),
                      TextSpan(
                        text: '100 others',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.person_add_outlined,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
