class Solution {
	struct Cell {
		let x: Int
		let y: Int
	}
	
	func numIslands(_ grid: [[Character]]) -> Int {
		let row = grid.count
		let col = grid[0].count
		
		var visited = [[Int]](repeating: [Int](repeating: -1, count: col), count: row)
		var res = 0
		
		var queue = Queue<Cell>()
		let dx = [0, 0, 1, -1]
		let dy = [1, -1, 0, 0]
		for i in 0..<grid.count {
			for j in 0..<grid[0].count {
				if grid[i][j] == "1" && visited[i][j] == -1 {
					queue.enqueue(item: Cell(x: j, y: i))
					res += 1
					visited[i][j] = res
					while !queue.isEmpty {
						let curr = queue.dequeue()!
						for k in 0..<4 {
							let nx = curr.x + dx[k]
							let ny = curr.y + dy[k]
							if nx>=0 && nx<col && ny>=0 && ny<row && visited[ny][nx] == -1 && grid[ny][nx]=="1" {
								queue.enqueue(item: Cell(x: nx, y: ny))
								visited[ny][nx] = visited[curr.y][curr.x]
							}
						}
					}
				}
			}
		}
		
		return res
	}
}

struct Queue<T> {
	var queue: [T] = []
	
	var isEmpty: Bool {
		return queue.count == 0
	}
	
	mutating func enqueue(item: T) {
		queue.append(item)
	}
	
	mutating func dequeue() -> T? {
		return queue.removeFirst()
	}
	
	func peek() -> T? {
		return queue.first
	}
}
