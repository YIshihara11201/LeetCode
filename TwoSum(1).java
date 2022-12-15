class Solution {
    public int[] twoSum(int[] nums, int target) {
        int[] res = new int[2];
        int validIndex = -1;
        for(int i=0; i<nums.length; i++) {
            for (int j=0; j<nums.length; j++) {
                if(i==j) {
                    continue;
                }
                if (nums[j] == target-nums[i]) {
                    validIndex = j;
                    break;
                }
            }
            if(validIndex != -1) {
                res[0] = i;
                res[1] = validIndex;
                break;
            }
        }
        
        return res;
    }
    
}
