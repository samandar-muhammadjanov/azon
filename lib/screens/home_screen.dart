import 'package:azon/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff045757),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "O'zbekiston, Toshkent",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "05:17",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Bomdod - 06:09:31",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Payshanba, 16-mart",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            const Spacer(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                categories(
                    context, "assets/images/prayermat.png", "Namoz vaqtlari"),
                categories(context, "assets/images/kaaba.png", "Qibla"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                categories(
                    context, "assets/images/quran.png", "Muallimi soniy"),
                categories(
                    context, "assets/images/quran.png", "Al Fatiha online"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                categories(context, "assets/images/quran.png", "Qur'on"),
                categories(context, "assets/images/tasbih.png", "Tasbih"),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  InkWell categories(BuildContext context, String img, String title) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff044343)),
        width: size(context).width * 0.45,
        height: 100,
        child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  img,
                  width: 60,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            )),
      ),
    );
  }
}
