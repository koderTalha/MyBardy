import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybardy/BardController/bard_controller.dart';
import 'package:mybardy/Custom/appbar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {


    BardAIController controller = Get.put(BardAIController());
    TextEditingController textField = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff555843),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(57),
        child: CustomAppbar(
          title: 'My Bardy',
          centertitle: true,
          barcolor: const Color.fromRGBO(167, 211, 151,1),

          actions: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.replay_5_rounded),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8,),
        child: Column(
          children: [
            Expanded(
                child: ListView(
                  children: [
                    Obx(() => Column(
                      children: controller.historyList
                          .map(
                            (e) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(245, 238, 200, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(e.system == "user" ? "👨" : "🤖"),
                              const SizedBox(width: 10),
                              Flexible(child: Text(e.message)),
                            ],
                          ),
                        ),
                      )
                          .toList(),
                    ))
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(208, 212, 202, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 60,
                child: Row(children: [
                  Expanded(
                    child: TextFormField(
                      controller: textField,
                      decoration: const InputDecoration(
                          hintText: "You can ask what you want",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                  Obx(
                        () => controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : IconButton(
                        onPressed: () {
                          if (textField.text != "") {
                            controller.sendPrompt(textField.text);
                            textField.clear();
                          }
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(width: 10)
                ]),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
