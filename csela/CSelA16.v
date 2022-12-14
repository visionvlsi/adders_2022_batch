
// Carry Select Adder - 16 bits
module CSelA16(output [15:0] sum, output cout, input [15:0] a, b);

  wire [15:0] sum0, sum1;
  wire c1, c2, c3;

  RCA4 rca0_0(sum0[3:0], cout0_0, a[3:0], b[3:0], 0);
  RCA4 rca0_1(sum1[3:0], cout0_1, a[3:0], b[3:0], 1);
  MUX2to1_w4 mux0_sum(sum[3:0], sum0[3:0], sum1[3:0], 0);
  MUX2to1_w1 mux0_cout(c1, cout0_0, cout0_1, 0);

  RCA4 rca1_0(sum0[7:4], cout1_0, a[7:4], b[7:4], 0);
  RCA4 rca1_1(sum1[7:4], cout1_1, a[7:4], b[7:4], 1);
  MUX2to1_w4 mux1_sum(sum[7:4], sum0[7:4], sum1[7:4], c1);
  MUX2to1_w1 mux1_cout(c2, cout1_0, cout1_1, c1);
  
  RCA4 rca2_0(sum0[11:8], cout2_0, a[11:8], b[11:8], 0);
  RCA4 rca2_1(sum1[11:8], cout2_1, a[11:8], b[11:8], 1);
  MUX2to1_w4 mux2_sum(sum[11:8], sum0[11:8], sum1[11:8], c2);
  MUX2to1_w1 mux2_cout(c3, cout2_0, cout2_1, c1);

  RCA4 rca3_0(sum0[15:12], cout3_0, a[15:12], b[15:12], 0);
  RCA4 rca3_1(sum1[15:12], cout3_1, a[15:12], b[15:12], 1);
  MUX2to1_w4 mux3_sum(sum[15:12], sum0[15:12], sum1[15:12], c3);
  MUX2to1_w1 mux3_cout(cout, cout3_0, cout3_1, c1);

endmodule
