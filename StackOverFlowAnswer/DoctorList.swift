//
//  DoctorList.swift
//  StackOverFlowAnswer
//
//  Created by BIKRAM BHANDARI on 20/6/17.
//  Copyright © 2017 BIKRAM BHANDARI. All rights reserved.
//

import UIKit

class DoctorList: NSObject {
    var DoctorName: String?;
    var DoctorID: String?;
    var SpecialityID: String?
    var Schedule : [ScheduleList]?;
    
    override func setValue(_ value: Any?, forKey key: String) { //Called in step 6
        if key == "Schedule"{
            Schedule = [ScheduleList]();
            
            for schedule in value as! [[String: Any]]{
                let scheduleList = ScheduleList();
                scheduleList.setValuesForKeys(schedule);
                Schedule?.append(scheduleList)
            }
        }else{
            super.setValue(value, forKey: key);
        }
    }
    
    // Function to parse the JSON file and add it to array of doctorList and pass it back.
    /* Do not worry first about the complexity of this method. This is pretty straight forward. Let me guide you step by step.
     
     1. First forget about completion completionHandler: ([DoctorList]) -> () code.
         so think as --- static func doctorList() method as this. pretty simple yes!!
     2. Parse the JSON file. You already know how to do it. If not then you have to go back and look :):)
         pretty boring
     3. Since we may have a number of doctors so create array of DoctorList
     4. Iterate through each element of JSON
         Since the key is "list", I am using it to make an array Of dictionary of [String: Any type].
         oops alot of thing.
     5. Create doctorList object
     6. Set the values from JSON to doctorList object.
         Note: this method will take you above to setValue method. It will check the key. If key is "Schedule" then it will append to DoctorList.Schedule array. If not then it will append to doctorList array. Just think it does.
     7. Append all doctorList to doctorsList array.
         Note: Do not get confused with doctorList (This one is object of DoctorList) and doctorsList (This one is array of DoctorList)
     
     8. Call the completion handler to pass doctorList array.
     We need this in ViewController class to set doctorsList array that is defined in ViewController class
     
     ------ Code in viewDidLoad() in ViewController slass
         DoctorList.doctorList { (doctorsList) in
         self.doctorsList = doctorsList;
         }
     */
    static func doctorList(completionHandler: @escaping ([DoctorList]) -> ()){
        do{
            let file = Bundle.main.url(forResource: "JsonFile", withExtension: "json"); //Get file
            let data = try Data(contentsOf: file!); //Get content of file
            
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]; // Get data as json object
            
            var doctorsList = [DoctorList](); //Look step 3
            
            for data in json["list"] as! [[String: Any]]{ //Loop through all the array of objects. Step 4
                let doctorList = DoctorList(); //Step 5
                doctorList.setValuesForKeys(data); //Step 6
                
                doctorsList.append(doctorList); //Step 7
          }
            
            // You need to use this when you are using JSON from url.
//            DispatchQueue.main.async {
//                    completionHandler(doctorsList); //Step 8
//            }
            
            
            completionHandler(doctorsList); //Step 8
        }catch let err{
            print(err);
        }
    }
    
    
    static func getDoctorList() -> [DoctorList]{ //Just the basic logic to set the model from JSON file. Not the actual implmentation.
        
        // This is to give first row
        let firstDoctorList = DoctorList(); //Create firsDoctorObject
        
        firstDoctorList.DoctorID = "1"; //Set values
        firstDoctorList.DoctorName = "Recha";
        firstDoctorList.SpecialityID = "9";
        
        //Gives 2 column since we have 2 schedules for first doctor
        var schedule1 = [ScheduleList](); //Since we have arrays of schedules for a doctor we se are making a array
        
        let firstDoctorSchedule = ScheduleList(); //Cretea schedule object for firstDoctor
        firstDoctorSchedule.DayName = "Monday"; //Set values
        firstDoctorSchedule.DoctorID = "1";
        firstDoctorSchedule.FirstHour = "8:00 - 11:00";
        firstDoctorSchedule.LastHour = "4:00 - 6: 00";
        
        schedule1.append(firstDoctorSchedule); //Append the object to array
        
        let secondDoctorSchedule = ScheduleList(); //Lets check with second schedule so that we can check if cells are dynamically populated or not
        secondDoctorSchedule.DayName = "Sunday";
        secondDoctorSchedule.DoctorID = "2";
        secondDoctorSchedule.FirstHour = "8:00 - 11:00";
        secondDoctorSchedule.LastHour = "4:00 - 6: 00";
        schedule1.append(secondDoctorSchedule);
        
        firstDoctorList.Schedule = schedule1;
        
        // lets check for second doctor
        let secondDoctorList = DoctorList();
        
        secondDoctorList.DoctorID = "2";
        secondDoctorList.DoctorName = "Sabina";
        secondDoctorList.SpecialityID = "19";
        
        var schedule2 = [ScheduleList]();
        
        let secondDoctorSchedule1 = ScheduleList();
        secondDoctorSchedule1.DayName = "Sunday";
        secondDoctorSchedule1.DoctorID = "2";
        secondDoctorSchedule1.FirstHour = "8:00 - 11:00";
        secondDoctorSchedule1.LastHour = "4:00 - 6: 00";
        schedule2.append(secondDoctorSchedule1);
        
        secondDoctorList.Schedule = schedule2;
        
        return [firstDoctorList, secondDoctorList]; // Return array of doctors
        // You can't find implementation here because I have used above method. But this method is called through ViewController class inside view didLoad function. //        doctorsList = DoctorList.getDoctorList(); -- This is the use but you don't need to do any thing because everything depends upon above method.
        
        //Just to let you understand I have kept this method.
    }
    
}
 //Model class for Schedule list
class ScheduleList: NSObject {
    var DoctorID: String?; //This values matches the schedule values in JSON file. If it doesnot matches then you will get a crash
    var DayName: String?;
    var FirstHour: String?;
    var LastHour: String?;
    
}
