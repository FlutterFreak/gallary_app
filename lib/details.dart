import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallary_app/photoModel.dart';
import 'package:gallary_app/sizeConfig.dart';

class FullImage extends StatefulWidget {
  final Photo img;
  const FullImage({Key key, this.img}) : super(key: key);
  @override
  _FullImageState createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  @override
  void initState() {
    print('img:${widget.img.image.full}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                    ),
                    child: FadeInImage(
                        fit: BoxFit.fill,
                        placeholder: Image.asset(
                          'assets/image.png',
                        ).image,
                        image: CachedNetworkImageProvider(
                          widget.img.image.full,
                        )),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(5 * SizeConfig.widthMultiplier),
                  child: Text(
                    widget.img.description ?? 'This is description',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 2.5 * SizeConfig.textMultiplier,
                        color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
