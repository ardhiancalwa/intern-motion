import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

import '../../data/model/edit_profile_model.dart';

class UserNewFollow extends StatelessWidget {
  final EditProfileModel userProfile;
  const UserNewFollow({super.key, required this.userProfile});

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
          userProfile.isFollow
              ? Container(
                  width: double.infinity,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[700],
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Following',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                )
              : Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue,
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[200],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Message',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[200],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Subscribe',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[200],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Contact',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[200],
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person_add_outlined,
                              color: Colors.black,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
        ],
      ),
    );
  }
}
