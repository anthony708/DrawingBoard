# DrawingBoard
### 原文链接： http://blog.csdn.net/zhangao0086/article/details/43836789

#### 1. 建立工程和完善storyboard

#### 2. 创建Board类,继承UIImageView：
        添加画笔宽度/颜色两个属性以及初始化方法.
        用枚举类型记录每次touch的状态（DrawingState），override touchesBegan/touchesMoved/touchesEnded三个方法
#### 3. BaseBrush类，实现PaintBrush接口（接口中有两个方法）
        PaintBrush接口中有两个方法：supportedContinuousDrawing/drawingContext
        BaseBrush中有四个属性：beginPoint/endPoint/lastPoint/strokeWidth
#### 4. 回到Board中，添加brush（BaseBrush类）和realImage（UIImage类）属性. 
        realImage保存当前图形，重新修改touch状态方法   
        添加touchedCancelled方法
#### 5. 完善drawingImage方法
        开启一个新的ImageContext，为保存每次的绘图状态作准备。
        初始化context，进行基本设置（画笔宽度、画笔颜色、画笔的圆润度等）。
        把之前保存的图片绘制进context中。
        设置brush的基本属性，以便子类更方便的绘图；调用具体的绘图方法，并最终添加到context中。
        从当前的context中，得到Image，如果是ended状态或者需要支持连续不断的绘图，则将Image保存到realImage中。
        实时显示当前的绘制状态，并记录绘制的最后一个点。
#### 6. 创建铅笔/直线/虚线/矩形/圆形/橡皮擦 工具类，都继承自BaseBrush类

#### 7. RGBColorPicker，用于选择RGB颜色
        画笔颜色设置、背景颜色设置都继承RGBColorPicker类
#### 8. 全屏绘图
#### 9. 保存到图库
