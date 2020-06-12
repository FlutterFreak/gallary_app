import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gallary_app/apiService.dart';
import 'package:gallary_app/loading.dart';
import 'package:gallary_app/photoModel.dart';
import 'package:gallary_app/routes.dart';
import 'package:gallary_app/sizeConfig.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  int _counter = 0;
  List<Photo> imgList = [];
  List<Photo> photoList = [];
  @override
  void initState() {
    getPhotos();

    super.initState();
  }

  getPhotos() async {
    imgList = await getImages();

    setState(() {});
  }

  Widget _buildItem(BuildContext context, int index) {
    Photo photo = imgList[index];

    print('photo:${photo.user.profileImage.smallImage}');
    return Padding(
      padding: EdgeInsets.all(3 * SizeConfig.heightMultiplier),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.imageDetails,
              arguments: photo);
        },
        child: Card(
          elevation: 20,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            height: 20 * SizeConfig.heightMultiplier,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 20 * SizeConfig.heightMultiplier,
                    width: 40 * SizeConfig.widthMultiplier,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FadeInImage(
                                placeholder: AssetImage('assets/image.png'),
                                image: CachedNetworkImageProvider(
                                  photo.image.small,
                                )).image)),
                    child: Container(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding:
                                EdgeInsets.all(2 * SizeConfig.widthMultiplier),
                            child: Text(
                              photo.description ?? 'This is description',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 2.5 * SizeConfig.textMultiplier,
                                  color: Colors.black),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 3 * SizeConfig.widthMultiplier),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 5 * SizeConfig.imageSizeMultiplier,
                                  backgroundImage: CachedNetworkImageProvider(
                                      photo.user.profileImage.smallImage),
                                ),
                                SizedBox(
                                  width: 3 * SizeConfig.widthMultiplier,
                                ),
                                Container(
                                  width: 22 * SizeConfig.widthMultiplier,
                                  child: Text(
                                    photo.user.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 2 * SizeConfig.textMultiplier,
                                        color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallary'),
      ),
      body: imgList.length > 0
          ? AnimationLimiter(
              child: ListView.builder(
                  itemCount: imgList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                          horizontalOffset: 100.0,
                          child: FadeInAnimation(
                            child: Dismissible(
                                key: Key(imgList[index].description),
                                onDismissed: (direction) {
                                  imgList.removeAt(index);
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("Item dismissed")));
                                },
                                child: _buildItem(context, index)),
                          )),
                    );
                  }),
            )
          : LoadingDialog(),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
