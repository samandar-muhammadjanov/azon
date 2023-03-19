import 'package:azon/const/const.dart';
import 'package:azon/provider/provider.dart';
import 'package:azon/service/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime currentTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    final data = Provider.of<ProviderData>(context, listen: false);
    data.fetchPrayingTime();
    final time = data.prayingTime?.times;
    final nextPrayingTime = time?.asr.split(":")[0];
    print(currentTime.hour);
    print(nextPrayingTime);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProviderData>(context);
    final time = data.prayingTime?.times;
    final isBomdod =
        int.parse(time?.tongSaharlik.split(":")[0] ?? "0") < currentTime.hour
            ? true
            : false;
    final isPeshing =
        int.parse(time?.peshin.split(":")[0] ?? "0") < currentTime.hour
            ? true
            : false;
    final isAsr = int.parse(time?.asr.split(":")[0] ?? "0") < currentTime.hour
        ? true
        : false;
    final isShom =
        int.parse(time?.shomIftor.split(":")[0] ?? "0") < currentTime.hour
            ? true
            : false;
    final isHufton =
        int.parse(time?.hufton.split(":")[0] ?? "0") < currentTime.hour
            ? true
            : false;
    if (data.prayingTime == null) {
      return const Scaffold(
        backgroundColor: Color(0xff045757),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      backgroundColor: const Color(0xff045757),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "Tong",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              data.prayingTime!.times.tongSaharlik,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "- 06:09:31",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              data.prayingTime!.weekday +
                  "${DateFormat(", dd-MMMM").format(data.prayingTime!.date)}",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Tong",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  data.prayingTime!.times.tongSaharlik,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
             SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Quyosh",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  data.prayingTime!.times.quyosh,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
             SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Peshin",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  data.prayingTime!.times.peshin,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
             SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Asr",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  data.prayingTime!.times.asr,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
             SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Shom",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  data.prayingTime!.times.shomIftor,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
             SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Hufton",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  data.prayingTime!.times.hufton,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ],
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
      onTap: () {
        Api().prayingTime();
      },
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
