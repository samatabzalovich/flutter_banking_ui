import 'package:flutter/material.dart';
import 'package:flutter_banking_ui/enum/transaction.dart';
import 'package:flutter_banking_ui/view/widgets/custom_text.dart';
import 'package:intl/intl.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 0.42),
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 800),
        child: _modalSheetContent(),
        builder: (context, size, widget) {
          return DraggableScrollableSheet(
            minChildSize: size,
            maxChildSize: 0.9,
            initialChildSize: size,
            snap: true,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 17, right: 17, top: 17),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(250, 242, 244, 229),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: SingleChildScrollView(
                    controller: scrollController, child: widget),
              );
            },
          );
        });
  }

  Widget _modalSheetContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          "Details",
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CustomText(
                    "🇺🇸",
                    fontSize: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    "USD 56*3254",
                    color: Colors.black,
                    fontSize: 15,
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    "See",
                    color: Color(0xffEB5757),
                    fontSize: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Color(0xffEB5757),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        const CustomText(
          "Transaction history",
          color: Colors.black,
          fontSize: 16,
        ),
        Column(
          children: [
            _transactionBuilder(
                type: TransactionType.loss,
                amount: 2.7,
                date: DateTime.now(),
                id: "Starbucks New york LLP",
                idSubtitle: "NY, USA"),
            _transactionBuilder(
                type: TransactionType.profit,
                amount: 2.7,
                date: DateTime.now(),
                id: "Starbucks New york LLP",
                idSubtitle: "NY, USA"),
            _transactionBuilder(
                type: TransactionType.loss,
                amount: 2.7,
                date: DateTime.now(),
                id: "Starbucks New york LLP",
                idSubtitle: "NY, USA"),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              "Full history",
              color: Color(0xffEB5757),
              fontSize: 16,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xffEB5757),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        _sectionBuilder("assets/unlock.png", "Access and limits", () {}),
        _sectionBuilder("assets/credit-card.png", "Top up", () {}),
        _sectionBuilder("assets/loader.png", "Change pin", () {}),
      ],
    );
  }

  Widget _transactionBuilder(
      {required TransactionType type,
      required double amount,
      required DateTime date,
      required String id,
      required idSubtitle}) {
    String formattedDate = DateFormat('dd.MM.yyyy HH:mm').format(date);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // width: 26,
            // height: 26,
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Image.asset(type == TransactionType.profit
                ? "assets/profit.png"
                : "assets/loss.png"),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                '${type == TransactionType.profit ? "" : "-"}\$$amount',
                align: TextAlign.left,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              CustomText(
                formattedDate,
                align: TextAlign.left,
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(
            width: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                id,
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              CustomText(
                idSubtitle,
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionBuilder(
      String imagePath, String sectionName, VoidCallback callback) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 40, bottom: 5, top: 5),
          child: Divider(),
        ),
        GestureDetector(
          onTap: callback,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(imagePath),
              const SizedBox(
                width: 10,
              ),
              CustomText(
                sectionName,
                color: Colors.black,
                fontSize: 16,
              ),
            ],
          ),
        )
      ],
    );
  }
}
