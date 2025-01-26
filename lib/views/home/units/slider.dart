part of '../view.dart';

class Slider extends StatefulWidget {
  const Slider({Key? key}) : super(key: key);

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  int currentIndex = 0;
  static List<AppBanner> banners = [];

  @override
  void initState() {
    getBanners();
    super.initState();
  }

  void getBanners() async {
    banners = (await GeneralDatasource().getBanners()).cast<AppBanner>();
    rebuild();
  }

  void rebuild() {
    if (mounted) setState(() {});
  }

  void changeIndex(int value) {
    currentIndex = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty) {
      return SizedBox();
    }
    return Container(
      height: 140.height,
      // padding: EdgeInsets.symmetric(vertical: 20),
      child: CarouselSlider(
        options: CarouselOptions(),
        items: banners.map((i) {
          return _banner(i.image);
        }).toList(),
      ),
    );
  }

  Widget _banner(String image) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: AppNetworkImage(
            url: image,
            fit: BoxFit.fill,
            borderRadius: 12,
          ),
        );
      },
    );
  }
}
