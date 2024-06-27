import 'package:church/model/prayer_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PrayerDetails extends StatefulWidget {
  final int index;
  const PrayerDetails({Key? key, required this.index}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PrayerDetailsState createState() => _PrayerDetailsState();
}

class _PrayerDetailsState extends State<PrayerDetails> {
  @override
  Widget build(BuildContext context) {
    final prayerModel = PrayerModel.prayerModel[widget.index];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 0.2,
                      spreadRadius: 0.2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.orangeAccent,
                          size: 35,
                        ),
                      ),
                    ),
                    const Gap(15),
                    const Text(
                      "Prayer Detail",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: PrayerModel.prayerModel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 0.2,
                              spreadRadius: 0.2,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      prayerModel.lgText,
                                      style: const TextStyle(
                                        color: Colors.orangeAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(20),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.44,
                                child: ListView(
                                  children: [
                                    Text(
                                      prayerModel.paragraphInfoBlogs,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
