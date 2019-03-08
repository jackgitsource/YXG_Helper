/**
 1. instancesRespondToSelector只能写在类名后面，respondsToSelector可以写在类名和实例名后面。
 2. [类 instancesRespondToSelector]判断的是该类的实例是否包含某方法，等效于：[该类的实例 respondsToSelector]。
 3. [类 respondsToSelector]用于判断是否包含某个类方法。
 */
/**
 IQ键盘的一个使用
 self 是VC
 self.returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
 self.returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeyGo;
 */
