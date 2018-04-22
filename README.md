# UIBezierPath-Example

# Linear chart using `UIBezierPath`


# Implementation
If you inlcudes the file `LinearChart.swift` you're able to import ad `UIView` to your project and change the class to `LinearChart`.
And now the `UIView` is able to recive the `datasource` and render it in real time, using:
`linearChartView.dataset = dataset`

# Example

```
class ViewController: UIViewController {

    @IBOutlet weak var linearChartView: LinearChart!
    var dataset:[LinearChartModel] = [LinearChartModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dato1:LinearChartModel=LinearChartModel()
        dato1.x = 10
        dato1.y = (linearChartView.frame.height - 100)
        dataset.append(dato1)
        
        let dato2:LinearChartModel=LinearChartModel()
        dato2.x = 100
        dato2.y = (linearChartView.frame.height - 30)
        dataset.append(dato2)
        
        let dato3:LinearChartModel=LinearChartModel()
        dato3.x = 200
        dato3.y = (linearChartView.frame.height - 240)
        dataset.append(dato3)
        
        let dato4:LinearChartModel=LinearChartModel()
        dato4.x = 330
        dato4.y = (linearChartView.frame.height - 10)
        dataset.append(dato4)
        
        linearChartView.dataset = dataset
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func reload(_ sender: Any) {
        dataset.removeAll()
        let dato1:LinearChartModel=LinearChartModel()
        dato1.x = 30
        dato1.y = (linearChartView.frame.height - 70)
        dataset.append(dato1)
        
        let dato2:LinearChartModel=LinearChartModel()
        dato2.x = 130
        dato2.y = (linearChartView.frame.height - 230)
        dataset.append(dato2)
        
        let dato3:LinearChartModel=LinearChartModel()
        dato3.x = 180
        dato3.y = (linearChartView.frame.height - 20)
        dataset.append(dato3)
        
        let dato4:LinearChartModel=LinearChartModel()
        dato4.x = 320
        dato4.y = (linearChartView.frame.height - 150)
        dataset.append(dato4)
        
        linearChartView.dataset = dataset
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
```


# The result
<img src='i.imgur.com/S66c3g7.png' width='300'/>
