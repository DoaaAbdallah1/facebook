import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';

class CreateStoryWidget extends StatelessWidget {
  const CreateStoryWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image.asset(
                    AppAssets.model1,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 55,
                child: Center(
                  child: Text(
                    'Create Story',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xFF242527),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 55 - 15,
            right: 55 - 15,
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.blueColor,
                border: Border.all(color: AppColors.whiteColor, width: 2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(Icons.add, color: AppColors.whiteColor, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
