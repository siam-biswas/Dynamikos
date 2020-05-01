# Dynamikos
Dynamic layout sizing utility in Swift 


### Without dynamikos

![alt text](https://github.com/siam-biswas/DynamicSize/blob/master/static.png "Static Sizing Preview")

### With dynamikos

![alt text](https://github.com/siam-biswas/DynamicSize/blob/master/dynamic.png "Static Sizing Preview")



# Installation
Just copy the "Dynamikos.swift" file in your project


# Usage
> (Constant Value).dynamic()

```Swift
anyView.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: 20.dynamic()).isActive = true
anyView.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -20.dynamic()).isActive = true
anyView.topAnchor.constraint(equalTo: superView.topAnchor, constant: 10.dynamic()).isActive = true
anyView.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -20.dynamic()).isActive = true

anyView.layer.cornerRadius = 8.dynamic()

anyLabel.font = UIFont.boldSystemFont(ofSize: 16.dynamic()) 
anyLabel.font = UIFont.systemFont(ofSize: 14.dynamic())
