
import UIKit
import ResearchKit

class SurveyViewController: UIViewController, ORKTaskViewControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let taskViewController = ORKTaskViewController(task: BodyPartImageTask, taskRun: nil)
        taskViewController.delegate = self
        taskViewController.outputDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        present(taskViewController, animated: true, completion: nil)
    }
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        detailViewController.shareURL = taskViewController.outputDirectory
        taskViewController.present(detailViewController,animated:false, completion:nil)
    }
    
    var BodyPartImageTask: ORKTask {
        var steps = [ORKStep]()
        var videoCaptureSteps = [ORKVideoCaptureStep]()
        var instructionSteps =  [ORKInstructionStep]()
        
        for index in 1...5{
    
            let videoCaptureStep =  setCommonVideoCaptureSteps(index: index)
            videoCaptureSteps.append(videoCaptureStep)
            
            let instructionStep = ORKInstructionStep(identifier: "videoInstructionStep" + String(index))
            instructionStep.title = NSLocalizedString("Capitalism", comment: "yes")
            
            switch index {
                
                case 1:
                 instructionStep.text = "What’s the most interesting job you’ve ever had? (This could be your first job, or best job or worst job.) What was interesting about it? Was the work you were doing valuable? Were you compensated fairly? Any interesting moments on the job?"
                
                case 2:
                    instructionStep.text = "What was the worst purchase you’ve ever made? (Or the best purchase?) Why?"
                
                case 3:
                instructionStep.text = "When did you first understand what capitalism was? Describe the experience."
                
                case 4:
                instructionStep.text="What different roles do you play in life? Can you list them? (e.g. family roles, occupations, jobs, tasks, team positions, etc.)  Do you identify with some more than others? Why?"
                
                case 5:
                instructionStep.text="What will you miss most about capitalism"
                
                default:
                 instructionStep.text = "Unknown"
                
            }
            instructionSteps.append(instructionStep)
        
        }
        
        //add steps here
        
        return ORKOrderedTask(identifier: "BodyPartImageTask", steps: [
            instructionSteps[0],
            videoCaptureSteps[0],
            instructionSteps[1],
            videoCaptureSteps[1],
            instructionSteps[2],
            videoCaptureSteps[2],
            instructionSteps[3],
            videoCaptureSteps[3],
            instructionSteps[4],
            videoCaptureSteps[4],
            ])

    }
    
    func setCommonVideoCaptureSteps(index: Int) -> ORKVideoCaptureStep{
        let videoCaptureStep =  ORKVideoCaptureStep(identifier: "VideoCaptureStep" + String(index))
        videoCaptureStep.accessibilityInstructions = NSLocalizedString("Your instructions for capturing the video", comment: "Take your time")
        videoCaptureStep.templateImageInsets = UIEdgeInsets(top: 0.05, left: 0.05, bottom: 0.05, right: 0.05)
        videoCaptureStep.duration = 5.0; // 30 seconds
        videoCaptureStep.devicePosition = AVCaptureDevicePosition.front // change to the front camera
        return videoCaptureStep
    }


    
}


