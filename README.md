See a lot of excellent iOS third-party libraries, understand their properties and methods by writing an example

## CollectionViewSlantedLayout
<p align="center">
<img src="https://img.shields.io/badge/Star-1.6k-sucess.svg?style=flat&logo=github"/>
<img src="https://img.shields.io/badge/Technique-UICollectionViewLayout-blueviolet.svg?style=flat"/>
</p>

[CollectionViewSlantedLayout](https://github.com/yacir/CollectionViewSlantedLayout) is a subclass of the UICollectionViewLayout allowing the display of **slanted** cells in a UICollectionView. 

<p align="center">
<img src="resource/1.gif" width="350" height="757"/>
</p>

### Use

#### Installation

Through **CocoaPods**, add the follow line to your Podfile then install it. 
```swift
use_frameworks!
pod 'CollectionViewSlantedLayout', '~> 3.1'
```
#### Usage

1. import Import CollectionViewSlantedLayout module 
2. Create an `CollectionViewSlantedLayout` instance and add it to your UICollectionView.
3. Use the `CollectionViewSlantedCell` class for your cells or subclass it.

#### Properties

| property | description | default value |
| :----: | :----:| :----: | 
|slantingSize | (UInt) degree of tilt | 75|
|slantingDirection| (SlantingDirection) slanting direction| upward (enum upward,downward)|
|slantingAngle|(CGFloat) angle of the slanting and used to rotation transform| 0|
|scrollDirection|(UICollectionView.ScrollDirection) scroll direction | vertical (enum vertical,horizontal)|
|isFirstCellExcluded|(Bool) true to disable the slanting for the first cell| false|
|isLastCellExcluded|(Bool) true to disable the slanting for the last cell| false|
|lineSpacing|(CGFloat) spacing between two items | 10.0|
|itemSize|(CGFloat) size of cell| 225|
|zIndexOrder| (ZIndexOrder) zIndex order of the items| ascending (enum ascending,descending)|

#### Protocols

The `CollectionViewDelegateSlantedLayout` protocol defines methods that let you coordinate with a CollectionViewSlantedLayout object to implement a slanted layout. The `CollectionViewDelegateSlantedLayout` protocol has the following methods:
```swift
optional func collectionView(_ collectionView: UICollectionView,
layout collectionViewLayout: CollectionViewSlantedLayout,
sizeForItemAt indexPath: IndexPath) -> CGFloat
```
This method asks the delegate for the size of the specified item’s cell.

If you do not implement this method, the slanted layout uses the values in its **itemSize** property to set the size of items instead. Your implementation of this method can return a fixed set of sizes or **dynamically** adjust the sizes based on the cell’s content.

