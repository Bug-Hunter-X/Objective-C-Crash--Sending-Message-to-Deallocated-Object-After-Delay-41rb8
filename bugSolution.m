The solution involves using `weak` references to prevent the crash.  By declaring a weak reference to the object, the selector will not be performed if the object is deallocated before the delay.

```objectivec
@interface MyClass : NSObject
- (void)myMethod;
@end

@implementation MyClass
- (void)myMethod {
    NSLog("Method executed!");
}

- (void)delayedMethod {
    __weak MyClass *weakSelf = self; // Use weak reference
    [self performSelector:@selector(myMethod) withObject:nil afterDelay:2.0];
}
@end

```

**Explanation:**
The `__weak` keyword creates a weak reference to `self`. If `self` is deallocated, `weakSelf` automatically becomes `nil`. The `performSelector` method will then check `weakSelf` before executing the selector. If `weakSelf` is `nil`, the selector is not performed, preventing the crash.