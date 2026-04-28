module dff(
    input D,
    input Clock,
    input Reset,
    output reg Q
);

    initial begin
        Q <= 0;
    end
    
    always @(posedge Clock, posedge Reset)
        if (Reset)
            Q <= 1'b0;
        else
            Q <= D;
    
endmodule
