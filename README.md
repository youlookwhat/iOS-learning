# iOS-learning
《Swift5从零到精通iOS开发训练营》- 代码笔记



#### UITabBarController 加标签
 - 1.在`Main.storyboard`页面，点击右上角的`+`号，选择`View Controller`，可以创建多个。
 - 2.在项目中`New File` -> `Cocoa Touch Class`，继承`UIViewController`，上面创建几个这里就创建几个。
 - 3.选中 `Tab Bar Controller` 然后按下键盘的`control`键，然后按住鼠标左键拖动到创建的`View Controller`的`Item`下。然后松手就关联上了。
 - 4.然后点击 `Item`将Class关联上刚才创建的`UIViewController`。

 
#### 自定义UITableViewCell 大致流程
- 1.新建`TableViewCellCustom`继承自`UITableViewCell `，然后会生成一个继承UITableViewCell的类，和一个`xib`的类。
- 2.将`xib`与继承的类相关联，配置好class设置为这个类。点击向下箭头的图标，设置一个**Identifier**值为在代码里配置的值。
- 3.重要的是：将Cell里的子View配置成`@IBOutlet`。**将窗口弄成双视图模式，即Cell类的代码在左边，xib视图在右边。按住`control`键再按住子view，然后将子view拖动到Cell类下，这样就生成了！**


#### 资料
ios Swift 常用的第三方库：

- https://www.jianshu.com/p/4ae8429c6d88 
- https://www.jianshu.com/p/e95f0cd77f94
