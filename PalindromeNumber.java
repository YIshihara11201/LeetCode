class Solution {
    public boolean isPalindrome(int x) {
        return isPalindromeHelper(String.valueOf(x));
    }
    
    public boolean isPalindromeHelper(String input) {
        if (input.indexOf("-") != -1) return false;
        if(input.length()<=1) return true;
        
        String high = input.substring(0, 1);
        String low = input.substring(input.length()-1);
        
        if(high.equals(low)) {
            String newInput = input.substring(1, input.length()-1);
            return isPalindromeHelper(newInput);
        } else {
            return false;
        }
    }
}
