//
//  ViewController.swift
//  showFinder
//
//  Created by Alex Rahi on 10/19/20.

//This app is created for educational purposes.
//
import Foundation
import UIKit
import AVKit

class ViewController: UIViewController {
    
    var selectedSite = "https://www.google.com"
    
    
    var someSound:AVAudioPlayer! 
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblDesc: UILabel!
    
    @IBOutlet weak var lblPlat: UILabel!
    
    @IBOutlet weak var lblRat: UILabel!
    
    @IBOutlet weak var imageU:UIImageView!
    
    //Search bar for searching through the show array
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var favSwitch: UISwitch!
    
    var showArray = ["Game of Thrones",  "Scandal", "Haunting of Hill House", "The West Wing", "Veep"]
    
    var showFinderObjects = [showFinder]()
    
    func populateArray() {
        let sf1 = showFinder(nam: "Game of Thrones", desc: "Good", plat: "HBO",  rat: 9)
        sf1.name = "Game of Thrones"
        sf1.description = "Very Good"
        sf1.platform = "HBO"
        sf1.rating = 9.0
        sf1.imageU = "got.jpg"
        sf1.siteURL = "https://www.hbomax.com/series/urn:hbo:series:GVU2cggagzYNJjhsJATwo/?utm_id=sa%7C71700000066890828%7C58700005868659919%7Cp53637852428&gclid=CjwKCAjwoc_8BRAcEiwAzJevtVoCcdeMZ3AYDQF9ubYUXjfr2UxjBwLgli4leyDeBhvB4IkIGdzvvxoCk6AQAvD_BwE&gclsrc=aw.ds"
        showFinderObjects.insert(sf1,at:0)
        
        let sf2 = showFinder(nam: "Scandal", desc: "Good", plat: "Hulu", rat: 7)
        sf2.name = "Scandal"
        sf2.description = "Good"
        sf2.platform = "Hulu"
        sf2.rating = 7.0
        sf2.imageU = "scandal.jpg"
        sf2.siteURL = "https://abc.com/shows/scandal"
        showFinderObjects.append(sf2)
        
        let sf3 = showFinder(nam: "Haunting of Hill House", desc: "Good", plat: "Netflix", rat: 8.5)
        sf3.name = "Haunting of Hill House"
        sf3.description = "Good"
        sf3.platform = "Netflix"
        sf3.rating = 8.5
        sf3.imageU = "hillHouse.jpg"
        sf3.siteURL = "https://www.netflix.com/title/80189221"
        showFinderObjects.append(sf3)
        
        let sf4 = showFinder(nam: "The West Wing", desc: "Good", plat: "Netflix", rat: 8)
        sf4.name = "The West Wing"
        sf4.description = "Good"
        sf4.platform = "Netflix"
        sf4.rating = 8.0
        sf4.imageU = "westWing.jpg"
        sf4.siteURL = "https://www.hbomax.com/feature/urn:hbo:feature:GX4YOrQsIwGNViQEAAAGH/?utm_id=sa%7C71700000073648065%7C58700006373502282%7Cp57948461183&gclid=CjwKCAjwoc_8BRAcEiwAzJevtRKn0DyoErsF_JWTr3pOQG_PYythV6OplINrc0ZpxwFbhMxLCP4n4RoCvJ4QAvD_BwE&gclsrc=aw.ds"
        showFinderObjects.append(sf4)
        
        
        let sf5 = showFinder(nam: "Veep", desc: "Good", plat: "HBO", rat: 9)
        sf5.name = "Veep"
        sf5.description = "Outstanding"
        sf5.platform = "HBO"
        sf5.rating = 9.0
        sf5.imageU = "veep.jpg"
        sf5.siteURL = "https://www.hbomax.com/series/urn:hbo:series:GVU2fLgkp0lFvjSoJAT_x/?utm_id=sa%7C71700000067030843%7C58700006037837429%7Cp54684180831&gclid=CjwKCAjwoc_8BRAcEiwAzJevtSHGJ8wSvluIZbKviIEhTaV2vU3mC2sl1t57UvaU8TtymgC_xTQFpRoC_jYQAvD_BwE&gclsrc=aw.ds"
        showFinderObjects.append(sf5)
        
    }
   
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        lblName.alpha = 0
        imageU.alpha = 0
        lblName.alpha  = 0
        lblDesc.alpha = 0
        lblPlat.alpha = 0
        lblRat.alpha = 0
    }
    
    @IBAction func nextPage(_ sender: Any) {
        SetLabels()
        
    }
    @IBAction func moreInfo(_ sender: Any) {
        let app = UIApplication.shared
        let siteURL = URL(string:selectedSite)
        app.open(siteURL!)
    }
    
    
    @IBAction func valueChange(_ sender: Any) {
        UserDefaults.standard.set(lblName.text, forKey: "favorite")
    }
    
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent!) {
        UIView.animate(withDuration: 4.0, animations:  {
            self.lblName.alpha = 1
            self.imageU.alpha = 1
            self.lblName.alpha = 1
            self.lblPlat.alpha = 1
            self.lblDesc.alpha = 1
            self.lblRat.alpha = 1
        }  )
        
        
        SetLabels()
    }
    func SetLabels() {
        
        
        let randomSF = showFinderObjects.randomElement()
        let img = UIImage(named: randomSF!.imageU)
        let fav = UserDefaults.standard.string(forKey: "favorite")
        
        favSwitch.isOn = ( randomSF!.name == fav)
        
        
        imageU.image = img
        
        
        
        lblName.text = randomSF!.name
        lblDesc.text = randomSF!.description
        lblPlat.text = randomSF!.platform
        lblRat.text = String(randomSF!.rating)
        
        selectedSite = randomSF!.siteURL
        
        
        
        someSound.play()
        
        if(randomSF!.platform == "Netflix")  {
            lblPlat.backgroundColor = UIColor.red
            
        }
        
        else if (randomSF!.platform == "Hulu")  {
            lblPlat.backgroundColor = UIColor.green
            
        }
        
        else if (randomSF!.platform == "HBO")  {
            lblPlat.backgroundColor = UIColor.purple
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        favSwitch.isOn = false
        
        someSound = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "test", ofType: "wav")!))
        
        populateArray()
        
        
       // func SetLabels() {
        //let randomSF = showFinderObjects.randomElement()
        //let img = UIImage(named: randomSF!.imageU)
        //imageU.image = img
        //lblName.text = randomSF!.name
        //lblDesc.text = randomSF!.description
        //lblPlat.text = randomSF!.platform
        //lblRat.text = String(randomSF!.rating)
     //   }
        
       // let sf = showFinder()
        // Do any additional setup after loading the view.
    }


    
}

