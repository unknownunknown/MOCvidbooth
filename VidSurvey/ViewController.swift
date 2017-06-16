//
//  ViewController.swift
//  MOCVA
//
//  Created by Tara on 5/21/17.
//  Copyright © 2017 Periard, Misty. All rights reserved.
//

import UIKit
import Foundation
import ResearchKit


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let myStep = ORKInstructionStep(identifier: "intor")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func videoInterviewButton(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task:StudyTasks.videoTestTask, taskRun: nil)
        print("message: started the video task")
        taskViewController.delegate = self
        taskViewController.outputDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func introSequence(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task:StudyTasks.introTask, taskRun: nil)
        print("message: started the intro task")
        taskViewController.delegate = self
        taskViewController.outputDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        present(taskViewController, animated: true, completion: nil)
    }
}

extension ViewController: ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result

        //self.presentViewController(ViewController, animated:true, completion:nil)

        // save video 1 to camera roll
        
        if let videoStepResult = taskViewController.result.stepResult(forStepIdentifier: "Video1"),
            let videoStepResults = videoStepResult.results,
            let stepFirstResult = videoStepResults.first,
            let videoResult = stepFirstResult as? ORKFileResult,
            let videoURL = videoResult.fileURL {
            print("message: THE VIDEO IS HERE AND THE URL IS: \(videoURL)")
            UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, nil, nil, nil)
        }
        
        // save video 2 to camera roll
         if let videoStepResult2 = taskViewController.result.stepResult(forStepIdentifier: "Video2"),
         let videoStepResults2 = videoStepResult2.results,
         let stepFirstResult2 = videoStepResults2.first,
         let videoResult2 = stepFirstResult2 as? ORKFileResult,
         let videoURL2 = videoResult2.fileURL {
         print("message: THE VIDEO IS HERE AND THE URL IS: \(videoURL2)")
         UISaveVideoAtPathToSavedPhotosAlbum(videoURL2.relativePath, nil, nil, nil)
         }
        
        if let videoStepResult3 = taskViewController.result.stepResult(forStepIdentifier: "Video3"),
            let videoStepResults3 = videoStepResult3.results,
            let stepFirstResult3 = videoStepResults3.first,
            let videoResult3 = stepFirstResult3 as? ORKFileResult,
            let videoURL3 = videoResult3.fileURL {
            print("message: THE VIDEO IS HERE AND THE URL IS: \(videoURL3)")
            UISaveVideoAtPathToSavedPhotosAlbum(videoURL3.relativePath, nil, nil, nil)
        }
        
        if let videoStepResult4 = taskViewController.result.stepResult(forStepIdentifier: "Video4"),
            let videoStepResults4 = videoStepResult4.results,
            let stepFirstResult4 = videoStepResults4.first,
            let videoResult4 = stepFirstResult4 as? ORKFileResult,
            let videoURL4 = videoResult4.fileURL {
            print("message: THE VIDEO IS HERE AND THE URL IS: \(videoURL4)")
            UISaveVideoAtPathToSavedPhotosAlbum(videoURL4.relativePath, nil, nil, nil)
        }
        
        if let videoStepResult5 = taskViewController.result.stepResult(forStepIdentifier: "Video5"),
            let videoStepResults5 = videoStepResult5.results,
            let stepFirstResult5 = videoStepResults5.first,
            let videoResult5 = stepFirstResult5 as? ORKFileResult,
            let videoURL5 = videoResult5.fileURL {
            print("message: THE VIDEO IS HERE AND THE URL IS: \(videoURL5)")
            UISaveVideoAtPathToSavedPhotosAlbum(videoURL5.relativePath, nil, nil, nil)
        }
        
        if let videoStepResult6 = taskViewController.result.stepResult(forStepIdentifier: "Video6"),
            let videoStepResults6 = videoStepResult6.results,
            let stepFirstResult6 = videoStepResults6.first,
            let videoResult6 = stepFirstResult6 as? ORKFileResult,
            let videoURL6 = videoResult6.fileURL {
            print("message: THE VIDEO IS HERE AND THE URL IS: \(videoURL6)")
            UISaveVideoAtPathToSavedPhotosAlbum(videoURL6.relativePath, nil, nil, nil)
        }
        
        
        
        if let nameStepResult = taskViewController.result.stepResult(forStepIdentifier: "nameStep"),
            let nameStepResults = nameStepResult.results,
            let nameStepFirstResult = nameStepResults.first,
            let nameResult = nameStepFirstResult as? ORKTextQuestionResult,
            let nameAnswer = nameResult.textAnswer {
            print("message: I GOT THE NAME ITS: \(nameAnswer)")
            
        }
        
        let file = "interviewData.txt" //this is the file. we will write to and read from it
        
        let text = "some text" //just a text
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let path = dir.appendingPathComponent(file)
            
            //writing
            do {
                try text.write(to: path, atomically: false, encoding: String.Encoding.utf8)
            }
            catch {/* error handling here */}
            
        }

        
        //taskViewController.dismiss(animated: true, completion: nil)
        
        //go to lastStepViewController
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let lastStepViewController = storyBoard.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        taskViewController.present(lastStepViewController, animated:true, completion:nil)
        print("message: made it to the final screen!")

    }
    

}
