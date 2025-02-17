import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventual/src/presentation/widgets/button/custom_elevated_button.dart';
import 'package:inventual/src/presentation/widgets/date_picker_section/date_picker.dart';
import 'package:inventual/src/presentation/widgets/text_field/dropdown_form_field_section.dart';
import 'package:inventual/src/presentation/widgets/text_field/text_field_section.dart';
import 'package:inventual/src/presentation/widgets/toast/success_toast.dart';

class EditPurchaseReturnSection extends StatelessWidget {
  final dynamic purchase;

  const EditPurchaseReturnSection({super.key, required this.purchase});

  @override
  Widget build(BuildContext context) {
    const warehouseSelectionValue = "";

    List<String> warehouseItems = [
      "Warehouse 1",
      "Warehouse 2",
      "Warehouse 3",
      "Warehouse 4",
      "Warehouse 5"
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Edit Purchase Return",
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xFF444444),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 26,
                  color: Color(0xFF444444),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
        Divider(
          color: Colors.grey.shade300,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(children: [
            const SizedBox(
              height: 20,
            ),
            TextFieldSection(
                label: "Supplier Name",
                hint: purchase["supplierName"],
                inputType: TextInputType.name),
            const SizedBox(
              height: 20,
            ),
            DatePicker(labelText: "Date", hintText: purchase["date"]),
            const SizedBox(
              height: 20,
            ),
            TextFieldSection(
              label: "Reference",
              hint: purchase["reference"],
              inputType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldSection(
              label: "Remark",
              hint: purchase["remark"],
              inputType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldSection(
                label: "Amount",
                hint: purchase["amount"],
                inputType: TextInputType.number),
            const SizedBox(
              height: 20,
            ),
            DropdownFormFieldSection(
                label: "Warehouse",
                hint: purchase["warehouse"],
                items: warehouseItems,
                selectionItem: warehouseSelectionValue),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
                buttonName: "Update Return Purchase",
                showToast: () {
                  SuccessToast.showSuccessToast(context, "Update Complete",
                      "${purchase["supplierName"]} Update Complete");
                }),
            const SizedBox(
              height: 20,
            )
          ]),
        ))
      ],
    );
  }
}
