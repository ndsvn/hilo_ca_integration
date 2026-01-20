import 'package:flutter/material.dart';

import '../../../cores/cores_src.dart';
import '../../../shares/shares_src.dart';
import '../home.src.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.currentTab,
    // required this.onSelectTab,
    // required this.count,
    required this.homeController,
    required this.tabController,
  });
  final TabItem currentTab;

  // final ValueChanged<TabItem> onSelectTab;
  // final int count;
  final HomeController homeController;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetPlatform.isIOS
          ? AppDimens.heightBottomTabBar
          : AppDimens.heightBottomTabBarAndroid,
      // color: AppColors.white,
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.colorBasicGrey3,
            width: 0.5,
          ),
        ),
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(AppDimens.size20)),
      ),

      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppDimens.sizeBorderNavi)),
              child: TabBar(
                // indicator: CustomIndicator(),
                indicatorColor: Colors.transparent,
                onTap: (index) async {
                  homeController.funcPageChange(index);
                },
                splashBorderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppDimens.sizeBorderNavi)),
                controller: tabController,
                isScrollable: false,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  _bottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      currentTab != TabItem.homePage
                          ? Assets.ASSETS_ECERT_HOME_UNSELECT_SVG
                          : Assets.ASSETS_ECERT_HOME_SELECT_SVG,
                    ),
                    isSelect: currentTab == TabItem.homePage,
                  ),
                  _bottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      currentTab != TabItem.listCert
                          ? Assets.ASSETS_ECERT_HOMECTS_SVG
                          : Assets.ASSETS_ECERT_HOMECTS_SELECT_SVG,
                    ),
                    isSelect: currentTab == TabItem.listCert,
                  ),
                  _bottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      currentTab != TabItem.profile
                          ? Assets.ASSETS_ECERT_PROFILE_SVG
                          : Assets.ASSETS_ECERT_ICONUSER_SVG,
                    ),
                    isSelect: currentTab == TabItem.profile,
                  ),
                ],
              ).paddingOnly(
                  left: AppDimens.paddingTabBar,
                  right: AppDimens.paddingTabBar),
            ),
          ),
        ],
      ),
    );
  }

  _bottomNavigationBarItem({
    required Widget icon,
    required bool isSelect,
  }) {
    return SizedBox(
      width:
          Get.width / (HomeConst.tabName.length) - AppDimens.paddingTabBar / 3,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: AppDimens.paddingSmallBottomNavigation,
          left: AppDimens.paddingSmallBottomNavigation,
          right: AppDimens.paddingSmallBottomNavigation,
          top: AppDimens.paddingBottomTabBar,
        ),
        child: Container(
          decoration: isSelect
              ? BoxDecoration(
                  color: AppColors.lightPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                )
              : null,
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
          child: Center(
            child: SizedBox(
              width: AppDimens.iconVerySmall,
              height: AppDimens.iconVerySmall,
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
