var MinStack = function() {
  MinStack.prototype.stack = [];    
};

/** 
 * @param {number} val
 * @return {void}
 */
MinStack.prototype.push = function(val) {
    MinStack.prototype.stack.push(val);
};

/**
 * @return {void}
 */
MinStack.prototype.pop = function() {
    MinStack.prototype.stack = MinStack.prototype.stack.slice(0, MinStack.prototype.stack.length-1);
};

/**
 * @return {number}
 */
MinStack.prototype.top = function() {
    return MinStack.prototype.stack[MinStack.prototype.stack.length-1];
};

/**
 * @return {number}
 */
MinStack.prototype.getMin = function() {
    return MinStack.prototype.stack.reduce((prev, cur)=>{
        if(prev<cur) return prev;
        else return cur;
    })
};

/** 
 * Your MinStack object will be instantiated and called as such:
 * var obj = new MinStack()
 * obj.push(val)
 * obj.pop()
 * var param_3 = obj.top()
 * var param_4 = obj.getMin()
 */
