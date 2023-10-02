import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/service_category_icon.dart';

class AllServiceCategoriesScreen extends StatelessWidget {
  const AllServiceCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All Services'),
          actions: [
            GestureDetector(
              child: SvgPicture.asset('assets/icons/more.svg'),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Wrap(
                runSpacing: 30,
                spacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  serviceCategoryAll(
                      icon: 'assets/images/ACRepair.png',
                      label: 'AC Repair',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Academic.png',
                      label: 'Academic',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Accounting.png',
                      label: 'Accounting',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Admin.png',
                      label: 'Admin',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Advertising.png',
                      label: 'Advertising',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Appliance.png',
                      label: 'Appliance',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Automotive.png',
                      label: 'Automotive',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Aviation.png',
                      label: 'Aviation',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Banking.png',
                      label: 'Banking',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Beauty.png',
                      label: 'Beauty',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/CallCentre.png',
                      label: 'Call Centre',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Carpentry.png',
                      label: 'Carpentry',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Chemical.png',
                      label: 'Chemical',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Cleaning.png',
                      label: 'Cleaning',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Clothing.png',
                      label: 'Clothing',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Construction.png',
                      label: 'Construction',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Consulting.png',
                      label: 'Consulting',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Defence.png',
                      label: 'Defence',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/DesignServices.png',
                      label: 'Design Services',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/ECommerce.png',
                      label: 'E-Commerce',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Education.png',
                      label: 'Education',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Electronics.png',
                      label: 'Electronics',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Engineering.png',
                      label: 'Engineering',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Entertainment.png',
                      label: 'Entertainment',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Environmental.png',
                      label: 'Environmental',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Farming.png',
                      label: 'Farming',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Fashion.png',
                      label: 'Fashion',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Finance.png',
                      label: 'Finance',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Fitness.png',
                      label: 'Fitness',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/GeneralWorker.png',
                      label: 'General Worker',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Government.png',
                      label: 'Government',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Healthcare.png',
                      label: 'Healthcare',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Hospitality.png',
                      label: 'Hospitality',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/HumanResources.png',
                      label: 'Human Resources',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/IT.png',
                      label: 'IT',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/ImportExport.png',
                      label: 'Import & Export',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Insurance.png',
                      label: 'Insurance',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Investment.png',
                      label: 'Investment',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Laundry.png',
                      label: 'Laundry',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Legal.png',
                      label: 'Legal',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Logistics.png',
                      label: 'Logistics',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Management.png',
                      label: 'Management',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Manufacturing.png',
                      label: 'Manufacturing',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/MarketResearch.png',
                      label: 'Market Research',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Marketing.png',
                      label: 'Marketing',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Massage.png',
                      label: 'Massage',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Media.png',
                      label: 'Media',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Medical.png',
                      label: 'Medical',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/MenSal.png',
                      label: 'Men\s Sal..',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Mining.png',
                      label: 'Mining',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/NGO.png',
                      label: 'NGO',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/PRCommunication.png',
                      label: 'PR & Communication',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Painting.png',
                      label: 'Painting',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Petrochemical.png',
                      label: 'Petrochemical',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Pharmaceutical.png',
                      label: 'Pharmaceutical',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Plumbing.png',
                      label: 'Plumbing',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/RealEstate.png',
                      label: 'Real Estate',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Recruitment.png',
                      label: 'Recruitment',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Repairing.png',
                      label: 'Repairing',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Research.png',
                      label: 'Research',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Retail.png',
                      label: 'Retail',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Sales.png',
                      label: 'Sales',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Security.png',
                      label: 'Security',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Shifting.png',
                      label: 'Shifting',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/SocialServices.png',
                      label: 'Social Services',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Sports.png',
                      label: 'Sports',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Technology.png',
                      label: 'Technology',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Telecommunications.png',
                      label: 'Telecoms',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/TradesServices.png',
                      label: 'Trades & Services',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Transport.png',
                      label: 'Transport',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/TravelTourism.png',
                      label: 'Travel & Tourism',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Vehicle.png',
                      label: 'Vehicle',
                      selected: false,
                      png: true),
                  serviceCategoryAll(
                      icon: 'assets/images/Warehousing.png',
                      label: 'Warehousing',
                      selected: false,
                      png: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
