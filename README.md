# Dynamikos
A solution for UI Consistency in Swift 


### Without dynamic size

![alt text](https://github.com/siam-biswas/DynamicSize/blob/master/static.png "Static Sizing Preview")

### With dynamic size

![alt text](https://github.com/siam-biswas/DynamicSize/blob/master/dynamic.png "Static Sizing Preview")


# What is Dynamikos
Its a very simple yet useful tool for iOS developers who soar an oath to always create UI/UX programmatically. 

When you are writing your UI/UX codes , have you ever felt that your design only looks good in devices with large sized display but something missing in small or medium display ?

That’s because with the traditional way, UI elements are not always placed at the expected places in different devices.

Now Dynamikos helps you to create consistent looking UI across the devices with different display size. 

# Theory of Dynamikos
Dynamikos divide iPhone devices in three categories and set a specific percentage for all of them.

```
Max (100%): iPhone 6+,6s+,7+,8+,X,Xs,Xs Max,Xr,11,11 pro,11 pro max 
Mid (90%): iPhone 6,6s,7,8,SE second gen 
Min (80%): iPhone 4,4s,5,5s,5c,SE first gen 
```
Now the one an only rule is , Every time we set a constant value for UI elements (position,size,padding) or set a font size for labels, rather than using the exact value we use adjusted value based on category percentage. 

For an example, lets say we have a button with (height: 40 , width: 60). After using dynamikos the adjusted values will be -

```
Max (100%): (height: 40, width: 60)
Mid (90%): (height: 36, width: 54)
Min (80%): (height: 32, width: 48)
```

# Installation
Just copy the "Dynamikos.swift" file in your project


# Usage
The magic is put together in a single function
```Swift
constantValue.dynamic()
```
By default we assume that you are setting the constant value with maximum. If you want to set with different type
```Swift
constantValue.dynamic(type: .max)
constantValue.dynamic(type: .mid)
constantValue.dynamic(type: .min)
```

With frame based layout
```Swift
 anyView.frame = CGRect(x: 0, y: 20.dynamic(), width: 100.dynamic(), height: 100.dynamic())
```

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

For configure the category percentage based on your requirement 
```Swift
DynamikosConfig.set(max: 100, mid: 90, min: 80)
```
