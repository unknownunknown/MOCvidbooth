//
//  StudyTasks.swift
//  MOCVA
//
//  Created by Tara on 5/1/17.
//  Copyright © 2017 net.unknownunknown. All rights reserved.
//

import Foundation
import ResearchKit



class StudyTasks {
    
    static let introTask: ORKNavigableOrderedTask = {
        
        
        // Instruction step
        let instruction1Step = ORKInstructionStep(identifier: "Intro1Step")
        instruction1Step.title = "Welcome to the Musuem of Capitalism - A People's History booth."
        instruction1Step.text = "This project is a digital interface that collects varied oral histories of people and presents them in a disruptive but dialogical manner."
    
        
        let instruction2Step = ORKInstructionStep(identifier: "Intro2Step")
        instruction2Step.text = "In this interview, you'll be asked a series of 6 questions, with two minutes to respond to each."
        
        
        //boolean step - audio or video interview?
        let interviewChoiceQuestionTitle = "What type of interview would you like to contribute"
        let textChoices = [
            ORKTextChoice(text: "Video Interview", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Audio Only Interview", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ]
        let interviewChoiceAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
        let questQuestionStep = ORKQuestionStep(identifier: "InterviewChoiceQuestionStep", title: interviewChoiceQuestionTitle, answer: interviewChoiceAnswerFormat)
        
        
        //name step
        let nameStep = ORKQuestionStep(identifier: "nameStep")
        nameStep.title = "What's your name?"
        nameStep.text = "If you prefer to stay anonymous, just press next."
        nameStep.answerFormat = ORKTextAnswerFormat(maximumLength: 30)

        
        let steps = [questQuestionStep, instruction1Step, instruction2Step, nameStep]
        //let rule = ORKDirectStepNavigationRule(destinationStepIdentifier: "Intro2Step")
        //task.setNavigationRule(rule, forTriggerStepIdentifier: "InterviewChoiceQuestionStep")
        
        return ORKNavigableOrderedTask(identifier: "SurveyTask", steps: steps)
        
        
    }()
    
    static let emailTask: ORKOrderedTask = {
        var steps = [ORKStep]()

        // Instruction step
        let instruction4Step = ORKInstructionStep(identifier: "Intro4Step")
        instruction4Step.title = "Welcome to the Musuem of Capitalism - A People's History booth."
        instruction4Step.text = "This project is a digital interface that collects varied oral histories of people and presents them in a disruptive but dialogical manner."
        
        steps += [instruction4Step]
        
        //email step
        let emailStep = ORKQuestionStep(identifier: "email1Step")
        emailStep.title = "Thanks for contributing!"
        emailStep.text = "To stay in touch with happenings at the musuem and evolution of this oral history archive, please enter your email address"
        emailStep.answerFormat = ORKTextAnswerFormat(maximumLength: 30)
        
        steps += [emailStep]
        
        
        return ORKOrderedTask(identifier: "EmailTask", steps: steps)
    }()
    
    static var videoTestTask: ORKOrderedTask {
        
        let instructionStep1 = ORKInstructionStep(identifier: "videoInstructionStep1")
        instructionStep1.title = "What was capitalism? How would you describe it to someone who’s never experienced it?"
        instructionStep1.text = "(You can be creative. There’s no wrong answer.)"
        
        let videoCaptureStep1 = ORKVideoCaptureStep(identifier:"Video1")
        videoCaptureStep1.duration = 60.0
        videoCaptureStep1.devicePosition = AVCaptureDevicePosition.front
        //videoCaptureStep1.templateImage = UIImage(named: "whiteOut")!
        //videoCaptureStep1.templateImageInsets = UIEdgeInsets(top: 0.00, left: -0.50, bottom: 0.00, right: -0.50)
        
        let instructionStep2 = ORKInstructionStep(identifier: "videoInstructionStep2")
        instructionStep2.title = "If you had to name one person or thing that best represents capitalism, who or what would it be?"
        instructionStep2.text = "Please explain."
        
        let videoCaptureStep2 = ORKVideoCaptureStep(identifier:"Video2")
        videoCaptureStep2.duration = 60.0
        videoCaptureStep2.devicePosition = AVCaptureDevicePosition.front
        //videoCaptureStep2.templateImage = UIImage(named: "whiteOut")!
        //videoCaptureStep2.templateImageInsets = UIEdgeInsets(top: 0.05, left: 0.05, bottom: 0.05, right: 0.05)
        
        let instructionStep3 = ORKInstructionStep(identifier: "videoInstructionStep3")
        instructionStep3.title = "If you were part of an exhibit on capitalism, and your own life experience made you an expert on one specific part of capitalism, what would that exhibit be? "
        instructionStep3.text = "What would you say to visitors to the exhibit? Would you tell a specific story? Tell it."
        
        let videoCaptureStep3 = ORKVideoCaptureStep(identifier:"Video3")
        videoCaptureStep3.duration = 60.0
        videoCaptureStep3.devicePosition = AVCaptureDevicePosition.front
        //videoCaptureStep3.templateImage = UIImage(named: "whiteOut")!
        //videoCaptureStep3.templateImageInsets = UIEdgeInsets(top: 0.05, left: 0.05, bottom: 0.05, right: 0.05)
        
        let instructionStep4 = ORKInstructionStep(identifier: "videoInstructionStep4")
        instructionStep4.title = "What’s the best thing you ever bought, or the worst thing?"
        instructionStep4.text = "Tell me about it."
        
        let videoCaptureStep4 = ORKVideoCaptureStep(identifier:"Video4")
        videoCaptureStep4.duration = 60.0
        videoCaptureStep4.devicePosition = AVCaptureDevicePosition.front
        //videoCaptureStep2.templateImage = UIImage(named: "whiteOut")!
        //videoCaptureStep2.templateImageInsets = UIEdgeInsets(top: 0.05, left: 0.05, bottom: 0.05, right: 0.05)
        
        let instructionStep5 = ORKInstructionStep(identifier: "videoInstructionStep5")
        
        instructionStep5.title = "Word Association: List as many words as you can that you associate with capitalism."
        
        let videoCaptureStep5 = ORKVideoCaptureStep(identifier:"Video5")
        videoCaptureStep5.duration = 60.0
        videoCaptureStep5.devicePosition = AVCaptureDevicePosition.front
        //videoCaptureStep5.templateImage = UIImage(named: "whiteOut")!
        //videoCaptureStep5.templateImageInsets = UIEdgeInsets(top: 0.05, left: 0.05, bottom: 0.05, right: 0.05)
        
        let instructionStep6   = ORKInstructionStep(identifier: "videoInstructionStep6")
        instructionStep6.title = "If you see better times in the past, what do you miss the most? If you see better times ahead, what do you most look forward to?"
        
        let videoCaptureStep6 = ORKVideoCaptureStep(identifier:"Video6")
        videoCaptureStep6.duration = 60.0
        videoCaptureStep6.devicePosition = AVCaptureDevicePosition.front
        //videoCaptureStep6.templateImage = UIImage(named: "whiteOut")!
        //videoCaptureStep6.templateImageInsets = UIEdgeInsets(top: 0.05, left: 0.05, bottom: 0.05, right: 0.05)

        
        let steps = [instructionStep1,
                     videoCaptureStep1,
                     instructionStep2,
                     videoCaptureStep2,
                     //instructionStep3,
                     //videoCaptureStep3,
                     instructionStep4,
                     videoCaptureStep4,
                     //instructionStep5,
                     //videoCaptureStep5,
                     //instructionStep6,
                     //videoCaptureStep6
                    ]
        
        return ORKOrderedTask(identifier:"VideoTestTask", steps: steps)
        
    }
    
    
    static let audioTask: ORKOrderedTask = {
        let intendedUseDescription = "Have you ever dreamed of money?"
        let speechInstruction = "Have you ever dreamed of money?"
        let shortSpeechInstruction = "say money!"
        
        return ORKOrderedTask.audioTask(withIdentifier: "AudioTask", intendedUseDescription: intendedUseDescription, speechInstruction: speechInstruction, shortSpeechInstruction: shortSpeechInstruction, duration: 20, recordingSettings: nil, checkAudioLevel: false, options: ORKPredefinedTaskOption.excludeConclusion)
    }()

    
}
