module AND_OR(andOut, orOut, A, B);
 output logic andOut, orOut;
 input logic A, B;
 and TheAndGate (andOut, A, B);
 or TheOrGate (orOut, A, B);
endmodule
// Compute the logical NAND and NOR of inputs X and Y.

