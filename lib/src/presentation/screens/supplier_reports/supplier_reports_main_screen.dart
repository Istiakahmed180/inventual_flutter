import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventual/src/presentation/screens/supplier_reports/supplier_reports_sections/horizontal_supplier_report_table_section.dart';
import 'package:inventual/src/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:inventual/src/presentation/widgets/button/custom_elevated_button.dart';
import 'package:inventual/src/presentation/widgets/date_picker_section/start_end_date_picker_section.dart';
import 'package:inventual/src/presentation/widgets/text_field/dropdown_form_field_section.dart';
import 'package:inventual/src/presentation/widgets/toast/success_toast.dart';

class SupplierReportsMainScreen extends StatefulWidget {
  const SupplierReportsMainScreen({super.key});

  @override
  State<SupplierReportsMainScreen> createState() =>
      _SupplierReportsMainScreenState();
}

class _SupplierReportsMainScreenState extends State<SupplierReportsMainScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  String reportShortcutSelectedValue = "";
  List<String> reportShortcutItems = [
    "Daily",
    "Weekly",
    "Monthly",
    "Yearly",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          key: _key,
          child: const CustomAppBar(navigateName: "Supplier Report")),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: StartEndDatePickerSection(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownFormFieldSection(
                  label: "Report Shortcut",
                  hint: "Select Report",
                  items: reportShortcutItems,
                  selectionItem: reportShortcutSelectedValue),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomElevatedButton(
                  buttonName: "Generate Report",
                  showToast: () {
                    SuccessToast.showSuccessToast(context, "Generate Complete",
                        "Report Generate Complete");
                  }),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Existing Supplier Reports",
                style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const HorizontalSupplierReportTableSection(),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
