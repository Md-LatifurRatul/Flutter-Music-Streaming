import 'package:flutter/material.dart';
import 'package:flutter_spotify/core/configs/assets/app_images.dart';
import 'package:flutter_spotify/core/configs/assets/app_vectors.dart';
import 'package:flutter_spotify/core/configs/theme/app_colors.dart';
import 'package:flutter_spotify/presentation/widgets/app_logo.dart';
import 'package:flutter_spotify/presentation/widgets/basic_app_bar.dart';
import 'package:flutter_spotify/presentation/widgets/helpers/is_dark_mode.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        hideBack: true,
        title: AppLogo(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _homeTopCard(),
            _tabBar(),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                AppVectors.homeArtistCard,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Image.asset(
                  AppImages.homeArtist,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      dividerHeight: 0,
      indicatorColor: AppColors.primary,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 10),
      labelPadding: const EdgeInsets.all(15),
      tabAlignment: TabAlignment.start,
      tabs: const [
        Text(
          'News',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        Text(
          'Videos',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        Text(
          'Artists',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        Text(
          'Podcasts',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
