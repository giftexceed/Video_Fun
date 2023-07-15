import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/feed_model.dart';
import 'models/feed_response.dart';
import 'videos/bloc/feed_bloc.dart';
import 'videos/widget/videos_widget.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  void initState() {
    super.initState();
    feedBloc.getFeeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FeedResponse>(
        stream: feedBloc.subject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.error != '' && snapshot.data!.error.isNotEmpty) {
              return buildErrorWidget(snapshot.data!.error);
            }
            return _buildFeedWidget(snapshot.data!);
          } else if (snapshot.hasError) {
            return buildErrorWidget('error');
          } else {
            return buildLoaderWidget();
          }
        },
      ),
    );
  }

  Widget _buildFeedWidget(FeedResponse data) {
    List<FeedModel> feeds = data.feeds;
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: feeds.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                VideoWidget(url: feeds[index].videos[0].link),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black.withOpacity(0.15)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0, 0, 0.6, 1]),
                  ),
                ),
                Positioned(
                    left: 12.0,
                    bottom: 32.0,
                    child: SafeArea(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.white,
                                  ),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(feeds[index].image))),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  feeds[index].creator.name,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Text(
                                  feeds[index].creator.url,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ))),
                Positioned(
                    right: 12.0,
                    bottom: 50.0,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.heart,
                              color: Colors.white,
                              size: 35,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.chat_bubble,
                              color: Colors.white,
                              size: 35,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.paperplane,
                              color: Colors.white,
                              size: 35,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ))
              ],
            ),
          );
        });
  }
}

Widget buildErrorWidget(String error) {
  return const Column(
    children: [
      Text(
        'Error',
        style: TextStyle(color: Colors.white),
      )
    ],
  );
}

Widget buildLoaderWidget() {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.0,
          width: 25.0,
          child: CupertinoActivityIndicator(),
        )
      ],
    ),
  );
}
