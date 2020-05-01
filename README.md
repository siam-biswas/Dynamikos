# Dynamikos
Dynamic layout sizing utility in Swift 


### Without dynamikos

![alt text](https://github.com/siam-biswas/DynamicSize/blob/master/static.png "Static Sizing Preview")

### With dynamikos

![alt text](https://github.com/siam-biswas/DynamicSize/blob/master/dynamic.png "Static Sizing Preview")



# Integration
just drag "Dynamikos.swift" file to the project tree


# Usage
> (Constant Value).dynamic()

With autolayout constratints
```Swift
anyView.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: 20.dynamic()).isActive = true
anyView.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -20.dynamic()).isActive = true
anyView.topAnchor.constraint(equalTo: superView.topAnchor, constant: 10.dynamic()).isActive = true
anyView.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -20.dynamic()).isActive = true
```

With layer properties
```Swift
anyView.layer.cornerRadius = 8.dynamic()
anyView.layer.borderWidth = 5.dynamic()
```

With font size
```Swift
anyLabel.font = UIFont.boldSystemFont(ofSize: 16.dynamic()) 
anyLabel.font = UIFont.systemFont(ofSize: 14.dynamic())
```
