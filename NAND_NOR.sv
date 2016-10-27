module NAND_NOR(nandOut, norOut, X, Y);
 output logic nandOut, norOut;
 input logic X, Y;
 logic andVal, orVal;
 AND_OR aoSubmodule (.andOut(andVal), .orOut(orVal),
 .A(X), .B(Y));
 not n1 (nandOut, andVal);
 not n2 (norOut, orVal);
endmodule