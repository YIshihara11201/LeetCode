class Solution {
    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        let n = heights.count
        let m = heights[0].count

        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, 1, -1]

        var queue = Queue<(x: Int, y: Int)>()
        queue.enqueue(item: (x: 1, y: 1))
        var effort = [[Int]](repeating: [Int](repeating: Int.max, count: m+1), count: n+1)

        effort[1][1] = 0
        while !queue.isEmpty() {
            let cell = queue.dequeue()!
            let x = cell.x
            let y = cell.y
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]

                if nx>0 && nx<=m && ny>0 && ny<=n {
                    // if effort[ny][nx] == Int.max {
                    if max(effort[y][x], abs(heights[y-1][x-1]-heights[ny-1][nx-1])) < effort[ny][nx] {
                        queue.enqueue(item: (x: nx, y: ny))
                        effort[ny][nx] = max(effort[y][x], abs(heights[y-1][x-1]-heights[ny-1][nx-1]))
                    }
                    
                }
            }
        }

        print(effort)
        return effort[n][m]
    }

}

public final class Queue<E> : Sequence {
	/// beginning of queue
	private var first: Node<E>? = nil
	/// end of queue
	private var last: Node<E>? = nil
	/// size of the queue
	private(set) var count: Int = 0
	
	/// helper linked list node class
	fileprivate class Node<E> {
		fileprivate var item: E
		fileprivate var next: Node<E>?
		fileprivate init(item: E, next: Node<E>? = nil) {
			self.item = item
			self.next = next
		}
	}
	
	/// Initializes an empty queue.
	public init() {}
	
	/// Returns true if this queue is empty.
	public func isEmpty() -> Bool {
		return first == nil
	}
	
	/// Returns the item least recently added to this queue.
	public func peek() -> E? {
		return first?.item
	}
	
	/// Adds the item to this queue
	/// - Parameter item: the item to add
	public func enqueue(item: E) {
		let oldLast = last
		last = Node<E>(item: item)
		if isEmpty() { first = last }
		else { oldLast?.next = last }
		count += 1
	}
	
	/// Removes and returns the item on this queue that was least recently added.
	public func dequeue() -> E? {
		if let item = first?.item {
			first = first?.next
			count -= 1
			// to avoid loitering
			if isEmpty() { last = nil }
			return item
		}
		return nil
	}
	
	/// QueueIterator that iterates over the items in FIFO order.
	public struct QueueIterator<E> : IteratorProtocol {
		private var current: Node<E>?
		
		fileprivate init(_ first: Node<E>?) {
			self.current = first
		}
		
		public mutating func next() -> E? {
			if let item = current?.item {
				current = current?.next
				return item
			}
			return nil
		}
		
		public typealias Element = E
	}
	
	/// Returns an iterator that iterates over the items in this Queue in FIFO order.
	public __consuming func makeIterator() -> QueueIterator<E> {
		return QueueIterator<E>(first)
	}
}

extension Queue: CustomStringConvertible {
	public var description: String {
		return self.reduce(into: "") { $0 += "\($1) " }
	}
}
