# iOS_autoWeakPropDemo
通过category , block ,对 weak 属性的简单说明

1. weak属性的特点，当属性值释放时候，将指针制空

2. 设计思路：在作为属性值的OC对象销毁时候，向原对象发送一条消息

3. 实现方式：发送的消息使用block实现。为了不产生过大侵入，使用category。设计一个中间类 middleBlock , 封装该 block 消息。将该中间类对象和属性值通过关联对象绑定。生命周期同步，当属性值将要销毁时，中间类的dealloc 方法一定会被调用，在该方法中调用block。原对象在其中执行置空操作
