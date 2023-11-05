import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:style_trend_talk/data/index.dart';
import 'package:style_trend_talk/pages/index.dart';
import 'package:style_trend_talk/widget/progressIndicatorWidget.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecommendTabPage extends StatefulWidget {
  const RecommendTabPage({super.key});

  @override
  State<RecommendTabPage> createState() => _RecommendTabPageState();
}

List<String> items = List.generate(3, (index) => 'Item $index');

class _RecommendTabPageState extends State<RecommendTabPage>
    with TickerProviderStateMixin {
  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, RecommendationModel>.separated(
      padding: const EdgeInsets.only(bottom: 100),
      separatorBuilder: (context, index) => const SizedBox(height: 1),
      pagingController: mainController.pagingController,
      builderDelegate: PagedChildBuilderDelegate<RecommendationModel>(
        itemBuilder: (context, item, index) {
          return RecommendItemDetails(index: index, itemData: item);
        },
      ),
      // noItemsFoundBuilder: (context) => const ProgressIndicatorWidget(),
    );
    // return ListView.separated(
    //   padding: const EdgeInsets.only(bottom: 100),
    //   separatorBuilder: (context, index) => const SizedBox(height: 1),
    //   itemCount: items.length + 1, // Add 1 for load more indicator
    //   itemBuilder: (context, index) {
    //     if (index < items.length) {
    //       return RecommendItemDetails(index: index);
    //     } else if (index == items.length) {
    //       // Load more indicator
    //       return const ProgressIndicatorWidget();
    //     }
    //     return null;
    //   },
    // );
  }
}

class RecommendItemDetails extends StatefulWidget {
  const RecommendItemDetails(
      {super.key, required this.index, required this.itemData});
  final RecommendationModel itemData;
  final int index;
  @override
  State<RecommendItemDetails> createState() => _RecommendItemDetailsState();
}

class _RecommendItemDetailsState extends State<RecommendItemDetails> {
  final MainController getMainController = Get.put(MainController());
  late final RecommendationModel userData;

