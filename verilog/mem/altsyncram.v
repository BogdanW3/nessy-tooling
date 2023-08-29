module altsyncram   (
                    wren_a,
                    wren_b,
                    rden_a,
                    rden_b,
                    data_a,
                    data_b,
                    address_a,
                    address_b,
                    clock0,
                    clock1,
                    clocken0,
                    clocken1,
                    clocken2,
                    clocken3,
                    aclr0,
                    aclr1,
                    byteena_a,
                    byteena_b,
                    addressstall_a,
                    addressstall_b,
                    q_a,
                    q_b,
                    eccstatus
                    );

// PORT A PARAMETERS
    parameter width_a          = 1;
    parameter widthad_a        = 1;
    parameter numwords_a       = 0;
    parameter outdata_reg_a    = "UNREGISTERED";
    parameter address_aclr_a   = "NONE";
    parameter outdata_aclr_a   = "NONE";
    parameter indata_aclr_a    = "NONE";
    parameter wrcontrol_aclr_a = "NONE";
    parameter byteena_aclr_a   = "NONE";
    parameter width_byteena_a  = 1;

    // PORT B PARAMETERS
    parameter width_b                   = 1;
    parameter widthad_b                 = 1;
    parameter numwords_b                = 0;
    parameter rdcontrol_reg_b           = "CLOCK1";
    parameter address_reg_b             = "CLOCK1";
    parameter outdata_reg_b             = "UNREGISTERED";
    parameter outdata_aclr_b            = "NONE";
    parameter rdcontrol_aclr_b          = "NONE";
    parameter indata_reg_b              = "CLOCK1";
    parameter wrcontrol_wraddress_reg_b = "CLOCK1";
    parameter byteena_reg_b             = "CLOCK1";
    parameter indata_aclr_b             = "NONE";
    parameter wrcontrol_aclr_b          = "NONE";
    parameter address_aclr_b            = "NONE";
    parameter byteena_aclr_b            = "NONE";
    parameter width_byteena_b           = 1;

    // STRATIX II RELATED PARAMETERS
    parameter clock_enable_input_a  = "NORMAL";
    parameter clock_enable_output_a = "NORMAL";
    parameter clock_enable_input_b  = "NORMAL";
    parameter clock_enable_output_b = "NORMAL";

    parameter clock_enable_core_a = "USE_INPUT_CLKEN";
    parameter clock_enable_core_b = "USE_INPUT_CLKEN";
    parameter read_during_write_mode_port_a = "NEW_DATA_NO_NBE_READ";
    parameter read_during_write_mode_port_b = "NEW_DATA_NO_NBE_READ";

    // ECC STATUS RELATED PARAMETERS
    parameter enable_ecc = "FALSE";

    // GLOBAL PARAMETERS
    parameter operation_mode                     = "BIDIR_DUAL_PORT";
    parameter byte_size                          = 0;
    parameter read_during_write_mode_mixed_ports = "DONT_CARE";
    parameter ram_block_type                     = "AUTO";
    parameter init_file                          = "UNUSED";
    parameter init_file_layout                   = "UNUSED";
    parameter maximum_depth                      = 0;
    parameter intended_device_family             = "Stratix";

    parameter lpm_hint                           = "UNUSED";
    parameter lpm_type                           = "altsyncram";

    parameter implement_in_les                 = "OFF";
    
    parameter power_up_uninitialized            = "FALSE";
    
    parameter sim_show_memory_data_in_port_b_layout  = "OFF";
    
    // Internal parameters
    
    parameter is_lutram = ((ram_block_type == "LUTRAM") || (ram_block_type == "MLAB"))? 1 : 0;
    
    parameter is_bidir_and_wrcontrol_addb_clk0 =    (((operation_mode == "BIDIR_DUAL_PORT") && (address_reg_b == "CLOCK0"))? 
                                                    1 : 0);

    parameter is_bidir_and_wrcontrol_addb_clk1 =    (((operation_mode == "BIDIR_DUAL_PORT") && (address_reg_b == "CLOCK1"))? 
                                                    1 : 0);

    parameter check_simultaneous_read_write =   (((operation_mode == "BIDIR_DUAL_PORT") || (operation_mode == "DUAL_PORT")) && 
                                                ((ram_block_type == "M-RAM") || 
                                                    (ram_block_type == "MEGARAM") || 
                                                    ((ram_block_type == "AUTO") && (read_during_write_mode_mixed_ports == "DONT_CARE")) ||
                                                    ((is_lutram == 1) && ((read_during_write_mode_mixed_ports != "OLD_DATA") || (outdata_reg_b == "UNREGISTERED")))))? 1 : 0;

    parameter dual_port_addreg_b_clk0 = (((operation_mode == "DUAL_PORT") && (address_reg_b == "CLOCK0"))? 1: 0);

    parameter dual_port_addreg_b_clk1 = (((operation_mode == "DUAL_PORT") && (address_reg_b == "CLOCK1"))? 1: 0);

    parameter i_byte_size_tmp = (width_byteena_a > 1)? width_a / width_byteena_a : 8;
    
    parameter i_lutram_read = (((is_lutram == 1) && (read_during_write_mode_port_a == "DONT_CARE")) ||
                                ((is_lutram == 1) && (outdata_reg_a == "UNREGISTERED") && (operation_mode == "SINGLE_PORT")))? 1 : 0;

    parameter enable_mem_data_b_reading =  (sim_show_memory_data_in_port_b_layout == "ON") &&
                                            ((operation_mode == "BIDIR_DUAL_PORT") || (operation_mode == "DUAL_PORT")) ? 1 : 0;


    input  wren_a; // Port A write/read enable input
    input  wren_b; // Port B write enable input
    input  rden_a; // Port A read enable input
    input  rden_b; // Port B read enable input
    input  [width_a-1:0] data_a; // Port A data input
    input  [width_b-1:0] data_b; // Port B data input
    input  [widthad_a-1:0] address_a; // Port A address input
    input  [widthad_b-1:0] address_b; // Port B address input

    // clock inputs on both ports and here are their usage
    // Port A -- 1. all input registers must be clocked by clock0.
    //           2. output register can be clocked by either clock0, clock1 or none.
    // Port B -- 1. all input registered must be clocked by either clock0 or clock1.
    //           2. output register can be clocked by either clock0, clock1 or none.
    input  clock0;
    input  clock1;

    // clock enable inputs and here are their usage
    // clocken0 -- can only be used for enabling clock0.
    // clocken1 -- can only be used for enabling clock1.
    // clocken2 -- as an alternative for enabling clock0.
    // clocken3 -- as an alternative for enabling clock1.
    input  clocken0;
    input  clocken1;
    input  clocken2;
    input  clocken3;

    // clear inputs on both ports and here are their usage
    // Port A -- 1. all input registers can only be cleared by clear0 or none.
    //           2. output register can be cleared by either clear0, clear1 or none.
    // Port B -- 1. all input registers can be cleared by clear0, clear1 or none.
    //           2. output register can be cleared by either clear0, clear1 or none.
    input  aclr0;
    input  aclr1;

    input [width_byteena_a-1:0] byteena_a; // Port A byte enable input
    input [width_byteena_b-1:0] byteena_b; // Port B byte enable input

    // Stratix II related ports
    input addressstall_a;
    input addressstall_b;



// OUTPUT PORT DECLARATION

    output [width_a-1:0] q_a; // Port A output
    output [width_b-1:0] q_b; // Port B output

    output [2:0] eccstatus;   // ECC status flags


endmodule