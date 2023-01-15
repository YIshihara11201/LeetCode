class Solution {
    func tribonacci(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return n
        } else if n == 2 {
            return 1
        }

        var T: [Int] = [Int](repeating: 0, count: n+1)
        T[0] = 0
        T[1] = 1
        T[2] = 1

        if n>=3 {
            for i in 3...n {
                T[i] = T[i-3] + T[i-2] + T[i-1]
            }
        }

        return T[n]
    }
}
