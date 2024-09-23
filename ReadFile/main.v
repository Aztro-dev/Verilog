`define NULL 0

module main ();
  reg     [8*45:1] str;
  integer          fd;

  initial begin
    fd = $fopen("data_file.dat", "r");

    // Keep reading lines until EOF is found
    while (!$feof(
        fd
    )) begin

      // Get current line into the variable 'str'
      $fgets(str, fd);

      // Display contents of the variable
      $display("%0s", str);
    end
    $fclose(fd);
  end
endmodule
