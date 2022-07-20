import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sikcal/components/circular_progress.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/data/providers.dart';
import 'package:sikcal/model/meal.dart';
import 'package:sikcal/screens/components/meal_list_view.dart';
import 'package:sikcal/screens/home/search_menu_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).value;
    if (user == null) return Container();

    final mealList = ref.watch(currentMealListProvider);

    int gainedCarbohydrate = 0;
    int gainedProtein = 0;
    int gainedFat = 0;

    int maxCarbohydrate = user.carbohydrate; // 하루 권장 섭취 탄, 단, 지
    int maxProtein = user.protein;
    int maxFat = user.fat;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 원형의 형태로 현재 섭취량 알려주는 위젯
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularProgress(data: gainedCarbohydrate, progress_value: gainedCarbohydrate / maxCarbohydrate, color: Colors.red),
                CircularProgress(data: gainedProtein, progress_value: gainedProtein / maxProtein, color: Colors.blue),
                CircularProgress(data: gainedFat, progress_value: gainedFat / maxFat, color: Colors.amber),
              ],
            ),

            const SizedBox(height: 20.0),

            // 현재 섭취량을 문자로 나타낸 공간
            Container(
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "탄수화물",
                          style: kDefaultTextStyle.copyWith(color: Colors.red),
                        ),
                        Text(
                          "권장 섭취량",
                          style: kDefaultTextStyle.copyWith(color: Colors.white),
                        ),
                        Text(
                          ": ${maxCarbohydrate}g",
                          style: kDefaultTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "단백질",
                          style: kDefaultTextStyle.copyWith(color: Colors.blueAccent),
                        ),
                        Text(
                          "권장 섭취량",
                          style: kDefaultTextStyle.copyWith(color: Colors.white),
                        ),
                        Text(
                          ": ${maxProtein}g",
                          style: kDefaultTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "지방",
                          style: kDefaultTextStyle.copyWith(color: Colors.amber),
                        ),
                        Text(
                          "권장 섭취량",
                          style: kDefaultTextStyle.copyWith(color: Colors.white),
                        ),
                        Text(
                          ": ${maxFat}g",
                          style: kDefaultTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  Text(
                    "현재 섭취 칼로리 : ${gainedCarbohydrate * 4 + gainedProtein * 4 + gainedFat * 9}kcal",
                  ),
                  Text(
                    "목표 섭취 칼로리 : ${maxCarbohydrate * 4 + maxProtein * 4 + maxFat * 9}kcal",
                  ),
                  const SizedBox(height: 5.0),
                  Divider(
                    thickness: 1.5,
                    color: primaryColor,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10.0),

            // 끼니 목록
            Expanded(
              child: MealListView(mealList: mealList),
            ),

            Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () async {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => _BottomPopup(),
                          );
                        },
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 65.0,
                          color: primaryColor,
                        ),
                      ),
                      FloatingActionButton(
                        child: const Icon(FontAwesomeIcons.plus),
                        onPressed: () async {
                          Meal? meal = await Navigator.push(context, MaterialPageRoute(builder: (context) => SearchMenuView()));
                          if (meal != null) {
                            ref.read(currentMealListProvider.notifier).set([meal, ...mealList]);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomPopup extends StatelessWidget {
  const _BottomPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () async {
                final image = await _picker.pickImage(source: ImageSource.gallery);
                // TODO image 다른 화면으로 보내기
                Navigator.pop(context);
              },
              child: Text(
                '갤러리에서 눈바디 사진 찾기',
                style: kDefaultTextStyle,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () async {
                final image = await _picker.pickImage(source: ImageSource.camera);
                // TODO image 다른 화면으로 보내기
                Navigator.pop(context);
              },
              child: Text(
                '카메라로 촬영하기',
                style: kDefaultTextStyle,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