  @override
  void initState() {
    // userData = getMainController.dataList[widget.index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          _UserDescribe(),
          _imgContextWidget(context),
          _DescribeWidget(),
          _TagWidget(),
          _LikeOrStarWidget(),
          _TimeContainer(),
        ]),
      ),
    );
  }

  Container _TimeContainer() {
    return Container(
        height: 30,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: const Row(
          children: [
            Text(
              '2 hours ago',
              style: TextStyle(
                  color: Color.fromARGB(255, 102, 102, 102), fontSize: 12),
            )
          ],
        ));
  }

  Container _LikeOrStarWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      height: 44,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _IconNum(
              icon: FontAwesomeIcons.heart,
              nums: '1.2k',
            ),
            const SizedBox(
              width: 20,
            ),
            const _IconNum(
              icon: FontAwesomeIcons.star,
              nums: '1.2k',
            ),
            const SizedBox(
              width: 20,
            ),
            const _IconNum(
              icon: FontAwesomeIcons.comment,
              nums: '1.2k',
            ),
            const SizedBox(
              width: 20,
            ),
            const _IconNum(
              icon: FontAwesomeIcons.shareFromSquare,
              nums: '1.2k',
            ),
            const Spacer(),
            _UserImagesDetailsWidget(),
            const Icon(
              FontAwesomeIcons.ellipsisVertical,
              size: 18,
              color: Color.fromARGB(255, 102, 102, 102),
            ),
          ]),
    );
  }

  Container _UserImagesDetailsWidget() {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: const Stack(alignment: AlignmentDirectional.centerEnd, children: [
        _ImgCircles(
          left: 0,
          imgPath: 'assets/images/recommend/avtr.png',
        ),
        _ImgCircles(
          left: 20,
          imgPath: 'assets/images/recommend/avtr.png',
        ),
        _ImgCircles(
          left: 40,
          imgPath: 'assets/images/recommend/avtr.png',
        ),
      ]),
    );
  }

  Container _UserDescribe() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/images/recommend/avtr.png'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.itemData.userName,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: AutofillHints.birthdayDay),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Follow',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
              const Row(
                children: [
                  Text(
                    'Harvard University',
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          const Icon(
            FontAwesomeIcons.ellipsis,
            size: 18,
            color: Color.fromARGB(255, 102, 102, 102),
          )
        ],
      ),
    );
  }

  Widget _imgContextWidget(BuildContext context) {
    late double screenWidth = MediaQuery.of(context).size.width;
    if (widget.itemData.photo == null || widget.itemData.photo!.isEmpty) {
      return const SizedBox(height: 0);
    }
    print('widget.itemData.photo----${widget.itemData.photo}');
    late double imgHeight = 140;
    late int contextFlag = 1;
    if (widget.itemData.photo != null && widget.itemData.photo!.length == 1) {
      imgHeight = 260;
      contextFlag = 2;
      return Container(
        height: 320,
        width: screenWidth,
        color: Colors.black,
        child: Image(
          image: AssetImage(widget.itemData.photo![0]),
          fit: BoxFit.cover,
        ),
      );
    } else if (widget.itemData.photo != null &&
        widget.itemData.photo!.length > 1 &&
        widget.itemData.photo!.length < 3) {
      imgHeight = 260;
      contextFlag = 3;
    } else if (widget.itemData.photo != null &&
        widget.itemData.photo!.length == 3) {
      imgHeight = 260;
      contextFlag = 4;
    } else if (widget.itemData.photo != null &&
        widget.itemData.photo!.length > 3 &&
        widget.itemData.photo!.length <= 6) {
      imgHeight = 260;
      contextFlag = 5;
    } else if (widget.itemData.photo != null &&
        widget.itemData.photo!.length > 6) {
      imgHeight = 260;
      contextFlag = 6;
    }
    print('imgHeight---contextFlag---${imgHeight}-----${contextFlag}');
    return Container(
        height: imgHeight,
        color: Colors.black,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            childAspectRatio: 1.0,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.itemData.photo!.length,
          shrinkWrap: true, // 确保尽可能小地包装内容
          itemBuilder: (context, index) {
            return Container(
                child: Image(
              image: AssetImage(widget.itemData.photo![index]),
              fit: BoxFit.cover,
            ));
          },
        ));
  }

  Container _DescribeWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: const Text(
        'Life was like a box of chocolates, you never know what you going to get.',
        style: TextStyle(color: Color.fromARGB(255, 54, 54, 54), fontSize: 14),
      ),
    );
  }

  Container _TagWidget() {
    late List<String> tagList = ['Movie', 'Classis ines'];
    return Container(
      height: 34,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: tagList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(25))),
            child: Text(tagList[index],
                style: const TextStyle(color: Colors.black, fontSize: 10)),
          );
        },
      ),
    );
  }
}

class _IconNum extends StatelessWidget {
  const _IconNum({super.key, required this.icon, required this.nums});
  final IconData? icon;
  final String nums;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 18,
          color: const Color.fromARGB(255, 102, 102, 102),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          nums,
          style: const TextStyle(
              color: Color.fromARGB(255, 102, 102, 102), fontSize: 12),
        )
      ],
    );
  }
}

class _ImgCircles extends StatelessWidget {
  const _ImgCircles({super.key, required this.left, required this.imgPath});
  final double? left;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        top: 5,
        child: Container(
          width: 30, // 设置头像的宽度
          height: 30, // 设置头像的高度
          decoration: BoxDecoration(
            shape: BoxShape.circle, // 将容器形状设置为圆形
            border: Border.all(
              color: Color.fromARGB(255, 255, 255, 255), // 边框颜色
              width: 3.0, // 边框宽度
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              imgPath, // 头像图片的路径
              fit: BoxFit.cover, // 图片适应方式
            ),
          ),
        ));
  }
}
