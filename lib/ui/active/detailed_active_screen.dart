import 'package:flutter/material.dart';
import 'package:yoko_test_project/const/text_styles.dart';
import 'package:yoko_test_project/models/acitve_model.dart';

class DetailedActiveScreen extends StatefulWidget {
  final String image;
  final String name;
  final List<Tariff> tariffs;
  final List<dynamic> dates;

  const DetailedActiveScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.tariffs,
      required this.dates})
      : super(key: key);

  @override
  State<DetailedActiveScreen> createState() => _DetailedActiveScreenState();
}

class _DetailedActiveScreenState extends State<DetailedActiveScreen> {
  String? date = null;
  String? tariffName = null;
  String? price = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 300),
        child: AppBar(
          elevation: 0.0,
          flexibleSpace: Stack(
            children: [
              Image.network(
                widget.image,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: double.maxFinite,
              ),
              Center(
                child: Text(widget.name, style: ConstTextStyles.mainTitle),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date == null ? 'Дата посещения' : date!,
                style: ConstTextStyles.mainText,
              ),
              const SizedBox(height: 4),
              Text(
                widget.name,
                style: ConstTextStyles.mainText.copyWith(
                  fontSize: 12,
                  color: const Color(0xff858DA4),
                ),
              ),
              const SizedBox(height: 24),
              const Divider(
                thickness: 1.5,
              ),
              const SizedBox(height: 24),
              PopupMenuButton<String>(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.centerLeft,
                  height: 64,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Color(0xff4271B5),
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date == null ? 'Выберите дату' : date!,
                        style: ConstTextStyles.mainText.copyWith(fontSize: 16),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.chevron_right,
                        color: Color(0xff4271B5),
                        size: 28,
                      ),
                    ],
                  ),
                ),
                onSelected: (value) {
                  setState(() {
                    date = value;
                  });
                },
                itemBuilder: (context) => widget.dates
                    .map((e) => PopupMenuItem<String>(value: e, child: Text(e)))
                    .toList(),
              ),
              const SizedBox(height: 16),
              PopupMenuButton<Tariff>(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.centerLeft,
                  height: 64,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: const Color(0xffe5e5e5),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      tariffName == null
                          ? Text(
                              'Выберите тариф',
                              style: ConstTextStyles.mainText
                                  .copyWith(fontSize: 16),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tariffName!,
                                  style: ConstTextStyles.mainText
                                      .copyWith(fontSize: 16),
                                ),
                                Text(
                                  price!,
                                  style: ConstTextStyles.formHint.copyWith(
                                      color: const Color(0xff858DA4),
                                      fontSize: 12),
                                ),
                              ],
                            ),
                      const Spacer(),
                      const Icon(
                        Icons.add_circle_outline_rounded,
                        color: Color(0xff4271B5),
                        size: 30,
                      ),
                    ],
                  ),
                ),
                onSelected: (value) {
                  setState(() {
                    tariffName = value.tariffName;
                    price = value.price.toString();
                  });
                },
                itemBuilder: (context) => widget.tariffs
                    .map(
                      (e) => PopupMenuItem<Tariff>(
                        value: e,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.tariffName),
                            Text(
                              e.price.toString(),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              const Divider(thickness: 1.5),
              SizedBox(
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Правила посещения в ${widget.name}',
                        style: ConstTextStyles.mainText),
                    const Icon(
                      Icons.chevron_right,
                      color: Color(0xff4271B5),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1.5),
              SizedBox(
                height: 44,
                child: Row(
                  children: const [
                    Text('Позвонить'),
                    Icon(
                      Icons.chevron_right,
                      color: Color(0xff4271B5),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
