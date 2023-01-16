class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        struct Square {
            let row: Int
            let column: Int
        }

        let dr = [0, 0, 1, -1]
        let dc = [1, -1, 0, 0]

        let m = image.count
        let n = image[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        var res = [[Int]]()

        for row in image {
            res.append(row)
        }        

        let queue = Queue<Square>()
        queue.enqueue(item: Square(row: sr, column: sc))
        visited[sr][sc] = true
        let initialColor = res[sr][sc]
        res[sr][sc] = color

        while !queue.isEmpty() {
            let curr = queue.dequeue()!
            for i in 0..<4 {
                let nr = curr.row + dr[i]
                let nc = curr.column + dc[i]
                if nr >= 0 && nr < m && nc >= 0 && nc < n {
                    if !visited[nr][nc] && res[nr][nc] == initialColor {
                        queue.enqueue(item: Square(row: nr, column: nc))
                        res[nr][nc] = color
                        visited[nr][nc] = true
                    }
                }
            }
        }

        return res
    }
}

public final class Queue<E>: Sequence {
	private var first: Node<E>? = nil
	private var last: Node<E>? = nil
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
	
	public init() {}
	
	public func isEmpty() -> Bool {
		return first == nil
	}
	
	public func peek() -> E? {
		return first?.item
	}
	
	public func enqueue(item: E) {
		let oldLast = last
		last = Node<E>(item: item)
		if isEmpty() { first = last }
		else { oldLast?.next = last }
		count += 1
	}
	
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
	
	public struct QueueIterator<E>: IteratorProtocol {
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
	
	public func makeIterator() -> QueueIterator<E> {
		return QueueIterator<E>(first)
	}
}
