import 'package:get/get.dart';

import 'package:storytelling/features/shop/model/storymodel.dart';
import 'package:storytelling/utils/popups/loaders.dart';

class WishListController extends GetxController {
  final RxList<StoryBodyModel> wishList = <StoryBodyModel>[].obs;

  void adddAndRemoveFromWishlist(StoryBodyModel story) {
    if (!wishList.contains(story)) {
      wishList.add(story);
      TLoaders.successSnackbar(
          title: 'Story Added', message: 'Story in now in your wishlist');
    } else {
      wishList.remove(story);
            TLoaders.errorSnackbar(
          title: 'Story Removed', message: 'Story in removed from your wishlist');
    }
  }
}
