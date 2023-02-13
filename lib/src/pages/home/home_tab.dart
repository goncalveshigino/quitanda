import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;
import 'package:quitanda/src/pages/common_widgets/custom_shimmer.dart';
import 'package:quitanda/src/pages/home/components/home_tile/home_item_tile.dart';
import 'package:quitanda/src/pages/home/controller/home_controller.dart';
import 'package:quitanda/src/services/utils_services.dart';

import '../common_widgets/app_name_widget.dart';
import 'components/home_tile/categoria_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;

  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCartAnimation(gkImage);
  }

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Get.find<HomeController>().printExample();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const AppNameWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: CustomColors.customConstrastColor,
                label: const Text(
                  '2',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: AddToCartIcon(
                  key: globalKeyCartItems,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),

      body: AddToCartAnimation(
        gkCart: globalKeyCartItems,
        previewDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCartAnimationMethod) {
          runAddToCartAnimation = addToCartAnimationMethod;
        },
        child: Column(
          children: [
            //Campo de pesquisa
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: 'Pesquise aqui...',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customConstrastColor,
                    size: 21,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),

            // Categorias
            Container(
              padding: const EdgeInsets.only(left: 25),
              height: 40,
              child: !isLoading
                  ? ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return CategoryTile(
                          category: appData.categories[index],
                          isSeleted:
                              appData.categories[index] == selectedCategory,
                          onPressed: () {
                            setState(() {
                              selectedCategory = appData.categories[index];
                            });
                          },
                        );
                      },
                      separatorBuilder: (_, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: appData.categories.length,
                    )
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        10,
                        (index) => Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 12),
                          child: CustomShimmer(
                            height: 20,
                            width: 80,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
            ),

            //Grid
            Expanded(
              child: !isLoading
                  ? GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 9 / 11.5),
                      itemCount: appData.items.length,
                      itemBuilder: (_, index) {
                        return HomeItemTile(
                          item: appData.items[index],
                          cartAnimationMethod: itemSelectedCartAnimations,
                        );
                      },
                    )
                  : GridView.count(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 11.5,
                      children: List.generate(
                        10,
                        (index) => CustomShimmer(
                          height: double.infinity,
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
