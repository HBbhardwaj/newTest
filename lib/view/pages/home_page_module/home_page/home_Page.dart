

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ispection/api_service/api_url.dart';
import 'package:ispection/utils/app_string.dart';
import 'package:ispection/utils/app_text.dart';
import 'package:ispection/view/pages/home_page_module/homePageModel/homePagemodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var dio = Dio();

  TextEditingController searchController = TextEditingController();

// JobList will contains list of all the jobs and searchList will only contains the jobs getting from search result
  List<PostedJobsList> jobList = [];
  List<PostedJobsList> searchList = [];

  @override
  initState() {
    getInitData();
    super.initState();
  }

// This Function will contain all the other functions which will be run in initstate
  getInitData() {
    getJobs();
  }

  //search jobs
  jobSearch(String value) {
    if (value.isNotEmpty) {
      setState(() {
        searchList = [];
      });
      for (var jobs in jobList) {
        if (jobs.jobTitle.toLowerCase().contains(value)) {
          setState(() {
            //add jobs to searchList if there is match
            searchList.add(jobs);

            //remove duplicate from List
            searchList = searchList.toSet().toList();
          });
        }

// Show data only in debug mode
        if (kDebugMode) {
          log(searchList.toString());
        }
      }
    } else {
      setState(() {
        //If there is nothing on Search Field then jobList item will added to it
        searchList = jobList;
      });
    }
  }



// get jobs with api
  getJobs() async {
    var body = {
      "JobTitle": "",
      "UserLatitude": 0,
      "UserLongitude": 0,
      "StartDistance": 0,
      "EndDistance": 4,
      "StartBidRange": 2,
      "EndBidRange": 6,
      "Rating": 1,
      "JobTypeId": 5,
      "SortById": 1
    };

    dio.options.headers["Authorization"] = "Bearer ${AppConstants.token}";

    var res = await dio.post(ApiUrl.getJobs, data: body);

    var data = LoginPageModel.fromJson(res.data);
    if (data.success) {
      setState(() {
        jobList = data.postedJobsList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //Search Section
            searchSection(),

            //Jobs Section
            Expanded(child: jobSection())
          ],
        ),
      ),
    ));
  }

  //Jobs Section Widget
  Widget jobSection() {
    return ListView.builder(
      // physics: NeverScrollableScrollPhysics(),
      itemCount: searchController.text.trim() == ''
          ? jobList.length
          : searchList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return customJobTile(
          index: index,
          jobs: searchController.text.trim() == '' ? jobList : searchList,
        );
      },
    );
  }

// Custom widget to show single job
  Widget customJobTile({required int index, required List jobs}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              spreadRadius: 2,
              offset: Offset(
                2,
                5,
              ),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .2,
                    width: MediaQuery.of(context).size.width * .2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          jobList[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${jobs[index].jobTitle} (${jobs[index].status})",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .1,
                            ),
                            // Text(
                            // DateFormat.yMd().format(jobs[index].createdOn)),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: Text(
                              jobs[index].description,
                              overflow: TextOverflow.visible,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .15,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Posted By: ",
                          style: AppTextStyle.title,
                        ),
                        Text(
                          "Distance: ",
                          style: AppTextStyle.title,
                        ),
                        Text(
                          "Bid Range: ",
                          style: AppTextStyle.title,
                        ),
                        Text(
                          "Job Type: ",
                          style: AppTextStyle.title,
                        ),
                        Text(
                          "Delivery Address: ",
                          style: AppTextStyle.title,
                        ),
                        Text(
                          "Pick Up Address: ",
                          style: AppTextStyle.title,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jobs[index].postedByFullName,
                          style: AppTextStyle.body,
                        ),
                        Text(
                          "${jobs[index].distance} m",
                          style: AppTextStyle.body,
                        ),
                        Text(
                          jobs[index].bidRange,
                          style: AppTextStyle.body,
                        ),
                        Text(
                          jobs[index].jobType,
                          style: AppTextStyle.body,
                        ),
                        Text(
                          jobs[index].deliveryAddress,
                          style: AppTextStyle.body,
                        ),
                        Text(
                          jobs[index].pickUpAddress,
                          style: AppTextStyle.body,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//Search Section Widget
  Widget searchSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: searchController,
        onChanged: (value) {
          jobSearch(value.toLowerCase().trim());
        },
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => searchController.clear(),
          ),
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}