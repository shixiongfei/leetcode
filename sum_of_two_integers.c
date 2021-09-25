// 两整数之和
// https://leetcode-cn.com/problems/sum-of-two-integers/

int getSum(int a, int b) {
  unsigned int A = (unsigned int)a;
  unsigned int B = (unsigned int)b;

  while (B != 0) {
    unsigned int sum = A ^ B;
    unsigned int carry = (A & B) << 1;

    A = sum;
    B = carry;
  }

  // 正数直接返回, 负数需要还原补码
  return (int)(A < 0x80000000 ? A : -((~A) + 1));
}
