import 'dart:io';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_pappa/resources/components/button_widget.dart';
import 'package:auto_pappa/resources/components/textformfield_widget.dart';
import 'package:auto_pappa/resources/constants/app_border_radius.dart';
import 'package:auto_pappa/resources/constants/app_colors.dart';
import 'package:auto_pappa/resources/constants/font_styles.dart';
import 'package:auto_pappa/resources/constants/image_urls.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  int activeIndex = 0;
  int totalSteps = 2;
  List<File> selectedImages = [];

  File? pickedImage;
  String selectedOption = 'Cashed';
  String vehicle = '';
  TextEditingController amountController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Map<String, List<String>> vehicleBrand = {
    'Toyota': <String>['Innova', 'Fortuner'],
    'Volkswagen': <String>['Polo', 'Virtus', 'Taigun'],
    'Ford': <String>['EcoSport', 'Endeavour'],
    'Honda': <String>['City', 'Amaze'],
    'Chevrolet': <String>['Aveo', 'Beat'],
    'Nissan': <String>['Micra', 'Magnite'],
    'Mercedes-Benz': <String>['Limousine', 'G-vagon'],
    'BMW': <String>['X1', 'X2', 'X3'],
    // 'Audi':
    // 'Hyundai':
    // 'Kia':
    // 'Tesla':
    // 'TATA':
    // 'Porsche':
    // 'Lamborghini':
  };

  List<String> items = [
    'Innova',
    'Fortuner',
    'Polo',
    'Virtus',
    'Taigun',
    'EcoSport',
    'Endeavour',
    'City',
    'Amaze',
    'Aveo',
    'Beat',
    'Micra',
    'Magnite',
    'Limousine',
    'G-vagon'
  ];

  List<String> washingType = [
    'Interior Washing',
    'Exterior Washing',
    'Detailing',
    'Body Wahsing'
  ];

  List<Step> stepList(BuildContext context) => [
        Step(
          state: activeIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: activeIndex >= 0,
          title: const Text('Images'),
          content: Column(
            children: [
              Wrap(
                children: [
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: selectedImages.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(AppBorderRadius.radius10),
                              child: Image.file(
                                selectedImages[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                          Center(
                            child: IconButton(
                              onPressed: () {
                                selectedImages.removeAt(index);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete,
                                size: 40,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  pickImage(const CropAspectRatio(ratioX: 16, ratioY: 12));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: AppBorderRadius.gRadius10,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          size: 35,
                          color: Colors.black,
                        ),
                        Text('Add Your Images')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Step(
          state: activeIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: activeIndex >= 1,
          title: const Text('Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(ImageUrls.exteriorWashing),
              ),
              Text('Vehicle', style: AppFontStyle.font18Bold),
              const Text('Add vehicle details in the form below'),
              const SizedBox(height: 7),
              CustomDropdown.search(
                  hintText: 'Select Brand',
                  items: vehicleBrand.keys.toList(),
                  excludeSelected: false,
                  onChanged: (value) {
                    vehicle = value;
                    setState(() {});
                  }),
              const SizedBox(height: 7),
              CustomDropdown.search(
                hintText: 'Select Model',
                items: (vehicleBrand.containsKey(vehicle))
                    ? vehicleBrand[vehicle]
                    : items,
                excludeSelected: false,
                onChanged: (value) => value,
              ),
              const SizedBox(height: 7),
              CustomDropdown(
                hintText: 'Washing Type',
                items: washingType,
                excludeSelected: false,
                onChanged: (value) => value,
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  MyTextField(
                      width: MediaQuery.sizeOf(context).width / 4,
                      validator: (value) {},
                      controller: amountController,
                      hintText: 'Amount'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: MyTextField(
                        validator: (value) {},
                        controller: nameController,
                        hintText: 'Enter User Name'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              MyTextField(
                  validator: (value) {},
                  controller: phoneController,
                  hintText: 'Enter User Phone Number'),
              Text('Payment Method', style: AppFontStyle.normalBold),
              Row(
                children: [
                  Radio(
                    value: 'Cashed',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                  const Text('Cashed'),
                  Radio(
                    value: 'Credit',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                  const Text('Credit'),
                ],
              ),
            ],
          ),
        ),
        Step(
          state: StepState.complete,
          isActive: activeIndex >= 2,
          title: const Text('Confirm'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.cardLightColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ismail Vk', style: AppFontStyle.normalBold),
                      Text('Totota Innova', style: AppFontStyle.normalBold),
                      Text('+91 ********99', style: AppFontStyle.normalBold),
                      Text('₹ 200', style: AppFontStyle.normalBold),
                      Text('Body Washing', style: AppFontStyle.normalBold),
                      Text('Credit', style: AppFontStyle.normalBold)
                    ],
                  ),
                ),
              ),
              Text('Vehicle Images', style: AppFontStyle.normalBold),
              CarouselSlider(
                items: selectedImages
                    .map((e) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          e,
                          fit: BoxFit.cover,
                        )))
                    .toList(),
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.5,
                  enableInfiniteScroll: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                ),
              ),
            ],
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Vehicle Data'),
        backgroundColor: AppColors.white,
        elevation: 2,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.yellowGradient,
        ),
        child: Stepper(
          elevation: 0,
          currentStep: activeIndex,
          controlsBuilder: (context, details) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  ButtonWidget(
                    isLoading: false,
                    title: activeIndex != 2 ? 'Continue' : 'Confirm',
                    width: size.width / 3.5,
                    onPress: () => moveToNextStep(),
                  ),
                  const SizedBox(width: 8),
                  ButtonWidget(
                    isLoading: false,
                    title: 'Back',
                    width: size.width / 3.5,
                    onPress: () => moveToPreviousStep(),
                  ),
                ],
              ),
            );
          },
          type: StepperType.horizontal,
          steps: stepList(context),
        ),
      ),
    );
  }

  void moveToNextStep() {
    if (activeIndex < stepList(context).length - 1) {
      activeIndex += 1;
    }
    setState(() {});
  }

  void moveToPreviousStep() {
    if (activeIndex == 0) {
      return;
    }
    activeIndex -= 1;
    setState(() {});
  }

  pickImage(CropAspectRatio cropAspectRatio) async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatio: cropAspectRatio,
          compressQuality: 90,
          compressFormat: ImageCompressFormat.jpg);
      if (croppedFile == null) return null;
      pickedImage = File(croppedFile.path);
      selectedImages.add(pickedImage!);
      setState(() {});
    }
  }
}
