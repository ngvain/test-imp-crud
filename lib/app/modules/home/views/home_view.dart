import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:ifarms_theme/ifarms_theme.dart';

import '../controllers/home_controller.dart';

enum ActionMode { post, put }

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Faq's"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IFTheme.button.baseButton(
              type: ButtonType.outline,
              mode: ButtonMode.rounded,
              icon: const Icon(Icons.add),
              onPressed: () {
                Get.bottomSheet(faqBtmSheet(ActionMode.post));
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: RefreshIndicator(
          onRefresh: () => controller.getInitialData(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: controller.obx(
              (state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...state!.data.map(
                    (e) => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ExpansionTile(
                            shape: const RoundedRectangleBorder(),
                            tilePadding: EdgeInsets.zero,
                            expandedAlignment: Alignment.centerLeft,
                            initiallyExpanded: false,
                            expandedCrossAxisAlignment:
                                CrossAxisAlignment.start,
                            title: Text(
                              e.pertanyaan ?? '-',
                              style: IFTheme.textStyle.h2Bold,
                            ),
                            children: [
                              Text(e.jawaban ?? '-'),
                            ],
                          ),
                        ),
                        IFTheme.button.baseButton(
                          type: ButtonType.outline,
                          noBorder: true,
                          mode: ButtonMode.rounded,
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            controller.getFaqById(e.id!).then(
                                  (value) => Get.bottomSheet(
                                    faqBtmSheet(ActionMode.put, id: e.id),
                                  ),
                                );
                          },
                        ),
                        IFTheme.button.baseButton(
                          type: ButtonType.outline,
                          noBorder: true,
                          mode: ButtonMode.rounded,
                          icon: Icon(
                            Icons.delete,
                            color: IFTheme.color.red,
                          ),
                          onPressed: () {
                            controller.deleteFaq(e.id!);
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget faqBtmSheet(ActionMode mode, {int? id}) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  FormBuilderTextField(
                    controller: controller.pertanyaanCtl,
                    name: 'Pertanyaan',
                    decoration: const InputDecoration(
                      labelText: 'Pertanyaan',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      // FormBuilderValidators.email(),
                    ]),
                    // initialValue: '12',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  FormBuilderTextField(
                    controller: controller.jawabanCtl,
                    name: 'Jawaban',
                    decoration: const InputDecoration(
                      labelText: 'Jawaban',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                  ),
                  const SizedBox(height: 20),
                  IFTheme.button.baseButton(
                    label: 'Simpan',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        mode == ActionMode.post
                            ? controller.postFaq()
                            : controller.putFaq(id!);
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
