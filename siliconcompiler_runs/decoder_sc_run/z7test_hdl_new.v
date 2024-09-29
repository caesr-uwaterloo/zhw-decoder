module decoder (
  clk,
  reset,
  maxbits,
  minbits,
  maxprec,
  minexp,
  s_bits_data_tdata,
  s_bits_data_tlast,
  s_bits_valid,
  s_bits_ready,
  m_stream_data_frac,
  m_stream_data_expo,
  m_stream_data_sign,
  m_stream_valid,
  m_stream_ready
);
  input wire [0:0] clk;
  input wire [0:0] reset;
  input wire [15:0] maxbits;
  input wire [15:0] minbits;
  input wire [15:0] maxprec;
  input wire signed [15:0] minexp;
  input wire [63:0] s_bits_data_tdata;
  input wire [0:0] s_bits_data_tlast;
  input wire [0:0] s_bits_valid;
  output wire [0:0] s_bits_ready;
  output wire [51:0] m_stream_data_frac;
  output wire [10:0] m_stream_data_expo;
  output wire [0:0] m_stream_data_sign;
  output wire [0:0] m_stream_valid;
  input wire [0:0] m_stream_ready;
  generate
    if (1) begin : itf
      wire [0:0] clk;
      wire [0:0] reset;
      wire [15:0] maxbits;
      wire [15:0] minbits;
      wire [15:0] maxprec;
      wire signed [15:0] minexp;
      wire [63:0] s_bits_data_tdata;
      wire [0:0] s_bits_data_tlast;
      wire [0:0] s_bits_valid;
      wire [0:0] s_bits_ready;
      wire [51:0] m_stream_data_frac;
      wire [10:0] m_stream_data_expo;
      wire [0:0] m_stream_data_sign;
      wire [0:0] m_stream_valid;
      wire [0:0] m_stream_ready;
    end
  endgenerate
  assign itf.clk = clk;
  assign itf.reset = reset;
  assign itf.maxbits = maxbits;
  assign itf.minbits = minbits;
  assign itf.maxprec = maxprec;
  assign itf.minexp = minexp;
  assign itf.s_bits_data_tdata = s_bits_data_tdata;
  assign itf.s_bits_data_tlast = s_bits_data_tlast;
  assign itf.s_bits_valid = s_bits_valid;
  assign s_bits_ready = itf.s_bits_ready;
  assign m_stream_data_frac = itf.m_stream_data_frac;
  assign m_stream_data_expo = itf.m_stream_data_expo;
  assign m_stream_data_sign = itf.m_stream_data_sign;
  assign m_stream_valid = itf.m_stream_valid;
  assign itf.m_stream_ready = m_stream_ready;
  generate
    if (1) begin : u_decoder
      wire [63:0] c_b_m_block_scclang_global_0 [0:15];
      wire [0:0] c_b_m_ready_scclang_global_1;
      wire [0:0] c_b_m_valid_scclang_global_2;
      wire [15:0] c_block_maxprec_scclang_global_3;
      wire signed [63:0] c_c_s_block_scclang_global_4 [0:15];
      wire [0:0] c_c_s_ready_scclang_global_5;
      wire [0:0] c_c_s_valid_scclang_global_6;
      wire [63:0] c_i_m_block_scclang_global_7 [0:15];
      wire [0:0] c_i_m_ready_scclang_global_8;
      wire [0:0] c_i_m_valid_scclang_global_9;
      wire signed [63:0] c_l_m_block_scclang_global_10 [0:15];
      wire [0:0] c_l_m_ready_scclang_global_11;
      wire [0:0] c_l_m_valid_scclang_global_12;
      wire [63:0] _c_s_bits_scclang_global_13_data_tdata;
      wire [0:0] _c_s_bits_scclang_global_13_data_tlast;
      wire [0:0] _c_s_bits_scclang_global_13_valid;
      wire [0:0] _c_s_bits_scclang_global_13_ready;
      wire [5:0] c_bc_scclang_global_14_data;
      wire [0:0] c_bc_scclang_global_14_valid;
      wire [0:0] c_bc_scclang_global_14_ready;
      wire [31:0] c_bp_scclang_global_15_data;
      wire [0:0] c_bp_scclang_global_15_valid;
      wire [0:0] c_bp_scclang_global_15_ready;
      wire [0:0] c_shdr_scclang_global_16_data_zb;
      wire [10:0] c_shdr_scclang_global_16_data_exp;
      wire [0:0] c_shdr_scclang_global_16_valid;
      wire [0:0] c_shdr_scclang_global_16_ready;
      wire [0:0] c_fhdr_scclang_global_17_data_zb;
      wire [10:0] c_fhdr_scclang_global_17_data_exp;
      wire [0:0] c_fhdr_scclang_global_17_valid;
      wire [0:0] c_fhdr_scclang_global_17_ready;
      wire [0:0] c_blk_start_scclang_global_18_data;
      wire [0:0] c_blk_start_scclang_global_18_valid;
      wire [0:0] c_blk_start_scclang_global_18_ready;
      if (1) begin : u_decode_stream_itf
        wire [0:0] clk;
        wire [0:0] reset;
        wire [15:0] s_minbits;
        wire [15:0] s_maxbits;
        wire [15:0] s_maxprec;
        wire signed [15:0] s_minexp;
        wire [0:0] s_blk_start_data;
        wire [0:0] s_blk_start_valid;
        wire [0:0] s_blk_start_ready;
        wire [5:0] s_bc_data;
        wire [0:0] s_bc_valid;
        wire [0:0] s_bc_ready;
        wire [63:0] s_bits_data_tdata;
        wire [0:0] s_bits_data_tlast;
        wire [0:0] s_bits_valid;
        wire [0:0] s_bits_ready;
        wire [15:0] m_block_maxprec;
        wire [0:0] m_bhdr_data_zb;
        wire [10:0] m_bhdr_data_exp;
        wire [0:0] m_bhdr_valid;
        wire [0:0] m_bhdr_ready;
        wire [31:0] m_bp_data;
        wire [0:0] m_bp_valid;
        wire [0:0] m_bp_ready;
      end
      if (1) begin : u_decode_stream
        decode_stream_sc_module_2 u_decode(
          .clk(u_decode_stream_itf.clk),
          .reset(u_decode_stream_itf.reset),
          .s_minbits(u_decode_stream_itf.s_minbits),
          .s_maxbits(u_decode_stream_itf.s_maxbits),
          .s_maxprec(u_decode_stream_itf.s_maxprec),
          .s_minexp(u_decode_stream_itf.s_minexp),
          .s_blk_start_data(u_decode_stream_itf.s_blk_start_data),
          .s_blk_start_valid(u_decode_stream_itf.s_blk_start_valid),
          .s_blk_start_ready(u_decode_stream_itf.s_blk_start_ready),
          .s_bc_data(u_decode_stream_itf.s_bc_data),
          .s_bc_valid(u_decode_stream_itf.s_bc_valid),
          .s_bc_ready(u_decode_stream_itf.s_bc_ready),
          .s_bits_data_tdata(u_decode_stream_itf.s_bits_data_tdata),
          .s_bits_data_tlast(u_decode_stream_itf.s_bits_data_tlast),
          .s_bits_valid(u_decode_stream_itf.s_bits_valid),
          .s_bits_ready(u_decode_stream_itf.s_bits_ready),
          .m_block_maxprec(u_decode_stream_itf.m_block_maxprec),
          .m_bhdr_data_zb(u_decode_stream_itf.m_bhdr_data_zb),
          .m_bhdr_data_exp(u_decode_stream_itf.m_bhdr_data_exp),
          .m_bhdr_valid(u_decode_stream_itf.m_bhdr_valid),
          .m_bhdr_ready(u_decode_stream_itf.m_bhdr_ready),
          .m_bp_data(u_decode_stream_itf.m_bp_data),
          .m_bp_valid(u_decode_stream_itf.m_bp_valid),
          .m_bp_ready(u_decode_stream_itf.m_bp_ready)
        );
      end
      assign u_decode_stream_itf.clk = itf.clk;
      assign u_decode_stream_itf.reset = itf.reset;
      assign u_decode_stream_itf.s_maxbits = itf.maxbits;
      assign u_decode_stream_itf.s_maxprec = itf.maxprec;
      assign u_decode_stream_itf.s_minbits = itf.minbits;
      assign u_decode_stream_itf.s_minexp = itf.minexp;
      assign u_decode_stream_itf.s_blk_start_data = c_blk_start_scclang_global_18_data;
      assign u_decode_stream_itf.s_blk_start_valid = c_blk_start_scclang_global_18_valid;
      assign c_blk_start_scclang_global_18_ready = u_decode_stream_itf.s_blk_start_ready;
      assign u_decode_stream_itf.s_bits_data_tdata = itf.s_bits_data_tdata;
      assign u_decode_stream_itf.s_bits_data_tlast = itf.s_bits_data_tlast;
      assign u_decode_stream_itf.s_bits_valid = itf.s_bits_valid;
      assign itf.s_bits_ready = u_decode_stream_itf.s_bits_ready;
      assign u_decode_stream_itf.s_bc_data = c_bc_scclang_global_14_data;
      assign u_decode_stream_itf.s_bc_valid = c_bc_scclang_global_14_valid;
      assign c_bc_scclang_global_14_ready = u_decode_stream_itf.s_bc_ready;
      assign c_bp_scclang_global_15_data = u_decode_stream_itf.m_bp_data;
      assign c_bp_scclang_global_15_valid = u_decode_stream_itf.m_bp_valid;
      assign u_decode_stream_itf.m_bp_ready = c_bp_scclang_global_15_ready;
      assign c_shdr_scclang_global_16_data_zb = u_decode_stream_itf.m_bhdr_data_zb;
      assign c_shdr_scclang_global_16_data_exp = u_decode_stream_itf.m_bhdr_data_exp;
      assign c_shdr_scclang_global_16_valid = u_decode_stream_itf.m_bhdr_valid;
      assign u_decode_stream_itf.m_bhdr_ready = c_shdr_scclang_global_16_ready;
      assign c_block_maxprec_scclang_global_3 = u_decode_stream_itf.m_block_maxprec;
      always @(*)
        ;
      if (1) begin : u_hfifo_itf
        wire [0:0] clk;
        wire [0:0] reset;
        wire [0:0] s_port_data_zb;
        wire [10:0] s_port_data_exp;
        wire [0:0] s_port_valid;
        wire [0:0] s_port_ready;
        wire [0:0] m_port_data_zb;
        wire [10:0] m_port_data_exp;
        wire [0:0] m_port_valid;
        wire [0:0] m_port_ready;
      end
      if (1) begin : u_hfifo
        rvfifo_cc_sc_module_3 u_rvfifo(
          .clk(u_hfifo_itf.clk),
          .reset(u_hfifo_itf.reset),
          .s_port_data_zb(u_hfifo_itf.s_port_data_zb),
          .s_port_data_exp(u_hfifo_itf.s_port_data_exp),
          .s_port_valid(u_hfifo_itf.s_port_valid),
          .s_port_ready(u_hfifo_itf.s_port_ready),
          .m_port_data_zb(u_hfifo_itf.m_port_data_zb),
          .m_port_data_exp(u_hfifo_itf.m_port_data_exp),
          .m_port_valid(u_hfifo_itf.m_port_valid),
          .m_port_ready(u_hfifo_itf.m_port_ready)
        );
      end
      assign u_hfifo_itf.clk = itf.clk;
      assign u_hfifo_itf.reset = itf.reset;
      assign u_hfifo_itf.s_port_data_zb = c_shdr_scclang_global_16_data_zb;
      assign u_hfifo_itf.s_port_data_exp = c_shdr_scclang_global_16_data_exp;
      assign u_hfifo_itf.s_port_valid = c_shdr_scclang_global_16_valid;
      assign c_shdr_scclang_global_16_ready = u_hfifo_itf.s_port_ready;
      assign c_fhdr_scclang_global_17_data_zb = u_hfifo_itf.m_port_data_zb;
      assign c_fhdr_scclang_global_17_data_exp = u_hfifo_itf.m_port_data_exp;
      assign c_fhdr_scclang_global_17_valid = u_hfifo_itf.m_port_valid;
      assign u_hfifo_itf.m_port_ready = c_fhdr_scclang_global_17_ready;
      always @(*)
        ;
      if (1) begin : u_decode_ints_itf
        wire [0:0] clk;
        wire [0:0] reset;
        wire [15:0] s_maxbits;
        wire [15:0] s_maxprec;
        wire [15:0] s_minbits;
        wire [0:0] m_ready;
        wire [31:0] s_bp_data;
        wire [0:0] s_bp_valid;
        wire [0:0] s_bp_ready;
        wire [1023:0] m_block;
        wire [0:0] m_valid;
        wire [5:0] m_bc_data;
        wire [0:0] m_bc_valid;
        wire [0:0] m_bc_ready;
        wire [0:0] m_blk_start_data;
        wire [0:0] m_blk_start_valid;
        wire [0:0] m_blk_start_ready;
      end
      if (1) begin : u_decode_ints
        wire [0:0] clk;
        wire [0:0] reset;
        wire [15:0] s_maxbits;
        wire [15:0] s_maxprec;
        wire [15:0] s_minbits;
        wire [0:0] m_ready;
        wire [31:0] s_bp_data;
        wire [0:0] s_bp_valid;
        wire [0:0] s_bp_ready;
        wire [63:0] m_block [0:15];
        wire [0:0] m_valid;
        wire [5:0] m_bc_data;
        wire [0:0] m_bc_valid;
        wire [0:0] m_bc_ready;
        wire [0:0] m_blk_start_data;
        wire [0:0] m_blk_start_valid;
        wire [0:0] m_blk_start_ready;
        decode_ints_sc_module_4 decode_ints(
          .clk(u_decode_ints_itf.clk),
          .reset(u_decode_ints_itf.reset),
          .s_maxbits(u_decode_ints_itf.s_maxbits),
          .s_maxprec(u_decode_ints_itf.s_maxprec),
          .s_minbits(u_decode_ints_itf.s_minbits),
          .m_ready(u_decode_ints_itf.m_ready),
          .s_bp_data(u_decode_ints_itf.s_bp_data),
          .s_bp_valid(u_decode_ints_itf.s_bp_valid),
          .s_bp_ready(u_decode_ints_itf.s_bp_ready),
          .m_block(u_decode_ints_itf.m_block),
          .m_valid(u_decode_ints_itf.m_valid),
          .m_bc_data(u_decode_ints_itf.m_bc_data),
          .m_bc_valid(u_decode_ints_itf.m_bc_valid),
          .m_bc_ready(u_decode_ints_itf.m_bc_ready),
          .m_blk_start_data(u_decode_ints_itf.m_blk_start_data),
          .m_blk_start_valid(u_decode_ints_itf.m_blk_start_valid),
          .m_blk_start_ready(u_decode_ints_itf.m_blk_start_ready)
        );
      end
      assign u_decode_ints_itf.clk = itf.clk;
      assign u_decode_ints_itf.reset = itf.reset;
      assign u_decode_ints_itf.s_bp_data = c_bp_scclang_global_15_data;
      assign u_decode_ints_itf.s_bp_valid = c_bp_scclang_global_15_valid;
      assign c_bp_scclang_global_15_ready = u_decode_ints_itf.s_bp_ready;
      assign u_decode_ints_itf.s_maxbits = itf.maxbits;
      assign u_decode_ints_itf.s_minbits = itf.minbits;
      assign u_decode_ints_itf.s_maxprec = c_block_maxprec_scclang_global_3;
      assign c_bc_scclang_global_14_data = u_decode_ints_itf.m_bc_data;
      assign c_bc_scclang_global_14_valid = u_decode_ints_itf.m_bc_valid;
      assign u_decode_ints_itf.m_bc_ready = c_bc_scclang_global_14_ready;
      assign c_blk_start_scclang_global_18_data = u_decode_ints_itf.m_blk_start_data;
      assign c_blk_start_scclang_global_18_valid = u_decode_ints_itf.m_blk_start_valid;
      assign u_decode_ints_itf.m_blk_start_ready = c_blk_start_scclang_global_18_ready;
      assign c_i_m_valid_scclang_global_9 = u_decode_ints_itf.m_valid;
      assign u_decode_ints_itf.m_ready = c_i_m_ready_scclang_global_8;
      always @(*)
        ;
      if (1) begin : u_block_buffer_itf
        wire [0:0] clk;
        wire [0:0] reset;
        wire [1023:0] s_block;
        wire [0:0] s_valid;
        wire [0:0] m_ready;
        wire [0:0] s_ready;
        wire [1023:0] m_block;
        wire [0:0] m_valid;
      end
      if (1) begin : u_block_buffer
        block_buffer_sc_module_5 u_block_buffer(
          .clk(u_block_buffer_itf.clk),
          .reset(u_block_buffer_itf.reset),
          .s_block(u_block_buffer_itf.s_block),
          .s_valid(u_block_buffer_itf.s_valid),
          .m_ready(u_block_buffer_itf.m_ready),
          .s_ready(u_block_buffer_itf.s_ready),
          .m_block(u_block_buffer_itf.m_block),
          .m_valid(u_block_buffer_itf.m_valid)
        );
      end
      assign u_block_buffer_itf.clk = itf.clk;
      assign u_block_buffer_itf.reset = itf.reset;
      assign u_block_buffer_itf.s_valid = c_i_m_valid_scclang_global_9;
      assign c_i_m_ready_scclang_global_8 = u_block_buffer_itf.s_ready;
      assign c_b_m_valid_scclang_global_2 = u_block_buffer_itf.m_valid;
      assign u_block_buffer_itf.m_ready = c_b_m_ready_scclang_global_1;
      always @(*)
        ;
      if (1) begin : u_decode_block_itf
        wire [0:0] clk;
        wire [0:0] reset;
        wire [1023:0] s_block;
        wire [0:0] s_valid;
        wire [0:0] m_ready;
        wire [0:0] s_ready;
        wire signed [1023:0] m_block;
        wire [0:0] m_valid;
      end
      if (1) begin : u_decode_block
        decode_block_sc_module_6 u_decode(
          .clk(u_decode_block_itf.clk),
          .reset(u_decode_block_itf.reset),
          .s_block(u_decode_block_itf.s_block),
          .s_valid(u_decode_block_itf.s_valid),
          .m_ready(u_decode_block_itf.m_ready),
          .s_ready(u_decode_block_itf.s_ready),
          .m_block(u_decode_block_itf.m_block),
          .m_valid(u_decode_block_itf.m_valid)
        );
      end
      assign u_decode_block_itf.clk = itf.clk;
      assign u_decode_block_itf.reset = itf.reset;
      assign u_decode_block_itf.s_valid = c_b_m_valid_scclang_global_2;
      assign c_b_m_ready_scclang_global_1 = u_decode_block_itf.s_ready;
      assign c_l_m_valid_scclang_global_12 = u_decode_block_itf.m_valid;
      assign u_decode_block_itf.m_ready = c_l_m_ready_scclang_global_11;
      always @(*)
        ;
      if (1) begin : u_cast_buffer_itf
        wire [0:0] clk;
        wire [0:0] reset;
        wire signed [1023:0] s_block;
        wire [0:0] s_valid;
        wire [0:0] m_ready;
        wire [0:0] s_ready;
        wire signed [1023:0] m_block;
        wire [0:0] m_valid;
      end
      if (1) begin : u_cast_buffer
        block_buffer_sc_module_7 u_block_buffer(
          .clk(u_cast_buffer_itf.clk),
          .reset(u_cast_buffer_itf.reset),
          .s_block(u_cast_buffer_itf.s_block),
          .s_valid(u_cast_buffer_itf.s_valid),
          .m_ready(u_cast_buffer_itf.m_ready),
          .s_ready(u_cast_buffer_itf.s_ready),
          .m_block(u_cast_buffer_itf.m_block),
          .m_valid(u_cast_buffer_itf.m_valid)
        );
      end
      assign u_cast_buffer_itf.clk = itf.clk;
      assign u_cast_buffer_itf.reset = itf.reset;
      assign u_cast_buffer_itf.s_valid = c_l_m_valid_scclang_global_12;
      assign c_l_m_ready_scclang_global_11 = u_cast_buffer_itf.s_ready;
      assign c_c_s_valid_scclang_global_6 = u_cast_buffer_itf.m_valid;
      assign u_cast_buffer_itf.m_ready = c_c_s_ready_scclang_global_5;
      always @(*)
        ;
      if (1) begin : u_inv_cast_itf
        wire [0:0] clk;
        wire [0:0] reset;
        wire signed [1023:0] s_block;
        wire [0:0] s_valid;
        wire [0:0] s_bhdr_data_zb;
        wire [10:0] s_bhdr_data_exp;
        wire [0:0] s_bhdr_valid;
        wire [0:0] s_bhdr_ready;
        wire [0:0] s_ready;
        wire [51:0] m_stream_data_frac;
        wire [10:0] m_stream_data_expo;
        wire [0:0] m_stream_data_sign;
        wire [0:0] m_stream_valid;
        wire [0:0] m_stream_ready;
      end
      if (1) begin : u_inv_cast
        inv_cast_sc_module_8 u_inv_cast(
          .clk(u_inv_cast_itf.clk),
          .reset(u_inv_cast_itf.reset),
          .s_block(u_inv_cast_itf.s_block),
          .s_valid(u_inv_cast_itf.s_valid),
          .s_bhdr_data_zb(u_inv_cast_itf.s_bhdr_data_zb),
          .s_bhdr_data_exp(u_inv_cast_itf.s_bhdr_data_exp),
          .s_bhdr_valid(u_inv_cast_itf.s_bhdr_valid),
          .s_bhdr_ready(u_inv_cast_itf.s_bhdr_ready),
          .s_ready(u_inv_cast_itf.s_ready),
          .m_stream_data_frac(u_inv_cast_itf.m_stream_data_frac),
          .m_stream_data_expo(u_inv_cast_itf.m_stream_data_expo),
          .m_stream_data_sign(u_inv_cast_itf.m_stream_data_sign),
          .m_stream_valid(u_inv_cast_itf.m_stream_valid),
          .m_stream_ready(u_inv_cast_itf.m_stream_ready)
        );
      end
      assign u_inv_cast_itf.clk = itf.clk;
      assign u_inv_cast_itf.reset = itf.reset;
      assign u_inv_cast_itf.s_bhdr_data_zb = c_fhdr_scclang_global_17_data_zb;
      assign u_inv_cast_itf.s_bhdr_data_exp = c_fhdr_scclang_global_17_data_exp;
      assign u_inv_cast_itf.s_bhdr_valid = c_fhdr_scclang_global_17_valid;
      assign c_fhdr_scclang_global_17_ready = u_inv_cast_itf.s_bhdr_ready;
      assign u_inv_cast_itf.s_valid = c_c_s_valid_scclang_global_6;
      assign c_c_s_ready_scclang_global_5 = u_inv_cast_itf.s_ready;
      assign itf.m_stream_data_frac = u_inv_cast_itf.m_stream_data_frac;
      assign itf.m_stream_data_expo = u_inv_cast_itf.m_stream_data_expo;
      assign itf.m_stream_data_sign = u_inv_cast_itf.m_stream_data_sign;
      assign itf.m_stream_valid = u_inv_cast_itf.m_stream_valid;
      assign u_inv_cast_itf.m_stream_ready = itf.m_stream_ready;
      always @(*)
        ;
      genvar _gv_i_u_dut_local_7_1;
      genvar _gv_i_u_dut_local_6_1;
      genvar _gv_i_u_dut_local_1_1;
      genvar _gv_i_u_dut_local_0_1;
      genvar _gv_i_u_dut_local_3_1;
      genvar _gv_i_u_dut_local_5_1;
      genvar _gv_i_u_dut_local_4_1;
      genvar _gv_i_u_dut_local_2_1;
      for (_gv_i_u_dut_local_0_1 = 0; _gv_i_u_dut_local_0_1 < 16; _gv_i_u_dut_local_0_1 = _gv_i_u_dut_local_0_1 + 1) begin : genblk1
        localparam i_u_dut_local_0 = _gv_i_u_dut_local_0_1;
        assign c_i_m_block_scclang_global_7[i_u_dut_local_0] = u_decode_ints_itf.m_block[(15 - i_u_dut_local_0) * 64+:64];
      end
      for (_gv_i_u_dut_local_1_1 = 0; _gv_i_u_dut_local_1_1 < 16; _gv_i_u_dut_local_1_1 = _gv_i_u_dut_local_1_1 + 1) begin : genblk2
        localparam i_u_dut_local_1 = _gv_i_u_dut_local_1_1;
        assign u_block_buffer_itf.s_block[(15 - i_u_dut_local_1) * 64+:64] = c_i_m_block_scclang_global_7[i_u_dut_local_1];
      end
      for (_gv_i_u_dut_local_2_1 = 0; _gv_i_u_dut_local_2_1 < 16; _gv_i_u_dut_local_2_1 = _gv_i_u_dut_local_2_1 + 1) begin : genblk3
        localparam i_u_dut_local_2 = _gv_i_u_dut_local_2_1;
        assign c_b_m_block_scclang_global_0[i_u_dut_local_2] = u_block_buffer_itf.m_block[(15 - i_u_dut_local_2) * 64+:64];
      end
      for (_gv_i_u_dut_local_3_1 = 0; _gv_i_u_dut_local_3_1 < 16; _gv_i_u_dut_local_3_1 = _gv_i_u_dut_local_3_1 + 1) begin : genblk4
        localparam i_u_dut_local_3 = _gv_i_u_dut_local_3_1;
        assign u_decode_block_itf.s_block[(15 - i_u_dut_local_3) * 64+:64] = c_b_m_block_scclang_global_0[i_u_dut_local_3];
      end
      for (_gv_i_u_dut_local_4_1 = 0; _gv_i_u_dut_local_4_1 < 16; _gv_i_u_dut_local_4_1 = _gv_i_u_dut_local_4_1 + 1) begin : genblk5
        localparam i_u_dut_local_4 = _gv_i_u_dut_local_4_1;
        assign c_l_m_block_scclang_global_10[i_u_dut_local_4] = u_decode_block_itf.m_block[(15 - i_u_dut_local_4) * 64+:64];
      end
      for (_gv_i_u_dut_local_5_1 = 0; _gv_i_u_dut_local_5_1 < 16; _gv_i_u_dut_local_5_1 = _gv_i_u_dut_local_5_1 + 1) begin : genblk6
        localparam i_u_dut_local_5 = _gv_i_u_dut_local_5_1;
        assign u_cast_buffer_itf.s_block[(15 - i_u_dut_local_5) * 64+:64] = c_l_m_block_scclang_global_10[i_u_dut_local_5];
      end
      for (_gv_i_u_dut_local_6_1 = 0; _gv_i_u_dut_local_6_1 < 16; _gv_i_u_dut_local_6_1 = _gv_i_u_dut_local_6_1 + 1) begin : genblk7
        localparam i_u_dut_local_6 = _gv_i_u_dut_local_6_1;
        assign c_c_s_block_scclang_global_4[i_u_dut_local_6] = u_cast_buffer_itf.m_block[(15 - i_u_dut_local_6) * 64+:64];
      end
      for (_gv_i_u_dut_local_7_1 = 0; _gv_i_u_dut_local_7_1 < 16; _gv_i_u_dut_local_7_1 = _gv_i_u_dut_local_7_1 + 1) begin : genblk8
        localparam i_u_dut_local_7 = _gv_i_u_dut_local_7_1;
        assign u_inv_cast_itf.s_block[(15 - i_u_dut_local_7) * 64+:64] = c_c_s_block_scclang_global_4[i_u_dut_local_7];
      end
    end
  endgenerate
endmodule
module decode_stream_sc_module_2 (
  clk,
  reset,
  s_minbits,
  s_maxbits,
  s_maxprec,
  s_minexp,
  s_blk_start_data,
  s_blk_start_valid,
  s_blk_start_ready,
  s_bc_data,
  s_bc_valid,
  s_bc_ready,
  s_bits_data_tdata,
  s_bits_data_tlast,
  s_bits_valid,
  s_bits_ready,
  m_block_maxprec,
  m_bhdr_data_zb,
  m_bhdr_data_exp,
  m_bhdr_valid,
  m_bhdr_ready,
  m_bp_data,
  m_bp_valid,
  m_bp_ready
);
  input wire [0:0] clk;
  input wire [0:0] reset;
  input wire [15:0] s_minbits;
  input wire [15:0] s_maxbits;
  input wire [15:0] s_maxprec;
  input wire signed [15:0] s_minexp;
  input wire [0:0] s_blk_start_data;
  input wire [0:0] s_blk_start_valid;
  output wire [0:0] s_blk_start_ready;
  input wire [5:0] s_bc_data;
  input wire [0:0] s_bc_valid;
  output wire [0:0] s_bc_ready;
  input wire [63:0] s_bits_data_tdata;
  input wire [0:0] s_bits_data_tlast;
  input wire [0:0] s_bits_valid;
  output wire [0:0] s_bits_ready;
  output wire [15:0] m_block_maxprec;
  output wire [0:0] m_bhdr_data_zb;
  output wire [10:0] m_bhdr_data_exp;
  output wire [0:0] m_bhdr_valid;
  input wire [0:0] m_bhdr_ready;
  output wire [31:0] m_bp_data;
  output wire [0:0] m_bp_valid;
  input wire [0:0] m_bp_ready;
  generate
    if (1) begin : itf
      wire [0:0] clk;
      wire [0:0] reset;
      wire [15:0] s_minbits;
      wire [15:0] s_maxbits;
      wire [15:0] s_maxprec;
      wire signed [15:0] s_minexp;
      wire [0:0] s_blk_start_data;
      wire [0:0] s_blk_start_valid;
      reg [0:0] s_blk_start_ready;
      wire [5:0] s_bc_data;
      wire [0:0] s_bc_valid;
      reg [0:0] s_bc_ready;
      wire [63:0] s_bits_data_tdata;
      wire [0:0] s_bits_data_tlast;
      wire [0:0] s_bits_valid;
      reg [0:0] s_bits_ready;
      reg [15:0] m_block_maxprec;
      reg [0:0] m_bhdr_data_zb;
      reg [10:0] m_bhdr_data_exp;
      reg [0:0] m_bhdr_valid;
      wire [0:0] m_bhdr_ready;
      reg [31:0] m_bp_data;
      reg [0:0] m_bp_valid;
      wire [0:0] m_bp_ready;
    end
    if (1) begin : u_decode
      reg _sv2v_0;
      reg [0:0] b_c_scclang_global_0_f [0:3];
      reg [31:0] b_c_scclang_global_0_w [0:3];
      reg [15:0] bits_scclang_global_1;
      reg signed [15:0] c_rembits_scclang_global_2;
      reg [7:0] c_wordoff_scclang_global_3;
      reg [0:0] csync_scclang_global_4;
      reg [15:0] minbits_scclang_global_5;
      reg [0:0] skpbts_scclang_global_6;
      reg [63:0] c_s_bfifo_scclang_global_7_data_tdata;
      reg [0:0] c_s_bfifo_scclang_global_7_data_tlast;
      reg [0:0] c_s_bfifo_scclang_global_7_valid;
      wire [0:0] c_s_bfifo_scclang_global_7_ready;
      wire [63:0] c_m_bfifo_scclang_global_8_data_tdata;
      wire [0:0] c_m_bfifo_scclang_global_8_data_tlast;
      wire [0:0] c_m_bfifo_scclang_global_8_valid;
      reg [0:0] c_m_bfifo_scclang_global_8_ready;
      reg [6:0] bitoff_actual_scclang_global_9;
      reg [0:0] _zb_actual_scclang_global_10;
      reg [0:0] _zb_actual_scclang_global_11;
      reg [10:0] _exp_actual_scclang_global_12;
      reg [0:0] _zb_actual_scclang_global_13;
      reg [10:0] maxexp_actual_scclang_global_14;
      if (1) begin : u_bfifo_itf
        wire [0:0] clk;
        wire [0:0] reset;
        wire [63:0] s_port_data_tdata;
        wire [0:0] s_port_data_tlast;
        wire [0:0] s_port_valid;
        wire [0:0] s_port_ready;
        wire [63:0] m_port_data_tdata;
        wire [0:0] m_port_data_tlast;
        wire [0:0] m_port_valid;
        wire [0:0] m_port_ready;
      end
      if (1) begin : u_bfifo
        reg signed [31:0] MAX_DEPTH_scclang_global_0 = 4;
        if (1) begin : u_fifo_itf
          wire [0:0] clk;
          wire [0:0] reset;
          wire [63:0] din_tdata;
          wire [0:0] din_tlast;
          wire [0:0] wr_en;
          wire [0:0] rd_en;
          reg [0:0] full;
          reg [63:0] dout_tdata;
          reg [0:0] dout_tlast;
          reg [0:0] empty;
        end
        if (1) begin : u_fifo
          reg [63:0] data_scclang_global_0_tdata [0:3];
          reg [0:0] data_scclang_global_0_tlast [0:3];
          reg [0:0] empty_i_scclang_global_1;
          reg [0:0] full_i_scclang_global_2;
          reg [0:0] rd_en_i_scclang_global_3;
          reg [1:0] rd_idx_scclang_global_4;
          reg [0:0] wr_en_i_scclang_global_5;
          reg [1:0] wr_idx_scclang_global_6;
          wire [31:0] depth_scclang_global_7;
          reg signed [31:0] MAX_DEPTH_scclang_global_8 = 4;
          always @(u_bfifo.u_fifo_itf.wr_en or u_bfifo.u_fifo_itf.rd_en or full_i_scclang_global_2 or empty_i_scclang_global_1 or rd_idx_scclang_global_4) begin : mc_proc
            u_bfifo.u_fifo_itf.dout_tdata <= data_scclang_global_0_tdata[rd_idx_scclang_global_4];
            u_bfifo.u_fifo_itf.dout_tlast <= data_scclang_global_0_tlast[rd_idx_scclang_global_4];
            wr_en_i_scclang_global_5 <= u_bfifo.u_fifo_itf.wr_en && !full_i_scclang_global_2;
            rd_en_i_scclang_global_3 <= u_bfifo.u_fifo_itf.rd_en && !empty_i_scclang_global_1;
            u_bfifo.u_fifo_itf.full <= full_i_scclang_global_2 == 0;
            u_bfifo.u_fifo_itf.empty <= empty_i_scclang_global_1 == 0;
          end
          always @(posedge u_bfifo.u_fifo_itf.clk) begin : ms_proc
            reg [1:0] wr_inc_ms_proc_local_3;
            reg [1:0] rd_inc_ms_proc_local_4;
            reg [31:0] i_ms_proc_local_5;
            wr_inc_ms_proc_local_3 = (wr_idx_scclang_global_6 + 1) % 4;
            rd_inc_ms_proc_local_4 = (rd_idx_scclang_global_4 + 1) % 4;
            if (u_bfifo.u_fifo_itf.reset == 0) begin
              for (i_ms_proc_local_5 = 0; i_ms_proc_local_5 < 4; i_ms_proc_local_5 = i_ms_proc_local_5 + 1)
                begin
                  data_scclang_global_0_tdata[i_ms_proc_local_5] <= 0;
                  data_scclang_global_0_tlast[i_ms_proc_local_5] <= 0;
                end
              rd_idx_scclang_global_4 <= 2'd0;
              wr_idx_scclang_global_6 <= 2'd0;
              full_i_scclang_global_2 <= 0;
              empty_i_scclang_global_1 <= 1;
            end
            else begin
              if (wr_en_i_scclang_global_5) begin
                data_scclang_global_0_tdata[wr_idx_scclang_global_6] <= u_bfifo.u_fifo_itf.din_tdata;
                data_scclang_global_0_tlast[wr_idx_scclang_global_6] <= u_bfifo.u_fifo_itf.din_tlast;
                wr_idx_scclang_global_6 <= wr_inc_ms_proc_local_3;
                if (!rd_en_i_scclang_global_3) begin
                  if (wr_inc_ms_proc_local_3 == rd_idx_scclang_global_4)
                    full_i_scclang_global_2 <= 1;
                  empty_i_scclang_global_1 <= 0;
                end
              end
              if (rd_en_i_scclang_global_3) begin
                rd_idx_scclang_global_4 <= rd_inc_ms_proc_local_4;
                if (!wr_en_i_scclang_global_5) begin
                  full_i_scclang_global_2 <= 0;
                  if (rd_inc_ms_proc_local_4 == wr_idx_scclang_global_6)
                    empty_i_scclang_global_1 <= 1;
                end
              end
            end
          end
          genvar _gv_i_u_fifo_local_1_1;
          for (_gv_i_u_fifo_local_1_1 = 0; _gv_i_u_fifo_local_1_1 < 4; _gv_i_u_fifo_local_1_1 = _gv_i_u_fifo_local_1_1 + 1) begin : genblk1
            localparam i_u_fifo_local_1 = _gv_i_u_fifo_local_1_1;
            always @(data_scclang_global_0_tdata[i_u_fifo_local_1]) begin : mc_proc
              u_bfifo.u_fifo_itf.dout_tdata <= data_scclang_global_0_tdata[rd_idx_scclang_global_4];
              u_bfifo.u_fifo_itf.dout_tlast <= data_scclang_global_0_tlast[rd_idx_scclang_global_4];
              wr_en_i_scclang_global_5 <= u_bfifo.u_fifo_itf.wr_en && !full_i_scclang_global_2;
              rd_en_i_scclang_global_3 <= u_bfifo.u_fifo_itf.rd_en && !empty_i_scclang_global_1;
              u_bfifo.u_fifo_itf.full <= full_i_scclang_global_2 == 0;
              u_bfifo.u_fifo_itf.empty <= empty_i_scclang_global_1 == 0;
            end
          end
          for (_gv_i_u_fifo_local_1_1 = 0; _gv_i_u_fifo_local_1_1 < 4; _gv_i_u_fifo_local_1_1 = _gv_i_u_fifo_local_1_1 + 1) begin : genblk2
            localparam i_u_fifo_local_1 = _gv_i_u_fifo_local_1_1;
            always @(data_scclang_global_0_tlast[i_u_fifo_local_1]) begin : mc_proc
              u_bfifo.u_fifo_itf.dout_tdata <= data_scclang_global_0_tdata[rd_idx_scclang_global_4];
              u_bfifo.u_fifo_itf.dout_tlast <= data_scclang_global_0_tlast[rd_idx_scclang_global_4];
              wr_en_i_scclang_global_5 <= u_bfifo.u_fifo_itf.wr_en && !full_i_scclang_global_2;
              rd_en_i_scclang_global_3 <= u_bfifo.u_fifo_itf.rd_en && !empty_i_scclang_global_1;
              u_bfifo.u_fifo_itf.full <= full_i_scclang_global_2 == 0;
              u_bfifo.u_fifo_itf.empty <= empty_i_scclang_global_1 == 0;
            end
          end
        end
        assign u_fifo_itf.clk = u_bfifo_itf.clk;
        assign u_fifo_itf.reset = u_bfifo_itf.reset;
        assign u_fifo_itf.din_tdata = u_bfifo_itf.s_port_data_tdata;
        assign u_fifo_itf.din_tlast = u_bfifo_itf.s_port_data_tlast;
        assign u_fifo_itf.wr_en = u_bfifo_itf.s_port_valid;
        assign u_bfifo_itf.s_port_ready = u_fifo_itf.full;
        assign u_bfifo_itf.m_port_data_tdata = u_fifo_itf.dout_tdata;
        assign u_bfifo_itf.m_port_data_tlast = u_fifo_itf.dout_tlast;
        assign u_fifo_itf.rd_en = u_bfifo_itf.m_port_ready;
        assign u_bfifo_itf.m_port_valid = u_fifo_itf.empty;
        always @(*)
          ;
      end
      assign u_bfifo_itf.clk = itf.clk;
      assign u_bfifo_itf.reset = itf.reset;
      assign u_bfifo_itf.s_port_data_tdata = c_s_bfifo_scclang_global_7_data_tdata;
      assign u_bfifo_itf.s_port_data_tlast = c_s_bfifo_scclang_global_7_data_tlast;
      assign u_bfifo_itf.s_port_valid = c_s_bfifo_scclang_global_7_valid;
      assign c_s_bfifo_scclang_global_7_ready = u_bfifo_itf.s_port_ready;
      assign c_m_bfifo_scclang_global_8_data_tdata = u_bfifo_itf.m_port_data_tdata;
      assign c_m_bfifo_scclang_global_8_data_tlast = u_bfifo_itf.m_port_data_tlast;
      assign c_m_bfifo_scclang_global_8_valid = u_bfifo_itf.m_port_valid;
      assign u_bfifo_itf.m_port_ready = c_m_bfifo_scclang_global_8_ready;
      always @(*)
        ;
      always @(itf.s_bits_valid or itf.s_bits_data_tdata or itf.s_bits_data_tlast or itf.s_bc_valid or c_s_bfifo_scclang_global_7_ready or itf.m_bhdr_ready or itf.m_bp_ready or itf.s_minbits or itf.s_maxbits or itf.s_maxprec or itf.s_minexp or itf.s_blk_start_valid or itf.s_blk_start_data or c_rembits_scclang_global_2) begin : mc_proc
        reg [0:0] _s_blk_cycle_mc_proc_local_3;
        reg [0:0] stall_for_fifo_mc_proc_local_4;
        reg [0:0] stall_for_exp_mc_proc_local_5;
        _s_blk_cycle_mc_proc_local_3 = (itf.s_blk_start_data == 1) && itf.s_blk_start_valid;
        stall_for_fifo_mc_proc_local_4 = !b_c_scclang_global_0_f[1];
        stall_for_exp_mc_proc_local_5 = _s_blk_cycle_mc_proc_local_3 & !itf.m_bhdr_ready;
        csync_scclang_global_4 <= stall_for_fifo_mc_proc_local_4 || stall_for_exp_mc_proc_local_5;
        c_s_bfifo_scclang_global_7_data_tdata <= itf.s_bits_data_tdata;
        c_s_bfifo_scclang_global_7_data_tlast <= itf.s_bits_data_tlast;
        itf.s_bits_ready <= c_s_bfifo_scclang_global_7_ready;
        c_s_bfifo_scclang_global_7_valid <= itf.s_bits_valid;
      end
      task automatic zhw__block_headerfp_t11_52__block_header_func_1;
        input reg [0:0] hthis_zb;
        input reg [10:0] hthis_exp;
        input reg [0:0] _zb;
        output reg [0:0] hthis_zb__ref_0;
        output reg [10:0] hthis_exp__ref_0;
        begin
          _zb_actual_scclang_global_10 = _zb;
          hthis_zb__ref_0 = _zb_actual_scclang_global_10;
          hthis_exp__ref_0 = 0;
        end
      endtask
      task automatic zhw__block_headerfp_t11_52__init_func_2;
        input reg [0:0] hthis_zb;
        input reg [10:0] hthis_exp;
        input reg [0:0] _zb;
        output reg [0:0] hthis_zb__ref_0;
        output reg [10:0] hthis_exp__ref_0;
        begin
          _zb_actual_scclang_global_11 = _zb;
          hthis_zb__ref_0 = _zb_actual_scclang_global_11;
          hthis_exp__ref_0 = 0;
        end
      endtask
      task automatic zhw__block_headerfp_t11_52__set_exp_func_6;
        input reg [0:0] hthis_zb;
        input reg [10:0] hthis_exp;
        input reg [10:0] _exp;
        output reg [10:0] hthis_exp__ref_0;
        begin
          _exp_actual_scclang_global_12 = _exp;
          hthis_exp__ref_0 = _exp_actual_scclang_global_12;
        end
      endtask
      task automatic zhw__block_headerfp_t11_52__set_zb_func_4;
        input reg [0:0] hthis_zb;
        input reg [10:0] hthis_exp;
        input reg [0:0] _zb;
        output reg [0:0] hthis_zb__ref_0;
        begin
          _zb_actual_scclang_global_13 = _zb;
          hthis_zb__ref_0 = _zb_actual_scclang_global_13;
        end
      endtask
      function automatic [15:0] zhw__decode_streamfp_t11_52_bits_t64_2__get_block_maxprec_func_5;
        input reg [10:0] maxexp;
        reg signed [15:0] _MAX__local_37;
        begin
          maxexp_actual_scclang_global_14 = maxexp;
          _MAX__local_37 = (maxexp_actual_scclang_global_14 - itf.s_minexp) + 6;
          if (_MAX__local_37 < 0)
            _MAX__local_37 = 0;
          if (_MAX__local_37 < itf.s_maxprec)
            zhw__decode_streamfp_t11_52_bits_t64_2__get_block_maxprec_func_5 = _MAX__local_37;
          else
            zhw__decode_streamfp_t11_52_bits_t64_2__get_block_maxprec_func_5 = itf.s_maxprec;
        end
      endfunction
      function automatic [0:0] zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7;
        input reg [3:0] pb_c_f;
        input reg [127:0] pb_c_w;
        reg [0:1] _sv2v_jump;
        begin
          _sv2v_jump = 2'b00;
          begin : sv2v_autoblock_1
            reg signed [31:0] reg_thresh_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_25;
            reg [63:0] word_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_26_tdata;
            reg [0:0] word_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_26_tlast;
            reg [1:0] w_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_27_f;
            reg [63:0] w_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_27_w;
            reg [0:0] empty_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_28_f;
            reg [31:0] empty_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_28_w;
            reg [3:0] tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_f;
            reg [127:0] tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_w;
            reg [0:0] read_data_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_30;
            reg [63:0] i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_31;
            reg [2:0] srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32;
            reg [2:0] tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33;
            reg [63:0] i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_34;
            reg [63:0] i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_35;
            reg [63:0] i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_36;
            reg [63:0] w_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_27_w__ref_0;
            reg [0:0] empty_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_28_f__ref_0;
            reg [127:0] tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_w__ref_0;
            reg [31:0] empty_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_28_w__ref_0;
            reg [3:0] tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_f__ref_0;
            reg [1:0] w_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_27_f__ref_0;
            reg_thresh_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_25 = 0;
            word_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_26_tdata = 0;
            word_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_26_tlast = 0;
            w_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_27_f = 2'h0;
            w_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_27_w = 64'h0000000000000000;
            empty_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_28_f = 0;
            empty_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_28_w = 0;
            tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_f = 4'h0;
            tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_w = 128'h00000000000000000000000000000000;
            read_data_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_30 = 0;
            i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_31 = 0;
            srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32 = 0;
            tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33 = 0;
            i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_34 = 0;
            i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_35 = 0;
            i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_36 = 0;
            w_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_27_w__ref_0 = 64'h0000000000000000;
            empty_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_28_f__ref_0 = 0;
            tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_w__ref_0 = 128'h00000000000000000000000000000000;
            empty_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_28_w__ref_0 = 0;
            tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_f__ref_0 = 4'h0;
            w_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_27_f__ref_0 = 2'h0;
            reg_thresh_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_25 = 3;
            word_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_26_tdata = c_m_bfifo_scclang_global_8_data_tdata;
            word_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_26_tlast = c_m_bfifo_scclang_global_8_data_tlast;
            read_data_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_30 = 0;
            if (c_m_bfifo_scclang_global_8_valid) begin
              if (c_m_bfifo_scclang_global_8_ready)
                for (i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_31 = 0; i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_31 < 2; i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_31 = i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_31 + 1)
                  begin
                    w_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_27_f[1 - i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_31+:1] = 1;
                    w_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_27_w[(1 - i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_31) * 32+:32] = word_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_26_tdata >>> (32 * i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_31);
                  end
              begin : sv2v_autoblock_2
                reg [2:0] _sv2v_value_on_break;
                for (srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32 = 0; srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32 < 4; srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32 = srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32 + 1)
                  if (_sv2v_jump < 2'b10) begin
                    _sv2v_jump = 2'b00;
                    if (pb_c_f[3 - srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32+:1])
                      _sv2v_jump = 2'b10;
                    _sv2v_value_on_break = srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32;
                  end
                if (!(_sv2v_jump < 2'b10))
                  srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32 = _sv2v_value_on_break;
                if (_sv2v_jump != 2'b11)
                  _sv2v_jump = 2'b00;
              end
              if (_sv2v_jump == 2'b00) begin
                begin : sv2v_autoblock_3
                  reg [2:0] _sv2v_value_on_break;
                  for (tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33 = 0; tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33 < 4; tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33 = tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33 + 1)
                    if (_sv2v_jump < 2'b10) begin
                      _sv2v_jump = 2'b00;
                      if (srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32 >= 4)
                        _sv2v_jump = 2'b10;
                      if (_sv2v_jump == 2'b00) begin
                        if (!pb_c_f[3 - srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32+:1])
                          _sv2v_jump = 2'b10;
                        else begin
                          tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_f[3 - tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33+:1] = pb_c_f[3 - srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32+:1];
                          tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_w[(3 - tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33) * 32+:32] = pb_c_w[(3 - srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32) * 32+:32];
                          srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32 = srcreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_32 + 1;
                        end
                      end
                      _sv2v_value_on_break = tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33;
                    end
                  if (!(_sv2v_jump < 2'b10))
                    tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33 = _sv2v_value_on_break;
                  if (_sv2v_jump != 2'b11)
                    _sv2v_jump = 2'b00;
                end
                if (_sv2v_jump == 2'b00) begin
                  if (tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33 < 3)
                    for (i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_34 = 0; i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_34 < 2; i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_34 = i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_34 + 1)
                      begin
                        tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_f[3 - tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33+:1] = w_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_27_f[1 - i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_34+:1];
                        tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_w[(3 - tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33) * 32+:32] = w_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_27_w[(1 - i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_34) * 32+:32];
                        tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33 = tgtreg_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_33 + 1;
                      end
                end
              end
            end
            else
              for (i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_35 = 0; i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_35 < 4; i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_35 = i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_35 + 1)
                begin
                  tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_f[3 - i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_35+:1] = pb_c_f[3 - i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_35+:1];
                  tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_w[(3 - i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_35) * 32+:32] = pb_c_w[(3 - i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_35) * 32+:32];
                end
            if (_sv2v_jump == 2'b00) begin
              for (i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_36 = 0; i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_36 < 4; i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_36 = i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_36 + 1)
                begin
                  b_c_scclang_global_0_f[i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_36] <= tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_f[3 - i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_36+:1];
                  b_c_scclang_global_0_w[i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_36] <= tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_w[(3 - i_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_36) * 32+:32];
                end
              if (!tmp_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_29_f[1+:1])
                read_data_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_30 = 1;
              else
                read_data_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_30 = 0;
              zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7 = read_data_zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7_local_30;
              _sv2v_jump = 2'b11;
            end
          end
        end
      endfunction
      function automatic [31:0] zhw__get_window_func_3;
        input reg [3:0] wb_c_f;
        input reg [127:0] wb_c_w;
        input reg [6:0] bitoff;
        output reg [3:0] wb_c_f__ref_0;
        reg [0:1] _sv2v_jump;
        begin
          _sv2v_jump = 2'b00;
          begin : sv2v_autoblock_4
            reg [5:0] wordoff__local_17;
            reg signed [31:0] i__local_18;
            reg [31:0] b1__local_19;
            reg [31:0] b2__local_20;
            reg [31:0] window__local_21;
            reg [2:0] i__local_22;
            reg [6:0] b1rshift__local_23;
            reg [6:0] b2lshift__local_24;
            bitoff_actual_scclang_global_9 = bitoff;
            wordoff__local_17 = bitoff_actual_scclang_global_9 / 32;
            begin : sv2v_autoblock_5
              reg signed [31:0] _sv2v_value_on_break;
              for (i__local_18 = 0; i__local_18 < 4; i__local_18 = i__local_18 + 1)
                if (_sv2v_jump < 2'b10) begin
                  _sv2v_jump = 2'b00;
                  if (!wb_c_f[3 - i__local_18+:1])
                    wordoff__local_17 = wordoff__local_17 + 1;
                  if (wb_c_f[3 - i__local_18+:1])
                    _sv2v_jump = 2'b10;
                  _sv2v_value_on_break = i__local_18;
                end
              if (!(_sv2v_jump < 2'b10))
                i__local_18 = _sv2v_value_on_break;
              if (_sv2v_jump != 2'b11)
                _sv2v_jump = 2'b00;
            end
            if (_sv2v_jump == 2'b00) begin
              b1__local_19 = wb_c_w[(3 - wordoff__local_17) * 32+:32];
              b2__local_20 = wb_c_w[(3 - (wordoff__local_17 + 1)) * 32+:32];
              for (i__local_22 = 3'd0; i__local_22 < 4; i__local_22 = i__local_22 + 1)
                if (i__local_22 < wordoff__local_17)
                  wb_c_f__ref_0[3 - i__local_22+:1] = 0;
              b1rshift__local_23 = bitoff_actual_scclang_global_9 % 32;
              b2lshift__local_24 = 32 - b1rshift__local_23;
              if (b1rshift__local_23 != 0)
                window__local_21 = (b1__local_19 >>> b1rshift__local_23) | (b2__local_20 << b2lshift__local_24);
              else
                window__local_21 = b1__local_19;
              zhw__get_window_func_3 = window__local_21;
              _sv2v_jump = 2'b11;
            end
          end
        end
      endfunction
      always @(negedge itf.clk) begin : ms_proc
        reg [0:0] b_c_init_v_ms_proc_local_6_f;
        reg [31:0] b_c_init_v_ms_proc_local_6_w;
        reg signed [31:0] i_ms_proc_local_7;
        reg [3:0] b_wrk_ms_proc_local_8_f;
        reg [127:0] b_wrk_ms_proc_local_8_w;
        reg [63:0] i_ms_proc_local_9;
        reg [7:0] w_wordoff_ms_proc_local_10;
        reg [0:0] _s_blk_cycle_ms_proc_local_11;
        reg [0:0] bhdr_ms_proc_local_12_zb;
        reg [10:0] bhdr_ms_proc_local_12_exp;
        reg signed [15:0] w_rembits_ms_proc_local_13;
        reg signed [15:0] dreg_bits_ms_proc_local_14;
        reg [10:0] blockexpt_ms_proc_local_15;
        reg [31:0] planewdw_ms_proc_local_16;
        reg [0:0] b_c_init_v_ms_proc_local_6_f__ref_0;
        reg [10:0] bhdr_ms_proc_local_12_exp__ref_0;
        reg [127:0] b_wrk_ms_proc_local_8_w__ref_0;
        reg [0:0] bhdr_ms_proc_local_12_zb__ref_0;
        reg [3:0] b_wrk_ms_proc_local_8_f__ref_0;
        reg [31:0] b_c_init_v_ms_proc_local_6_w__ref_0;
        b_c_init_v_ms_proc_local_6_w__ref_0 = b_c_init_v_ms_proc_local_6_w;
        b_wrk_ms_proc_local_8_f__ref_0 = b_wrk_ms_proc_local_8_f;
        bhdr_ms_proc_local_12_zb__ref_0 = bhdr_ms_proc_local_12_zb;
        b_wrk_ms_proc_local_8_w__ref_0 = b_wrk_ms_proc_local_8_w;
        bhdr_ms_proc_local_12_exp__ref_0 = bhdr_ms_proc_local_12_exp;
        b_c_init_v_ms_proc_local_6_f__ref_0 = b_c_init_v_ms_proc_local_6_f;
        if (itf.reset == 0) begin
          minbits_scclang_global_5 <= itf.s_maxbits - itf.s_minbits;
          c_m_bfifo_scclang_global_8_ready <= 0;
          skpbts_scclang_global_6 <= 0;
          itf.s_bc_ready <= 0;
          itf.m_bp_valid <= 0;
          c_wordoff_scclang_global_3 <= 8'd0;
          c_rembits_scclang_global_2 <= 0;
          b_c_init_v_ms_proc_local_6_f__ref_0 = 0;
          b_c_init_v_ms_proc_local_6_w__ref_0 = 0;
          for (i_ms_proc_local_7 = 0; i_ms_proc_local_7 < 4; i_ms_proc_local_7 = i_ms_proc_local_7 + 1)
            begin
              b_c_scclang_global_0_f[i_ms_proc_local_7] <= b_c_init_v_ms_proc_local_6_f__ref_0;
              b_c_scclang_global_0_w[i_ms_proc_local_7] <= b_c_init_v_ms_proc_local_6_w__ref_0;
            end
          bits_scclang_global_1 <= 0;
        end
        else begin
          for (i_ms_proc_local_9 = 0; i_ms_proc_local_9 < 4; i_ms_proc_local_9 = i_ms_proc_local_9 + 1)
            begin
              b_wrk_ms_proc_local_8_f__ref_0[3 - i_ms_proc_local_9+:1] = b_c_scclang_global_0_f[i_ms_proc_local_9];
              b_wrk_ms_proc_local_8_w__ref_0[(3 - i_ms_proc_local_9) * 32+:32] = b_c_scclang_global_0_w[i_ms_proc_local_9];
            end
          w_wordoff_ms_proc_local_10 = c_wordoff_scclang_global_3;
          _s_blk_cycle_ms_proc_local_11 = (itf.s_blk_start_data == 1) && itf.s_blk_start_valid;
          zhw__block_headerfp_t11_52__block_header_func_1(bhdr_ms_proc_local_12_zb__ref_0, bhdr_ms_proc_local_12_exp__ref_0, 1, bhdr_ms_proc_local_12_zb__ref_0, bhdr_ms_proc_local_12_exp__ref_0);
          zhw__block_headerfp_t11_52__init_func_2(bhdr_ms_proc_local_12_zb__ref_0, bhdr_ms_proc_local_12_exp__ref_0, 1, bhdr_ms_proc_local_12_zb__ref_0, bhdr_ms_proc_local_12_exp__ref_0);
          if (!csync_scclang_global_4 && (_s_blk_cycle_ms_proc_local_11 || skpbts_scclang_global_6)) begin
            w_rembits_ms_proc_local_13 = c_rembits_scclang_global_2;
            if (w_rembits_ms_proc_local_13 > 0) begin
              if (w_rembits_ms_proc_local_13 / 32) begin
                dreg_bits_ms_proc_local_14 = 32;
                begin : sv2v_autoblock_6
                  reg [31:0] sv2v_void;
                  sv2v_void = zhw__get_window_func_3(b_wrk_ms_proc_local_8_f__ref_0, b_wrk_ms_proc_local_8_w__ref_0, dreg_bits_ms_proc_local_14, b_wrk_ms_proc_local_8_f__ref_0);
                end
              end
              else begin
                dreg_bits_ms_proc_local_14 = w_rembits_ms_proc_local_13;
                begin : sv2v_autoblock_7
                  reg [31:0] sv2v_void;
                  sv2v_void = zhw__get_window_func_3(b_wrk_ms_proc_local_8_f__ref_0, b_wrk_ms_proc_local_8_w__ref_0, c_wordoff_scclang_global_3 + dreg_bits_ms_proc_local_14, b_wrk_ms_proc_local_8_f__ref_0);
                end
              end
              c_rembits_scclang_global_2 <= w_rembits_ms_proc_local_13 - dreg_bits_ms_proc_local_14;
              if (w_rembits_ms_proc_local_13 > 32)
                skpbts_scclang_global_6 <= 1;
              else begin
                c_wordoff_scclang_global_3 <= (c_wordoff_scclang_global_3 + dreg_bits_ms_proc_local_14) % 32;
                skpbts_scclang_global_6 <= 0;
              end
            end
            else
              skpbts_scclang_global_6 <= 0;
          end
          if (((!csync_scclang_global_4 && _s_blk_cycle_ms_proc_local_11) && !skpbts_scclang_global_6) && (itf.m_bp_ready && itf.s_bc_valid)) begin
            if (c_rembits_scclang_global_2 == 0) begin
              w_rembits_ms_proc_local_13 = itf.s_maxbits;
              zhw__block_headerfp_t11_52__set_zb_func_4(bhdr_ms_proc_local_12_zb__ref_0, bhdr_ms_proc_local_12_exp__ref_0, !(zhw__get_window_func_3(b_wrk_ms_proc_local_8_f__ref_0, b_wrk_ms_proc_local_8_w__ref_0, w_wordoff_ms_proc_local_10, b_wrk_ms_proc_local_8_f__ref_0) & 1), bhdr_ms_proc_local_12_zb__ref_0);
              w_wordoff_ms_proc_local_10 = w_wordoff_ms_proc_local_10 + 1;
              w_wordoff_ms_proc_local_10 = w_wordoff_ms_proc_local_10 % 32;
              w_rembits_ms_proc_local_13 = w_rembits_ms_proc_local_13 - 1;
              if (!bhdr_ms_proc_local_12_zb__ref_0) begin
                blockexpt_ms_proc_local_15 = zhw__get_window_func_3(b_wrk_ms_proc_local_8_f__ref_0, b_wrk_ms_proc_local_8_w__ref_0, w_wordoff_ms_proc_local_10, b_wrk_ms_proc_local_8_f__ref_0);
                w_wordoff_ms_proc_local_10 = w_wordoff_ms_proc_local_10 + 11;
                w_wordoff_ms_proc_local_10 = w_wordoff_ms_proc_local_10 % 32;
                w_rembits_ms_proc_local_13 = w_rembits_ms_proc_local_13 - 11;
                itf.m_block_maxprec <= zhw__decode_streamfp_t11_52_bits_t64_2__get_block_maxprec_func_5(blockexpt_ms_proc_local_15);
                zhw__block_headerfp_t11_52__set_exp_func_6(bhdr_ms_proc_local_12_zb__ref_0, bhdr_ms_proc_local_12_exp__ref_0, blockexpt_ms_proc_local_15, bhdr_ms_proc_local_12_exp__ref_0);
                itf.s_blk_start_ready <= 1;
              end
              else begin
                itf.m_bp_valid <= 0;
                itf.s_bc_ready <= 0;
                skpbts_scclang_global_6 <= 1;
              end
              c_wordoff_scclang_global_3 <= w_wordoff_ms_proc_local_10;
              c_rembits_scclang_global_2 <= w_rembits_ms_proc_local_13;
              itf.m_bhdr_data_zb <= bhdr_ms_proc_local_12_zb__ref_0;
              itf.m_bhdr_data_exp <= bhdr_ms_proc_local_12_exp__ref_0;
              itf.m_bhdr_valid <= 1;
            end
            else begin
              zhw__block_headerfp_t11_52__set_zb_func_4(bhdr_ms_proc_local_12_zb__ref_0, bhdr_ms_proc_local_12_exp__ref_0, 1, bhdr_ms_proc_local_12_zb__ref_0);
              itf.m_bhdr_valid <= 0;
              itf.m_bp_valid <= 0;
              itf.s_bc_ready <= 0;
              skpbts_scclang_global_6 <= 1;
            end
          end
          else begin
            if (itf.m_bhdr_ready)
              itf.m_bhdr_valid <= 0;
            itf.s_blk_start_ready <= 0;
          end
          if (((!csync_scclang_global_4 && (!_s_blk_cycle_ms_proc_local_11 || !bhdr_ms_proc_local_12_zb__ref_0)) && !skpbts_scclang_global_6) && (itf.m_bp_ready && itf.s_bc_valid)) begin
            if (!_s_blk_cycle_ms_proc_local_11)
              w_rembits_ms_proc_local_13 = c_rembits_scclang_global_2 - itf.s_bc_data;
            if (!_s_blk_cycle_ms_proc_local_11)
              w_wordoff_ms_proc_local_10 = w_wordoff_ms_proc_local_10 + itf.s_bc_data;
            planewdw_ms_proc_local_16 = zhw__get_window_func_3(b_wrk_ms_proc_local_8_f__ref_0, b_wrk_ms_proc_local_8_w__ref_0, w_wordoff_ms_proc_local_10, b_wrk_ms_proc_local_8_f__ref_0);
            w_wordoff_ms_proc_local_10 = w_wordoff_ms_proc_local_10 % 32;
            itf.m_bp_data <= planewdw_ms_proc_local_16;
            itf.m_bp_valid <= 1;
            itf.s_bc_ready <= 1;
            c_wordoff_scclang_global_3 <= w_wordoff_ms_proc_local_10;
            c_rembits_scclang_global_2 <= w_rembits_ms_proc_local_13;
          end
          else if (itf.m_bp_ready || itf.s_bc_valid) begin
            itf.m_bp_valid <= 0;
            itf.s_bc_ready <= 0;
          end
          c_m_bfifo_scclang_global_8_ready <= zhw__decode_streamfp_t11_52_bits_t64_2__refresh_next_bs_regs_func_7(b_wrk_ms_proc_local_8_f__ref_0, b_wrk_ms_proc_local_8_w__ref_0);
        end
        b_c_init_v_ms_proc_local_6_f = b_c_init_v_ms_proc_local_6_f__ref_0;
        bhdr_ms_proc_local_12_exp = bhdr_ms_proc_local_12_exp__ref_0;
        b_wrk_ms_proc_local_8_w = b_wrk_ms_proc_local_8_w__ref_0;
        bhdr_ms_proc_local_12_zb = bhdr_ms_proc_local_12_zb__ref_0;
        b_wrk_ms_proc_local_8_f = b_wrk_ms_proc_local_8_f__ref_0;
        b_c_init_v_ms_proc_local_6_w = b_c_init_v_ms_proc_local_6_w__ref_0;
      end
      task automatic zhw__plane_reg2__plane_reg_func_0;
        input reg [0:0] hthis_f;
        input reg [31:0] hthis_w;
        output reg [0:0] hthis_f__ref_0;
        output reg [31:0] hthis_w__ref_0;
        begin
          hthis_f__ref_0 = 0;
          hthis_w__ref_0 = 0;
        end
      endtask
      genvar _gv_i_u_decode_stream_local_1_1;
      initial _sv2v_0 = 0;
    end
  endgenerate
  assign itf.clk = clk;
  assign itf.reset = reset;
  assign itf.s_minbits = s_minbits;
  assign itf.s_maxbits = s_maxbits;
  assign itf.s_maxprec = s_maxprec;
  assign itf.s_minexp = s_minexp;
  assign itf.s_blk_start_data = s_blk_start_data;
  assign itf.s_blk_start_valid = s_blk_start_valid;
  assign s_blk_start_ready = itf.s_blk_start_ready;
  assign itf.s_bc_data = s_bc_data;
  assign itf.s_bc_valid = s_bc_valid;
  assign s_bc_ready = itf.s_bc_ready;
  assign itf.s_bits_data_tdata = s_bits_data_tdata;
  assign itf.s_bits_data_tlast = s_bits_data_tlast;
  assign itf.s_bits_valid = s_bits_valid;
  assign s_bits_ready = itf.s_bits_ready;
  assign m_block_maxprec = itf.m_block_maxprec;
  assign m_bhdr_data_zb = itf.m_bhdr_data_zb;
  assign m_bhdr_data_exp = itf.m_bhdr_data_exp;
  assign m_bhdr_valid = itf.m_bhdr_valid;
  assign itf.m_bhdr_ready = m_bhdr_ready;
  assign m_bp_data = itf.m_bp_data;
  assign m_bp_valid = itf.m_bp_valid;
  assign itf.m_bp_ready = m_bp_ready;
endmodule
module rvfifo_cc_sc_module_3 (
  clk,
  reset,
  s_port_data_zb,
  s_port_data_exp,
  s_port_valid,
  s_port_ready,
  m_port_data_zb,
  m_port_data_exp,
  m_port_valid,
  m_port_ready
);
  input wire [0:0] clk;
  input wire [0:0] reset;
  input wire [0:0] s_port_data_zb;
  input wire [10:0] s_port_data_exp;
  input wire [0:0] s_port_valid;
  output wire [0:0] s_port_ready;
  output wire [0:0] m_port_data_zb;
  output wire [10:0] m_port_data_exp;
  output wire [0:0] m_port_valid;
  input wire [0:0] m_port_ready;
  generate
    if (1) begin : itf
      wire [0:0] clk;
      wire [0:0] reset;
      wire [0:0] s_port_data_zb;
      wire [10:0] s_port_data_exp;
      wire [0:0] s_port_valid;
      wire [0:0] s_port_ready;
      wire [0:0] m_port_data_zb;
      wire [10:0] m_port_data_exp;
      wire [0:0] m_port_valid;
      wire [0:0] m_port_ready;
    end
    if (1) begin : u_fifo
      reg signed [31:0] MAX_DEPTH_scclang_global_0 = 4;
      if (1) begin : u_fifo_itf
        wire [0:0] clk;
        wire [0:0] reset;
        wire [0:0] din_zb;
        wire [10:0] din_exp;
        wire [0:0] wr_en;
        wire [0:0] rd_en;
        reg [0:0] full;
        reg [0:0] dout_zb;
        reg [10:0] dout_exp;
        reg [0:0] empty;
      end
      if (1) begin : u_fifo
        reg [0:0] data_scclang_global_0_zb [0:3];
        reg [10:0] data_scclang_global_0_exp [0:3];
        reg [0:0] empty_i_scclang_global_1;
        reg [0:0] full_i_scclang_global_2;
        reg [0:0] rd_en_i_scclang_global_3;
        reg [1:0] rd_idx_scclang_global_4;
        reg [0:0] wr_en_i_scclang_global_5;
        reg [1:0] wr_idx_scclang_global_6;
        wire [31:0] depth_scclang_global_7;
        reg signed [31:0] MAX_DEPTH_scclang_global_8 = 4;
        always @(u_fifo_itf.wr_en or u_fifo_itf.rd_en or full_i_scclang_global_2 or empty_i_scclang_global_1 or rd_idx_scclang_global_4) begin : mc_proc
          u_fifo_itf.dout_zb <= data_scclang_global_0_zb[rd_idx_scclang_global_4];
          u_fifo_itf.dout_exp <= data_scclang_global_0_exp[rd_idx_scclang_global_4];
          wr_en_i_scclang_global_5 <= u_fifo_itf.wr_en && !full_i_scclang_global_2;
          rd_en_i_scclang_global_3 <= u_fifo_itf.rd_en && !empty_i_scclang_global_1;
          u_fifo_itf.full <= full_i_scclang_global_2 == 0;
          u_fifo_itf.empty <= empty_i_scclang_global_1 == 0;
        end
        always @(posedge u_fifo_itf.clk) begin : ms_proc
          reg [1:0] wr_inc_ms_proc_local_3;
          reg [1:0] rd_inc_ms_proc_local_4;
          reg [31:0] i_ms_proc_local_5;
          wr_inc_ms_proc_local_3 = (wr_idx_scclang_global_6 + 1) % 4;
          rd_inc_ms_proc_local_4 = (rd_idx_scclang_global_4 + 1) % 4;
          if (u_fifo_itf.reset == 0) begin
            for (i_ms_proc_local_5 = 0; i_ms_proc_local_5 < 4; i_ms_proc_local_5 = i_ms_proc_local_5 + 1)
              begin
                data_scclang_global_0_zb[i_ms_proc_local_5] <= 0;
                data_scclang_global_0_exp[i_ms_proc_local_5] <= 0;
              end
            rd_idx_scclang_global_4 <= 2'd0;
            wr_idx_scclang_global_6 <= 2'd0;
            full_i_scclang_global_2 <= 0;
            empty_i_scclang_global_1 <= 1;
          end
          else begin
            if (wr_en_i_scclang_global_5) begin
              data_scclang_global_0_zb[wr_idx_scclang_global_6] <= u_fifo_itf.din_zb;
              data_scclang_global_0_exp[wr_idx_scclang_global_6] <= u_fifo_itf.din_exp;
              wr_idx_scclang_global_6 <= wr_inc_ms_proc_local_3;
              if (!rd_en_i_scclang_global_3) begin
                if (wr_inc_ms_proc_local_3 == rd_idx_scclang_global_4)
                  full_i_scclang_global_2 <= 1;
                empty_i_scclang_global_1 <= 0;
              end
            end
            if (rd_en_i_scclang_global_3) begin
              rd_idx_scclang_global_4 <= rd_inc_ms_proc_local_4;
              if (!wr_en_i_scclang_global_5) begin
                full_i_scclang_global_2 <= 0;
                if (rd_inc_ms_proc_local_4 == wr_idx_scclang_global_6)
                  empty_i_scclang_global_1 <= 1;
              end
            end
          end
        end
        genvar _gv_i_u_fifo_local_1_2;
        for (_gv_i_u_fifo_local_1_2 = 0; _gv_i_u_fifo_local_1_2 < 4; _gv_i_u_fifo_local_1_2 = _gv_i_u_fifo_local_1_2 + 1) begin : genblk1
          localparam i_u_fifo_local_1 = _gv_i_u_fifo_local_1_2;
          always @(data_scclang_global_0_zb[i_u_fifo_local_1]) begin : mc_proc
            u_fifo_itf.dout_zb <= data_scclang_global_0_zb[rd_idx_scclang_global_4];
            u_fifo_itf.dout_exp <= data_scclang_global_0_exp[rd_idx_scclang_global_4];
            wr_en_i_scclang_global_5 <= u_fifo_itf.wr_en && !full_i_scclang_global_2;
            rd_en_i_scclang_global_3 <= u_fifo_itf.rd_en && !empty_i_scclang_global_1;
            u_fifo_itf.full <= full_i_scclang_global_2 == 0;
            u_fifo_itf.empty <= empty_i_scclang_global_1 == 0;
          end
        end
        for (_gv_i_u_fifo_local_1_2 = 0; _gv_i_u_fifo_local_1_2 < 4; _gv_i_u_fifo_local_1_2 = _gv_i_u_fifo_local_1_2 + 1) begin : genblk2
          localparam i_u_fifo_local_1 = _gv_i_u_fifo_local_1_2;
          always @(data_scclang_global_0_exp[i_u_fifo_local_1]) begin : mc_proc
            u_fifo_itf.dout_zb <= data_scclang_global_0_zb[rd_idx_scclang_global_4];
            u_fifo_itf.dout_exp <= data_scclang_global_0_exp[rd_idx_scclang_global_4];
            wr_en_i_scclang_global_5 <= u_fifo_itf.wr_en && !full_i_scclang_global_2;
            rd_en_i_scclang_global_3 <= u_fifo_itf.rd_en && !empty_i_scclang_global_1;
            u_fifo_itf.full <= full_i_scclang_global_2 == 0;
            u_fifo_itf.empty <= empty_i_scclang_global_1 == 0;
          end
        end
      end
      assign u_fifo_itf.clk = itf.clk;
      assign u_fifo_itf.reset = itf.reset;
      assign u_fifo_itf.din_zb = itf.s_port_data_zb;
      assign u_fifo_itf.din_exp = itf.s_port_data_exp;
      assign u_fifo_itf.wr_en = itf.s_port_valid;
      assign itf.s_port_ready = u_fifo_itf.full;
      assign itf.m_port_data_zb = u_fifo_itf.dout_zb;
      assign itf.m_port_data_exp = u_fifo_itf.dout_exp;
      assign u_fifo_itf.rd_en = itf.m_port_ready;
      assign itf.m_port_valid = u_fifo_itf.empty;
      always @(*)
        ;
    end
  endgenerate
  assign itf.clk = clk;
  assign itf.reset = reset;
  assign itf.s_port_data_zb = s_port_data_zb;
  assign itf.s_port_data_exp = s_port_data_exp;
  assign itf.s_port_valid = s_port_valid;
  assign s_port_ready = itf.s_port_ready;
  assign m_port_data_zb = itf.m_port_data_zb;
  assign m_port_data_exp = itf.m_port_data_exp;
  assign m_port_valid = itf.m_port_valid;
  assign itf.m_port_ready = m_port_ready;
endmodule
module decode_ints_sc_module_4 (
  clk,
  reset,
  s_maxbits,
  s_maxprec,
  s_minbits,
  m_ready,
  s_bp_data,
  s_bp_valid,
  s_bp_ready,
  m_block,
  m_valid,
  m_bc_data,
  m_bc_valid,
  m_bc_ready,
  m_blk_start_data,
  m_blk_start_valid,
  m_blk_start_ready
);
  input wire [0:0] clk;
  input wire [0:0] reset;
  input wire [15:0] s_maxbits;
  input wire [15:0] s_maxprec;
  input wire [15:0] s_minbits;
  input wire [0:0] m_ready;
  input wire [31:0] s_bp_data;
  input wire [0:0] s_bp_valid;
  output wire [0:0] s_bp_ready;
  output wire [1023:0] m_block;
  output wire [0:0] m_valid;
  output wire [5:0] m_bc_data;
  output wire [0:0] m_bc_valid;
  input wire [0:0] m_bc_ready;
  output wire [0:0] m_blk_start_data;
  output wire [0:0] m_blk_start_valid;
  input wire [0:0] m_blk_start_ready;
  generate
    if (1) begin : itf
      wire [0:0] clk;
      wire [0:0] reset;
      wire [15:0] s_maxbits;
      wire [15:0] s_maxprec;
      wire [15:0] s_minbits;
      wire [0:0] m_ready;
      wire [31:0] s_bp_data;
      wire [0:0] s_bp_valid;
      reg [0:0] s_bp_ready;
      reg [1023:0] m_block;
      reg [0:0] m_valid;
      reg [5:0] m_bc_data;
      reg [0:0] m_bc_valid;
      wire [0:0] m_bc_ready;
      reg [0:0] m_blk_start_data;
      reg [0:0] m_blk_start_valid;
      wire [0:0] m_blk_start_ready;
    end
    if (1) begin : decode_ints
      reg [15:0] c_bplane_scclang_global_0 [0:63];
      reg [5:0] k_scclang_global_1;
      reg [15:0] kmin_scclang_global_2;
      reg [3:0] s_state_scclang_global_3;
      reg [4:0] n_scclang_global_4;
      reg [3:0] state_scclang_global_5;
      reg [63:0] x_scclang_global_6;
      reg [31:0] stream_window_scclang_global_7;
      reg [31:0] bits_scclang_global_8;
      reg [31:0] bitoff_scclang_global_9;
      reg signed [31:0] planes_scclang_global_10 = 64;
      reg signed [31:0] intprec_scclang_global_11 = 64;
      always @(itf.s_maxprec) begin : mc_proc
        reg [63:0] tmp_mc_proc_local_3;
        reg signed [31:0] j_mc_proc_local_4;
        reg signed [31:0] i_mc_proc_local_5;
        for (j_mc_proc_local_4 = 0; j_mc_proc_local_4 < 16; j_mc_proc_local_4 = j_mc_proc_local_4 + 1)
          begin
            for (i_mc_proc_local_5 = 0; i_mc_proc_local_5 < 64; i_mc_proc_local_5 = i_mc_proc_local_5 + 1)
              tmp_mc_proc_local_3[i_mc_proc_local_5] = c_bplane_scclang_global_0[i_mc_proc_local_5][j_mc_proc_local_4];
            itf.m_block[(15 - j_mc_proc_local_4) * 64+:64] <= tmp_mc_proc_local_3;
          end
        if (64 > itf.s_maxprec)
          kmin_scclang_global_2 <= 64 - itf.s_maxprec;
        else
          kmin_scclang_global_2 <= 0;
      end
      always @(posedge itf.clk) begin : sv2v_autoblock_1
        reg [0:1] _sv2v_jump;
        _sv2v_jump = 2'b00;
        begin : ms_proc
          reg [0:0] m_bc_valid_ms_proc_local_6;
          reg [0:0] s_bp_ready_ms_proc_local_7;
          reg [31:0] m_ms_proc_local_8;
          reg signed [31:0] i_ms_proc_local_9;
          reg [63:0] i_ms_proc_local_10;
          reg [0:0] last_ms_proc_local_11;
          if (itf.reset == 0) begin
            state_scclang_global_5 = 0;
            k_scclang_global_1 <= 63;
            n_scclang_global_4 = 0;
            bits_scclang_global_8 = itf.s_maxbits - 12;
            bitoff_scclang_global_9 = 0;
            itf.m_blk_start_data <= 1;
            itf.m_blk_start_valid <= 1;
            itf.s_bp_ready <= 0;
            itf.m_bc_valid <= 0;
            itf.m_bc_data <= 0;
          end
          else begin
            m_bc_valid_ms_proc_local_6 = itf.m_ready && (!itf.m_bc_ready || itf.s_bp_valid);
            s_bp_ready_ms_proc_local_7 = itf.m_ready && (!itf.s_bp_valid || itf.m_bc_ready);
            itf.s_bp_ready <= s_bp_ready_ms_proc_local_7;
            itf.m_bc_valid <= m_bc_valid_ms_proc_local_6;
            if (itf.m_blk_start_ready == 1) begin
              itf.m_blk_start_data <= 0;
              itf.m_blk_start_valid <= 0;
            end
            if (((itf.m_ready || (k_scclang_global_1 != kmin_scclang_global_2)) && itf.m_bc_ready) && itf.s_bp_valid) begin
              stream_window_scclang_global_7 = itf.s_bp_data;
              if (n_scclang_global_4 < bits_scclang_global_8)
                m_ms_proc_local_8 = n_scclang_global_4;
              else
                m_ms_proc_local_8 = bits_scclang_global_8;
              bits_scclang_global_8 = bits_scclang_global_8 - m_ms_proc_local_8;
              if (m_ms_proc_local_8 > 0)
                x_scclang_global_6 = stream_window_scclang_global_7 & (~64'd0 >>> (64 - m_ms_proc_local_8));
              else
                x_scclang_global_6 = 0;
              bitoff_scclang_global_9 = m_ms_proc_local_8;
              begin : sv2v_autoblock_2
                reg signed [31:0] _sv2v_value_on_break;
                for (i_ms_proc_local_9 = 0; i_ms_proc_local_9 < 32; i_ms_proc_local_9 = i_ms_proc_local_9 + 1)
                  if (_sv2v_jump < 2'b10) begin
                    _sv2v_jump = 2'b00;
                    if (!(n_scclang_global_4 < 16))
                      _sv2v_jump = 2'b10;
                    if (_sv2v_jump == 2'b00) begin
                      if (state_scclang_global_5 & 1) begin
                        if (state_scclang_global_5 & 2) begin
                          state_scclang_global_5 = 1;
                          if (n_scclang_global_4 < 16)
                            bits_scclang_global_8 = bits_scclang_global_8 - 1;
                        end
                        if ((n_scclang_global_4 < 15) && !(state_scclang_global_5 & 4)) begin
                          if (!bits_scclang_global_8) begin
                            x_scclang_global_6[n_scclang_global_4] = 1;
                            state_scclang_global_5 = 4;
                          end
                          else begin
                            bits_scclang_global_8 = bits_scclang_global_8 - 1;
                            
                            if (stream_window_scclang_global_7[bitoff_scclang_global_9]) begin
                              x_scclang_global_6[n_scclang_global_4] = 1;
                              state_scclang_global_5 = 4;
                            end
                            bitoff_scclang_global_9 = bitoff_scclang_global_9 + 1;
                          end
                          n_scclang_global_4 = n_scclang_global_4 + 1;
                        end
                        if ((n_scclang_global_4 == 15) || (state_scclang_global_5 & 4)) begin
                          if ((n_scclang_global_4 >= 15) && !(state_scclang_global_5 & 4)) begin
                            x_scclang_global_6[n_scclang_global_4] = 1;
                            n_scclang_global_4 = n_scclang_global_4 + 1;
                          end
                          state_scclang_global_5 = 4;
                        end
                      end
                      if (!(state_scclang_global_5 & 1)) begin
                        if (!bits_scclang_global_8 || (n_scclang_global_4 >= 16))
                          _sv2v_jump = 2'b10;
                        if (_sv2v_jump == 2'b00) begin
                          if (stream_window_scclang_global_7[bitoff_scclang_global_9])
                            state_scclang_global_5 = 3;
                          else
                            _sv2v_jump = 2'b10;
                          bitoff_scclang_global_9 = bitoff_scclang_global_9 + 1;
                        end
                      end
                    end
                    _sv2v_value_on_break = i_ms_proc_local_9;
                  end
                if (!(_sv2v_jump < 2'b10))
                  i_ms_proc_local_9 = _sv2v_value_on_break;
                if (_sv2v_jump != 2'b11)
                  _sv2v_jump = 2'b00;
              end
              if (_sv2v_jump == 2'b00) begin
                if ((n_scclang_global_4 < 16) && bits_scclang_global_8)
                  bits_scclang_global_8 = bits_scclang_global_8 - 1;
                state_scclang_global_5 = 0;
                if (k_scclang_global_1 == 63)
                  for (i_ms_proc_local_10 = 0; i_ms_proc_local_10 < 63; i_ms_proc_local_10 = i_ms_proc_local_10 + 1)
                    c_bplane_scclang_global_0[i_ms_proc_local_10] <= 16'd0;
                c_bplane_scclang_global_0[k_scclang_global_1] <= x_scclang_global_6;
                itf.m_bc_data <= bitoff_scclang_global_9;
                last_ms_proc_local_11 = (bits_scclang_global_8 == 0) || (k_scclang_global_1 <= kmin_scclang_global_2);
                if (last_ms_proc_local_11) begin
                  k_scclang_global_1 <= 63;
                  n_scclang_global_4 = 0;
                  bits_scclang_global_8 = itf.s_maxbits - 12;
                end
                else
                  k_scclang_global_1 <= k_scclang_global_1 - 1;
                itf.m_valid <= last_ms_proc_local_11;
                itf.m_blk_start_valid <= last_ms_proc_local_11;
                itf.m_blk_start_data <= last_ms_proc_local_11;
              end
            end
            if (_sv2v_jump == 2'b00) begin
              if (itf.m_valid && itf.m_ready)
                itf.m_valid <= 0;
            end
          end
          if (_sv2v_jump == 2'b00)
            s_state_scclang_global_3 <= state_scclang_global_5;
        end
      end
      genvar _gv_i_u_decode_ints_local_1_1;
      for (_gv_i_u_decode_ints_local_1_1 = 0; _gv_i_u_decode_ints_local_1_1 < 64; _gv_i_u_decode_ints_local_1_1 = _gv_i_u_decode_ints_local_1_1 + 1) begin : genblk1
        localparam i_u_decode_ints_local_1 = _gv_i_u_decode_ints_local_1_1;
        always @(c_bplane_scclang_global_0[i_u_decode_ints_local_1]) begin : mc_proc
          reg [63:0] tmp_mc_proc_local_3;
          reg signed [31:0] j_mc_proc_local_4;
          reg signed [31:0] i_mc_proc_local_5;
          for (j_mc_proc_local_4 = 0; j_mc_proc_local_4 < 16; j_mc_proc_local_4 = j_mc_proc_local_4 + 1)
            begin
              for (i_mc_proc_local_5 = 0; i_mc_proc_local_5 < 64; i_mc_proc_local_5 = i_mc_proc_local_5 + 1)
                tmp_mc_proc_local_3[i_mc_proc_local_5] = c_bplane_scclang_global_0[i_mc_proc_local_5][j_mc_proc_local_4];
              itf.m_block[(15 - j_mc_proc_local_4) * 64+:64] <= tmp_mc_proc_local_3;
            end
          if (64 > itf.s_maxprec)
            kmin_scclang_global_2 <= 64 - itf.s_maxprec;
          else
            kmin_scclang_global_2 <= 0;
        end
      end
    end
  endgenerate
  assign itf.clk = clk;
  assign itf.reset = reset;
  assign itf.s_maxbits = s_maxbits;
  assign itf.s_maxprec = s_maxprec;
  assign itf.s_minbits = s_minbits;
  assign itf.m_ready = m_ready;
  assign itf.s_bp_data = s_bp_data;
  assign itf.s_bp_valid = s_bp_valid;
  assign s_bp_ready = itf.s_bp_ready;
  assign m_block = itf.m_block;
  assign m_valid = itf.m_valid;
  assign m_bc_data = itf.m_bc_data;
  assign m_bc_valid = itf.m_bc_valid;
  assign itf.m_bc_ready = m_bc_ready;
  assign m_blk_start_data = itf.m_blk_start_data;
  assign m_blk_start_valid = itf.m_blk_start_valid;
  assign itf.m_blk_start_ready = m_blk_start_ready;
endmodule
module block_buffer_sc_module_5 (
  clk,
  reset,
  s_block,
  s_valid,
  m_ready,
  s_ready,
  m_block,
  m_valid
);
  input wire [0:0] clk;
  input wire [0:0] reset;
  input wire [1023:0] s_block;
  input wire [0:0] s_valid;
  input wire [0:0] m_ready;
  output wire [0:0] s_ready;
  output wire [1023:0] m_block;
  output wire [0:0] m_valid;
  generate
    if (1) begin : itf
      wire [0:0] clk;
      wire [0:0] reset;
      wire [1023:0] s_block;
      wire [0:0] s_valid;
      wire [0:0] m_ready;
      wire [0:0] s_ready;
      reg [1023:0] m_block;
      wire [0:0] m_valid;
    end
    if (1) begin : u_block_buffer
      reg [1023:0] c_bi_scclang_global_0;
      wire [1023:0] c_bo_scclang_global_1;
      if (1) begin : u_bbuf_itf
        wire [0:0] clk;
        wire [0:0] reset;
        wire [1023:0] din;
        wire [0:0] wr_en;
        wire [0:0] rd_en;
        reg [0:0] full;
        reg [1023:0] dout;
        reg [0:0] empty;
      end
      if (1) begin : u_bbuf
        reg [1023:0] data_scclang_global_0 [0:1];
        reg [0:0] empty_i_scclang_global_1;
        reg [0:0] full_i_scclang_global_2;
        reg [0:0] rd_en_i_scclang_global_3;
        reg [0:0] rd_idx_scclang_global_4;
        reg [0:0] wr_en_i_scclang_global_5;
        reg [0:0] wr_idx_scclang_global_6;
        wire [31:0] depth_scclang_global_7;
        reg signed [31:0] MAX_DEPTH_scclang_global_8 = 2;
        always @(u_bbuf_itf.wr_en or u_bbuf_itf.rd_en or full_i_scclang_global_2 or empty_i_scclang_global_1 or rd_idx_scclang_global_4) begin : mc_proc
          u_bbuf_itf.dout <= data_scclang_global_0[rd_idx_scclang_global_4];
          wr_en_i_scclang_global_5 <= u_bbuf_itf.wr_en && !full_i_scclang_global_2;
          rd_en_i_scclang_global_3 <= u_bbuf_itf.rd_en && !empty_i_scclang_global_1;
          u_bbuf_itf.full <= full_i_scclang_global_2 == 0;
          u_bbuf_itf.empty <= empty_i_scclang_global_1 == 0;
        end
        always @(posedge u_bbuf_itf.clk) begin : ms_proc
          reg [0:0] wr_inc_ms_proc_local_3;
          reg [0:0] rd_inc_ms_proc_local_4;
          reg [31:0] i_ms_proc_local_5;
          wr_inc_ms_proc_local_3 = (wr_idx_scclang_global_6 + 1) % 2;
          rd_inc_ms_proc_local_4 = (rd_idx_scclang_global_4 + 1) % 2;
          if (u_bbuf_itf.reset == 0) begin
            for (i_ms_proc_local_5 = 0; i_ms_proc_local_5 < 2; i_ms_proc_local_5 = i_ms_proc_local_5 + 1)
              data_scclang_global_0[i_ms_proc_local_5] <= 0;
            rd_idx_scclang_global_4 <= 1'd0;
            wr_idx_scclang_global_6 <= 1'd0;
            full_i_scclang_global_2 <= 0;
            empty_i_scclang_global_1 <= 1;
          end
          else begin
            if (wr_en_i_scclang_global_5) begin
              data_scclang_global_0[wr_idx_scclang_global_6] <= u_bbuf_itf.din;
              wr_idx_scclang_global_6 <= wr_inc_ms_proc_local_3;
              if (!rd_en_i_scclang_global_3) begin
                if (wr_inc_ms_proc_local_3 == rd_idx_scclang_global_4)
                  full_i_scclang_global_2 <= 1;
                empty_i_scclang_global_1 <= 0;
              end
            end
            if (rd_en_i_scclang_global_3) begin
              rd_idx_scclang_global_4 <= rd_inc_ms_proc_local_4;
              if (!wr_en_i_scclang_global_5) begin
                full_i_scclang_global_2 <= 0;
                if (rd_inc_ms_proc_local_4 == wr_idx_scclang_global_6)
                  empty_i_scclang_global_1 <= 1;
              end
            end
          end
        end
        genvar _gv_i_u_bbuf_local_1_1;
        for (_gv_i_u_bbuf_local_1_1 = 0; _gv_i_u_bbuf_local_1_1 < 2; _gv_i_u_bbuf_local_1_1 = _gv_i_u_bbuf_local_1_1 + 1) begin : genblk1
          localparam i_u_bbuf_local_1 = _gv_i_u_bbuf_local_1_1;
          always @(data_scclang_global_0[i_u_bbuf_local_1]) begin : mc_proc
            u_bbuf_itf.dout <= data_scclang_global_0[rd_idx_scclang_global_4];
            wr_en_i_scclang_global_5 <= u_bbuf_itf.wr_en && !full_i_scclang_global_2;
            rd_en_i_scclang_global_3 <= u_bbuf_itf.rd_en && !empty_i_scclang_global_1;
            u_bbuf_itf.full <= full_i_scclang_global_2 == 0;
            u_bbuf_itf.empty <= empty_i_scclang_global_1 == 0;
          end
        end
      end
      assign u_bbuf_itf.clk = itf.clk;
      assign u_bbuf_itf.reset = itf.reset;
      assign u_bbuf_itf.din = c_bi_scclang_global_0;
      assign u_bbuf_itf.wr_en = itf.s_valid;
      assign itf.s_ready = u_bbuf_itf.full;
      assign c_bo_scclang_global_1 = u_bbuf_itf.dout;
      assign u_bbuf_itf.rd_en = itf.m_ready;
      assign itf.m_valid = u_bbuf_itf.empty;
      always @(*)
        ;
      always @(c_bo_scclang_global_1) begin : mc_proc
        reg [1023:0] bbufi_mc_proc_local_2;
        reg [1023:0] bbufo_mc_proc_local_3;
        reg signed [31:0] i_mc_proc_local_4;
        reg signed [31:0] i_mc_proc_local_5;
        for (i_mc_proc_local_4 = 0; i_mc_proc_local_4 < 16; i_mc_proc_local_4 = i_mc_proc_local_4 + 1)
          bbufi_mc_proc_local_2[i_mc_proc_local_4 * 64+:64] = itf.s_block[(15 - i_mc_proc_local_4) * 64+:64];
        c_bi_scclang_global_0 <= bbufi_mc_proc_local_2;
        bbufo_mc_proc_local_3 = c_bo_scclang_global_1;
        for (i_mc_proc_local_5 = 0; i_mc_proc_local_5 < 16; i_mc_proc_local_5 = i_mc_proc_local_5 + 1)
          itf.m_block[(15 - i_mc_proc_local_5) * 64+:64] <= bbufo_mc_proc_local_3[i_mc_proc_local_5 * 64+:64];
      end
      genvar _gv_i_u_block_buffer_local_1_1;
      for (_gv_i_u_block_buffer_local_1_1 = 0; _gv_i_u_block_buffer_local_1_1 < 16; _gv_i_u_block_buffer_local_1_1 = _gv_i_u_block_buffer_local_1_1 + 1) begin : genblk1
        localparam i_u_block_buffer_local_1 = _gv_i_u_block_buffer_local_1_1;
        always @(itf.s_block[(15 - i_u_block_buffer_local_1) * 64+:64]) begin : mc_proc
          reg [1023:0] bbufi_mc_proc_local_2;
          reg [1023:0] bbufo_mc_proc_local_3;
          reg signed [31:0] i_mc_proc_local_4;
          reg signed [31:0] i_mc_proc_local_5;
          for (i_mc_proc_local_4 = 0; i_mc_proc_local_4 < 16; i_mc_proc_local_4 = i_mc_proc_local_4 + 1)
            bbufi_mc_proc_local_2[i_mc_proc_local_4 * 64+:64] = itf.s_block[(15 - i_mc_proc_local_4) * 64+:64];
          c_bi_scclang_global_0 <= bbufi_mc_proc_local_2;
          bbufo_mc_proc_local_3 = c_bo_scclang_global_1;
          for (i_mc_proc_local_5 = 0; i_mc_proc_local_5 < 16; i_mc_proc_local_5 = i_mc_proc_local_5 + 1)
            itf.m_block[(15 - i_mc_proc_local_5) * 64+:64] <= bbufo_mc_proc_local_3[i_mc_proc_local_5 * 64+:64];
        end
      end
    end
  endgenerate
  assign itf.clk = clk;
  assign itf.reset = reset;
  assign itf.s_block = s_block;
  assign itf.s_valid = s_valid;
  assign itf.m_ready = m_ready;
  assign s_ready = itf.s_ready;
  assign m_block = itf.m_block;
  assign m_valid = itf.m_valid;
endmodule
module decode_block_sc_module_6 (
  clk,
  reset,
  s_block,
  s_valid,
  m_ready,
  s_ready,
  m_block,
  m_valid
);
  input wire [0:0] clk;
  input wire [0:0] reset;
  input wire [1023:0] s_block;
  input wire [0:0] s_valid;
  input wire [0:0] m_ready;
  output wire [0:0] s_ready;
  output wire signed [1023:0] m_block;
  output wire [0:0] m_valid;
  generate
    if (1) begin : itf
      wire [0:0] clk;
      wire [0:0] reset;
      wire [1023:0] s_block;
      wire [0:0] s_valid;
      wire [0:0] m_ready;
      reg [0:0] s_ready;
      wire signed [1023:0] m_block;
      reg [0:0] m_valid;
    end
    if (1) begin : u_decode
      wire signed [63:0] c_xt_data_scclang_global_0 [0:3][0:3];
      wire [0:0] c_xt_ready_scclang_global_1 [0:3];
      wire [0:0] c_xt_valid_scclang_global_2 [0:3];
      reg signed [63:0] c_yt_data_scclang_global_3 [0:3][0:3];
      wire [0:0] c_yt_ready_scclang_global_4 [0:3];
      wire [0:0] c_yt_valid_scclang_global_5 [0:3];
      reg [0:0] xors_valid_scclang_global_6;
      genvar _gv_decode_block_sc_module_6_u_xt_0_1;
      for (_gv_decode_block_sc_module_6_u_xt_0_1 = 0; _gv_decode_block_sc_module_6_u_xt_0_1 < 4; _gv_decode_block_sc_module_6_u_xt_0_1 = _gv_decode_block_sc_module_6_u_xt_0_1 + 1) begin : u_xt
        localparam decode_block_sc_module_6_u_xt_0 = _gv_decode_block_sc_module_6_u_xt_0_1;
        if (1) begin : itf
          wire [0:0] clk;
          wire [0:0] reset;
          wire signed [63:0] s_port [0:3];
          wire [0:0] s_valid;
          wire [0:0] m_ready;
          reg [0:0] s_ready;
          reg signed [63:0] m_port [0:3];
          reg [0:0] m_valid;
        end
        if (1) begin : mod
          reg [5:0] v_scclang_global_0;
          reg signed [63:0] w_scclang_global_1 [0:5];
          reg signed [63:0] x_scclang_global_2 [0:5];
          reg signed [63:0] y_scclang_global_3 [0:5];
          reg signed [63:0] z_scclang_global_4 [0:5];
          reg signed [31:0] stages_scclang_global_5 = 6;
          always @(u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.m_ready or x_scclang_global_2[5] or y_scclang_global_3[5] or z_scclang_global_4[5] or w_scclang_global_1[5] or v_scclang_global_0) begin : mc_proc
            u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.s_ready <= u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.m_ready;
            u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.m_port[0] <= x_scclang_global_2[5];
            u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.m_port[1] <= y_scclang_global_3[5];
            u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.m_port[2] <= z_scclang_global_4[5];
            u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.m_port[3] <= w_scclang_global_1[5];
            u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.m_valid <= v_scclang_global_0[5];
          end
          always @(posedge u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.clk) begin : ms_proc
            reg signed [31:0] i_ms_proc_local_2;
            if (u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.reset == 0) begin
              for (i_ms_proc_local_2 = 0; i_ms_proc_local_2 < 6; i_ms_proc_local_2 = i_ms_proc_local_2 + 1)
                begin
                  x_scclang_global_2[i_ms_proc_local_2] <= 64'd0;
                  y_scclang_global_3[i_ms_proc_local_2] <= 64'd0;
                  z_scclang_global_4[i_ms_proc_local_2] <= 64'd0;
                  w_scclang_global_1[i_ms_proc_local_2] <= 64'd0;
                end
              v_scclang_global_0 <= 6'd0;
            end
            else if (u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.m_ready) begin
              w_scclang_global_1[0] <= u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.s_port[3];
              x_scclang_global_2[0] <= u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.s_port[0];
              y_scclang_global_3[0] <= u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.s_port[1] + (u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.s_port[3] >>> 1);
              z_scclang_global_4[0] <= u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.s_port[2];
              w_scclang_global_1[1] <= w_scclang_global_1[0] - (y_scclang_global_3[0] >>> 1);
              x_scclang_global_2[1] <= x_scclang_global_2[0];
              y_scclang_global_3[1] <= y_scclang_global_3[0];
              z_scclang_global_4[1] <= z_scclang_global_4[0];
              w_scclang_global_1[2] <= w_scclang_global_1[1];
              x_scclang_global_2[2] <= x_scclang_global_2[1];
              y_scclang_global_3[2] <= y_scclang_global_3[1] + w_scclang_global_1[1];
              z_scclang_global_4[2] <= z_scclang_global_4[1] + x_scclang_global_2[1];
              w_scclang_global_1[3] <= (w_scclang_global_1[2] << 1) - y_scclang_global_3[2];
              x_scclang_global_2[3] <= (x_scclang_global_2[2] << 1) - z_scclang_global_4[2];
              y_scclang_global_3[3] <= y_scclang_global_3[2];
              z_scclang_global_4[3] <= z_scclang_global_4[2];
              w_scclang_global_1[4] <= w_scclang_global_1[3] + x_scclang_global_2[3];
              x_scclang_global_2[4] <= x_scclang_global_2[3];
              y_scclang_global_3[4] <= y_scclang_global_3[3] + z_scclang_global_4[3];
              z_scclang_global_4[4] <= z_scclang_global_4[3];
              w_scclang_global_1[5] <= w_scclang_global_1[4];
              x_scclang_global_2[5] <= (x_scclang_global_2[4] << 1) - w_scclang_global_1[4];
              y_scclang_global_3[5] <= y_scclang_global_3[4];
              z_scclang_global_4[5] <= (z_scclang_global_4[4] << 1) - y_scclang_global_3[4];
              v_scclang_global_0 <= (v_scclang_global_0 << 1) | u_xt[_gv_decode_block_sc_module_6_u_xt_0_1].itf.s_valid;
            end
          end
        end
      end
      genvar _gv_decode_block_sc_module_6_u_yt_0_1;
      for (_gv_decode_block_sc_module_6_u_yt_0_1 = 0; _gv_decode_block_sc_module_6_u_yt_0_1 < 4; _gv_decode_block_sc_module_6_u_yt_0_1 = _gv_decode_block_sc_module_6_u_yt_0_1 + 1) begin : u_yt
        localparam decode_block_sc_module_6_u_yt_0 = _gv_decode_block_sc_module_6_u_yt_0_1;
        if (1) begin : itf
          wire [0:0] clk;
          wire [0:0] reset;
          wire signed [63:0] s_port [0:3];
          wire [0:0] s_valid;
          wire [0:0] m_ready;
          reg [0:0] s_ready;
          reg signed [63:0] m_port [0:3];
          reg [0:0] m_valid;
        end
        if (1) begin : mod
          reg [5:0] v_scclang_global_0;
          reg signed [63:0] w_scclang_global_1 [0:5];
          reg signed [63:0] x_scclang_global_2 [0:5];
          reg signed [63:0] y_scclang_global_3 [0:5];
          reg signed [63:0] z_scclang_global_4 [0:5];
          reg signed [31:0] stages_scclang_global_5 = 6;
          always @(u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.m_ready or x_scclang_global_2[5] or y_scclang_global_3[5] or z_scclang_global_4[5] or w_scclang_global_1[5] or v_scclang_global_0) begin : mc_proc
            u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.s_ready <= u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.m_ready;
            u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.m_port[0] <= x_scclang_global_2[5];
            u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.m_port[1] <= y_scclang_global_3[5];
            u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.m_port[2] <= z_scclang_global_4[5];
            u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.m_port[3] <= w_scclang_global_1[5];
            u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.m_valid <= v_scclang_global_0[5];
          end
          always @(posedge u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.clk) begin : ms_proc
            reg signed [31:0] i_ms_proc_local_2;
            if (u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.reset == 0) begin
              for (i_ms_proc_local_2 = 0; i_ms_proc_local_2 < 6; i_ms_proc_local_2 = i_ms_proc_local_2 + 1)
                begin
                  x_scclang_global_2[i_ms_proc_local_2] <= 64'd0;
                  y_scclang_global_3[i_ms_proc_local_2] <= 64'd0;
                  z_scclang_global_4[i_ms_proc_local_2] <= 64'd0;
                  w_scclang_global_1[i_ms_proc_local_2] <= 64'd0;
                end
              v_scclang_global_0 <= 6'd0;
            end
            else if (u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.m_ready) begin
              w_scclang_global_1[0] <= u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.s_port[3];
              x_scclang_global_2[0] <= u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.s_port[0];
              y_scclang_global_3[0] <= u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.s_port[1] + (u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.s_port[3] >>> 1);
              z_scclang_global_4[0] <= u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.s_port[2];
              w_scclang_global_1[1] <= w_scclang_global_1[0] - (y_scclang_global_3[0] >>> 1);
              x_scclang_global_2[1] <= x_scclang_global_2[0];
              y_scclang_global_3[1] <= y_scclang_global_3[0];
              z_scclang_global_4[1] <= z_scclang_global_4[0];
              w_scclang_global_1[2] <= w_scclang_global_1[1];
              x_scclang_global_2[2] <= x_scclang_global_2[1];
              y_scclang_global_3[2] <= y_scclang_global_3[1] + w_scclang_global_1[1];
              z_scclang_global_4[2] <= z_scclang_global_4[1] + x_scclang_global_2[1];
              w_scclang_global_1[3] <= (w_scclang_global_1[2] << 1) - y_scclang_global_3[2];
              x_scclang_global_2[3] <= (x_scclang_global_2[2] << 1) - z_scclang_global_4[2];
              y_scclang_global_3[3] <= y_scclang_global_3[2];
              z_scclang_global_4[3] <= z_scclang_global_4[2];
              w_scclang_global_1[4] <= w_scclang_global_1[3] + x_scclang_global_2[3];
              x_scclang_global_2[4] <= x_scclang_global_2[3];
              y_scclang_global_3[4] <= y_scclang_global_3[3] + z_scclang_global_4[3];
              z_scclang_global_4[4] <= z_scclang_global_4[3];
              w_scclang_global_1[5] <= w_scclang_global_1[4];
              x_scclang_global_2[5] <= (x_scclang_global_2[4] << 1) - w_scclang_global_1[4];
              y_scclang_global_3[5] <= y_scclang_global_3[4];
              z_scclang_global_4[5] <= (z_scclang_global_4[4] << 1) - y_scclang_global_3[4];
              v_scclang_global_0 <= (v_scclang_global_0 << 1) | u_yt[_gv_decode_block_sc_module_6_u_yt_0_1].itf.s_valid;
            end
          end
        end
      end
      always @(itf.m_ready or c_xt_valid_scclang_global_2[0]) begin : mc_proc
        itf.s_ready <= itf.m_ready;
        itf.m_valid <= c_xt_valid_scclang_global_2[0];
      end
      always @(posedge itf.clk) begin : ms_rev_order
        if (itf.reset == 0)
          xors_valid_scclang_global_6 <= 0;
        else if (itf.m_ready) begin
          c_yt_data_scclang_global_3[0][0] <= (itf.s_block[960+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[0][1] <= (itf.s_block[896+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[1][0] <= (itf.s_block[832+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[1][1] <= (itf.s_block[768+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[0][2] <= (itf.s_block[704+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[2][0] <= (itf.s_block[640+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[1][2] <= (itf.s_block[576+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[2][1] <= (itf.s_block[512+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[0][3] <= (itf.s_block[448+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[3][0] <= (itf.s_block[384+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[2][2] <= (itf.s_block[320+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[1][3] <= (itf.s_block[256+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[3][1] <= (itf.s_block[192+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[2][3] <= (itf.s_block[128+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[3][2] <= (itf.s_block[64+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          c_yt_data_scclang_global_3[3][3] <= (itf.s_block[0+:64] ^ -64'd6148914691236517206) + 64'd6148914691236517206;
          xors_valid_scclang_global_6 <= itf.s_valid;
        end
      end
      genvar _gv_i_u_decode_block_local_1_1;
      genvar _gv_j_u_decode_block_local_0_1;
      for (_gv_j_u_decode_block_local_0_1 = 0; _gv_j_u_decode_block_local_0_1 < 4; _gv_j_u_decode_block_local_0_1 = _gv_j_u_decode_block_local_0_1 + 1) begin : genblk3
        localparam j_u_decode_block_local_0 = _gv_j_u_decode_block_local_0_1;
        assign u_xt[j_u_decode_block_local_0].itf.clk = itf.clk;
        assign u_xt[j_u_decode_block_local_0].itf.reset = itf.reset;
        assign u_xt[j_u_decode_block_local_0].itf.s_valid = c_yt_valid_scclang_global_5[0];
        assign c_xt_ready_scclang_global_1[j_u_decode_block_local_0] = u_xt[j_u_decode_block_local_0].itf.s_ready;
        assign c_xt_valid_scclang_global_2[j_u_decode_block_local_0] = u_xt[j_u_decode_block_local_0].itf.m_valid;
        assign u_xt[j_u_decode_block_local_0].itf.m_ready = itf.m_ready;
        assign u_yt[j_u_decode_block_local_0].itf.clk = itf.clk;
        assign u_yt[j_u_decode_block_local_0].itf.reset = itf.reset;
        assign u_yt[j_u_decode_block_local_0].itf.s_valid = xors_valid_scclang_global_6;
        assign c_yt_ready_scclang_global_4[j_u_decode_block_local_0] = u_yt[j_u_decode_block_local_0].itf.s_ready;
        assign c_yt_valid_scclang_global_5[j_u_decode_block_local_0] = u_yt[j_u_decode_block_local_0].itf.m_valid;
        assign u_yt[j_u_decode_block_local_0].itf.m_ready = itf.m_ready;
        for (_gv_i_u_decode_block_local_1_1 = 0; _gv_i_u_decode_block_local_1_1 < 4; _gv_i_u_decode_block_local_1_1 = _gv_i_u_decode_block_local_1_1 + 1) begin : genblk1
          localparam i_u_decode_block_local_1 = _gv_i_u_decode_block_local_1_1;
          assign u_xt[j_u_decode_block_local_0].itf.s_port[i_u_decode_block_local_1] = c_xt_data_scclang_global_0[j_u_decode_block_local_0][i_u_decode_block_local_1];
          assign itf.m_block[(15 - ((j_u_decode_block_local_0 * 4) + i_u_decode_block_local_1)) * 64+:64] = u_xt[j_u_decode_block_local_0].itf.m_port[i_u_decode_block_local_1];
          assign u_yt[j_u_decode_block_local_0].itf.s_port[i_u_decode_block_local_1] = c_yt_data_scclang_global_3[i_u_decode_block_local_1][j_u_decode_block_local_0];
          assign c_xt_data_scclang_global_0[i_u_decode_block_local_1][j_u_decode_block_local_0] = u_yt[j_u_decode_block_local_0].itf.m_port[i_u_decode_block_local_1];
        end
      end
    end
  endgenerate
  assign itf.clk = clk;
  assign itf.reset = reset;
  assign itf.s_block = s_block;
  assign itf.s_valid = s_valid;
  assign itf.m_ready = m_ready;
  assign s_ready = itf.s_ready;
  assign m_block = itf.m_block;
  assign m_valid = itf.m_valid;
endmodule
module block_buffer_sc_module_7 (
  clk,
  reset,
  s_block,
  s_valid,
  m_ready,
  s_ready,
  m_block,
  m_valid
);
  input wire [0:0] clk;
  input wire [0:0] reset;
  input wire signed [1023:0] s_block;
  input wire [0:0] s_valid;
  input wire [0:0] m_ready;
  output wire [0:0] s_ready;
  output wire signed [1023:0] m_block;
  output wire [0:0] m_valid;
  generate
    if (1) begin : itf
      wire [0:0] clk;
      wire [0:0] reset;
      wire signed [1023:0] s_block;
      wire [0:0] s_valid;
      wire [0:0] m_ready;
      wire [0:0] s_ready;
      reg signed [1023:0] m_block;
      wire [0:0] m_valid;
    end
    if (1) begin : u_block_buffer
      reg [1023:0] c_bi_scclang_global_0;
      wire [1023:0] c_bo_scclang_global_1;
      if (1) begin : u_bbuf_itf
        wire [0:0] clk;
        wire [0:0] reset;
        wire [1023:0] din;
        wire [0:0] wr_en;
        wire [0:0] rd_en;
        reg [0:0] full;
        reg [1023:0] dout;
        reg [0:0] empty;
      end
      if (1) begin : u_bbuf
        reg [1023:0] data_scclang_global_0 [0:1];
        reg [0:0] empty_i_scclang_global_1;
        reg [0:0] full_i_scclang_global_2;
        reg [0:0] rd_en_i_scclang_global_3;
        reg [0:0] rd_idx_scclang_global_4;
        reg [0:0] wr_en_i_scclang_global_5;
        reg [0:0] wr_idx_scclang_global_6;
        wire [31:0] depth_scclang_global_7;
        reg signed [31:0] MAX_DEPTH_scclang_global_8 = 2;
        always @(u_bbuf_itf.wr_en or u_bbuf_itf.rd_en or full_i_scclang_global_2 or empty_i_scclang_global_1 or rd_idx_scclang_global_4) begin : mc_proc
          u_bbuf_itf.dout <= data_scclang_global_0[rd_idx_scclang_global_4];
          wr_en_i_scclang_global_5 <= u_bbuf_itf.wr_en && !full_i_scclang_global_2;
          rd_en_i_scclang_global_3 <= u_bbuf_itf.rd_en && !empty_i_scclang_global_1;
          u_bbuf_itf.full <= full_i_scclang_global_2 == 0;
          u_bbuf_itf.empty <= empty_i_scclang_global_1 == 0;
        end
        always @(posedge u_bbuf_itf.clk) begin : ms_proc
          reg [0:0] wr_inc_ms_proc_local_3;
          reg [0:0] rd_inc_ms_proc_local_4;
          reg [31:0] i_ms_proc_local_5;
          wr_inc_ms_proc_local_3 = (wr_idx_scclang_global_6 + 1) % 2;
          rd_inc_ms_proc_local_4 = (rd_idx_scclang_global_4 + 1) % 2;
          if (u_bbuf_itf.reset == 0) begin
            for (i_ms_proc_local_5 = 0; i_ms_proc_local_5 < 2; i_ms_proc_local_5 = i_ms_proc_local_5 + 1)
              data_scclang_global_0[i_ms_proc_local_5] <= 0;
            rd_idx_scclang_global_4 <= 1'd0;
            wr_idx_scclang_global_6 <= 1'd0;
            full_i_scclang_global_2 <= 0;
            empty_i_scclang_global_1 <= 1;
          end
          else begin
            if (wr_en_i_scclang_global_5) begin
              data_scclang_global_0[wr_idx_scclang_global_6] <= u_bbuf_itf.din;
              wr_idx_scclang_global_6 <= wr_inc_ms_proc_local_3;
              if (!rd_en_i_scclang_global_3) begin
                if (wr_inc_ms_proc_local_3 == rd_idx_scclang_global_4)
                  full_i_scclang_global_2 <= 1;
                empty_i_scclang_global_1 <= 0;
              end
            end
            if (rd_en_i_scclang_global_3) begin
              rd_idx_scclang_global_4 <= rd_inc_ms_proc_local_4;
              if (!wr_en_i_scclang_global_5) begin
                full_i_scclang_global_2 <= 0;
                if (rd_inc_ms_proc_local_4 == wr_idx_scclang_global_6)
                  empty_i_scclang_global_1 <= 1;
              end
            end
          end
        end
        genvar _gv_i_u_bbuf_local_1_2;
        for (_gv_i_u_bbuf_local_1_2 = 0; _gv_i_u_bbuf_local_1_2 < 2; _gv_i_u_bbuf_local_1_2 = _gv_i_u_bbuf_local_1_2 + 1) begin : genblk1
          localparam i_u_bbuf_local_1 = _gv_i_u_bbuf_local_1_2;
          always @(data_scclang_global_0[i_u_bbuf_local_1]) begin : mc_proc
            u_bbuf_itf.dout <= data_scclang_global_0[rd_idx_scclang_global_4];
            wr_en_i_scclang_global_5 <= u_bbuf_itf.wr_en && !full_i_scclang_global_2;
            rd_en_i_scclang_global_3 <= u_bbuf_itf.rd_en && !empty_i_scclang_global_1;
            u_bbuf_itf.full <= full_i_scclang_global_2 == 0;
            u_bbuf_itf.empty <= empty_i_scclang_global_1 == 0;
          end
        end
      end
      assign u_bbuf_itf.clk = itf.clk;
      assign u_bbuf_itf.reset = itf.reset;
      assign u_bbuf_itf.din = c_bi_scclang_global_0;
      assign u_bbuf_itf.wr_en = itf.s_valid;
      assign itf.s_ready = u_bbuf_itf.full;
      assign c_bo_scclang_global_1 = u_bbuf_itf.dout;
      assign u_bbuf_itf.rd_en = itf.m_ready;
      assign itf.m_valid = u_bbuf_itf.empty;
      always @(*)
        ;
      always @(c_bo_scclang_global_1) begin : mc_proc
        reg [1023:0] bbufi_mc_proc_local_2;
        reg [1023:0] bbufo_mc_proc_local_3;
        reg signed [31:0] i_mc_proc_local_4;
        reg signed [31:0] i_mc_proc_local_5;
        for (i_mc_proc_local_4 = 0; i_mc_proc_local_4 < 16; i_mc_proc_local_4 = i_mc_proc_local_4 + 1)
          bbufi_mc_proc_local_2[i_mc_proc_local_4 * 64+:64] = itf.s_block[(15 - i_mc_proc_local_4) * 64+:64];
        c_bi_scclang_global_0 <= bbufi_mc_proc_local_2;
        bbufo_mc_proc_local_3 = c_bo_scclang_global_1;
        for (i_mc_proc_local_5 = 0; i_mc_proc_local_5 < 16; i_mc_proc_local_5 = i_mc_proc_local_5 + 1)
          itf.m_block[(15 - i_mc_proc_local_5) * 64+:64] <= bbufo_mc_proc_local_3[i_mc_proc_local_5 * 64+:64];
      end
      genvar _gv_i_u_cast_buffer_local_1_1;
      for (_gv_i_u_cast_buffer_local_1_1 = 0; _gv_i_u_cast_buffer_local_1_1 < 16; _gv_i_u_cast_buffer_local_1_1 = _gv_i_u_cast_buffer_local_1_1 + 1) begin : genblk1
        localparam i_u_cast_buffer_local_1 = _gv_i_u_cast_buffer_local_1_1;
        always @(itf.s_block[(15 - i_u_cast_buffer_local_1) * 64+:64]) begin : mc_proc
          reg [1023:0] bbufi_mc_proc_local_2;
          reg [1023:0] bbufo_mc_proc_local_3;
          reg signed [31:0] i_mc_proc_local_4;
          reg signed [31:0] i_mc_proc_local_5;
          for (i_mc_proc_local_4 = 0; i_mc_proc_local_4 < 16; i_mc_proc_local_4 = i_mc_proc_local_4 + 1)
            bbufi_mc_proc_local_2[i_mc_proc_local_4 * 64+:64] = itf.s_block[(15 - i_mc_proc_local_4) * 64+:64];
          c_bi_scclang_global_0 <= bbufi_mc_proc_local_2;
          bbufo_mc_proc_local_3 = c_bo_scclang_global_1;
          for (i_mc_proc_local_5 = 0; i_mc_proc_local_5 < 16; i_mc_proc_local_5 = i_mc_proc_local_5 + 1)
            itf.m_block[(15 - i_mc_proc_local_5) * 64+:64] <= bbufo_mc_proc_local_3[i_mc_proc_local_5 * 64+:64];
        end
      end
    end
  endgenerate
  assign itf.clk = clk;
  assign itf.reset = reset;
  assign itf.s_block = s_block;
  assign itf.s_valid = s_valid;
  assign itf.m_ready = m_ready;
  assign s_ready = itf.s_ready;
  assign m_block = itf.m_block;
  assign m_valid = itf.m_valid;
endmodule
module inv_cast_sc_module_8 (
  clk,
  reset,
  s_block,
  s_valid,
  s_bhdr_data_zb,
  s_bhdr_data_exp,
  s_bhdr_valid,
  s_bhdr_ready,
  s_ready,
  m_stream_data_frac,
  m_stream_data_expo,
  m_stream_data_sign,
  m_stream_valid,
  m_stream_ready
);
  input wire [0:0] clk;
  input wire [0:0] reset;
  input wire signed [1023:0] s_block;
  input wire [0:0] s_valid;
  input wire [0:0] s_bhdr_data_zb;
  input wire [10:0] s_bhdr_data_exp;
  input wire [0:0] s_bhdr_valid;
  output wire [0:0] s_bhdr_ready;
  output wire [0:0] s_ready;
  output wire [51:0] m_stream_data_frac;
  output wire [10:0] m_stream_data_expo;
  output wire [0:0] m_stream_data_sign;
  output wire [0:0] m_stream_valid;
  input wire [0:0] m_stream_ready;
  generate
    if (1) begin : itf
      wire [0:0] clk;
      wire [0:0] reset;
      wire signed [1023:0] s_block;
      wire [0:0] s_valid;
      wire [0:0] s_bhdr_data_zb;
      wire [10:0] s_bhdr_data_exp;
      wire [0:0] s_bhdr_valid;
      reg [0:0] s_bhdr_ready;
      reg [0:0] s_ready;
      reg [51:0] m_stream_data_frac;
      reg [10:0] m_stream_data_expo;
      reg [0:0] m_stream_data_sign;
      reg [0:0] m_stream_valid;
      wire [0:0] m_stream_ready;
    end
    if (1) begin : u_inv_cast
      reg [0:0] c_sync_scclang_global_0;
      reg [3:0] count_scclang_global_1;
      reg [0:0] got_bhdr_scclang_global_2;
      reg [0:0] got_blk_scclang_global_3;
      reg signed [63:0] r_blk_scclang_global_4 [0:15];
      reg [10:0] r_ex_scclang_global_5;
      reg [0:0] zb_scclang_global_6;
      reg [63:0] ui_actual_scclang_global_7;
      always @(itf.s_valid or itf.s_bhdr_valid or got_blk_scclang_global_3 or got_bhdr_scclang_global_2 or itf.m_stream_ready or count_scclang_global_1 or c_sync_scclang_global_0) begin : mc_proc
        reg [51:0] fp_mc_proc_local_2_frac;
        reg [10:0] fp_mc_proc_local_2_expo;
        reg [0:0] fp_mc_proc_local_2_sign;
        reg [0:0] s_mc_proc_local_3;
        reg [10:0] _r_ex_mc_proc_local_4;
        reg [0:0] stall_mc_proc_local_5;
        reg signed [63:0] si_mc_proc_local_6;
        reg [63:0] neg_mask_mc_proc_local_7;
        reg [0:0] zero_output_mc_proc_local_8;
        reg [63:0] rn_mc_proc_local_9;
        reg [10:0] e_mc_proc_local_10;
        reg [63:0] i_mc_proc_local_11;
        reg signed [31:0] shift_mc_proc_local_12;
        reg [51:0] fp_mc_proc_local_2_frac__ref_0;
        reg [0:0] fp_mc_proc_local_2_sign__ref_0;
        reg [10:0] fp_mc_proc_local_2_expo__ref_0;
        fp_mc_proc_local_2_expo__ref_0 = fp_mc_proc_local_2_expo;
        fp_mc_proc_local_2_sign__ref_0 = fp_mc_proc_local_2_sign;
        fp_mc_proc_local_2_frac__ref_0 = fp_mc_proc_local_2_frac;
        ui_actual_scclang_global_7 = 0;
        s_mc_proc_local_3 = 1'd0;
        _r_ex_mc_proc_local_4 = 11'd0;
        stall_mc_proc_local_5 = ((itf.m_stream_ready == 0) || ((count_scclang_global_1 == 0) && !got_bhdr_scclang_global_2)) || ((count_scclang_global_1 == 0) && (got_bhdr_scclang_global_2 && !got_blk_scclang_global_3));
        c_sync_scclang_global_0 <= !stall_mc_proc_local_5;
        itf.m_stream_valid <= !stall_mc_proc_local_5;
        si_mc_proc_local_6 = r_blk_scclang_global_4[count_scclang_global_1];
        neg_mask_mc_proc_local_7 = 65'sd9223372036854775808;
        if (si_mc_proc_local_6 & neg_mask_mc_proc_local_7) begin
          si_mc_proc_local_6 = -si_mc_proc_local_6;
          s_mc_proc_local_3 = 1;
        end
        zero_output_mc_proc_local_8 = (si_mc_proc_local_6 == 0) || zb_scclang_global_6;
        if (zero_output_mc_proc_local_8) begin
          fp_mc_proc_local_2_frac__ref_0 = 0;
          fp_mc_proc_local_2_expo__ref_0 = 0;
          fp_mc_proc_local_2_sign__ref_0 = 0;
        end
        else begin
          rn_mc_proc_local_9 = si_mc_proc_local_6;
          e_mc_proc_local_10 = 11'd0;
          for (i_mc_proc_local_11 = 64'd0; i_mc_proc_local_11 < 64; i_mc_proc_local_11 = i_mc_proc_local_11 + 1)
            e_mc_proc_local_10 = e_mc_proc_local_10 + ((rn_mc_proc_local_9 >>> (e_mc_proc_local_10 + 1)) > 0);
          shift_mc_proc_local_12 = 52 - e_mc_proc_local_10;
          if (shift_mc_proc_local_12 > 0)
            rn_mc_proc_local_9 = rn_mc_proc_local_9 << +shift_mc_proc_local_12;
          else
            rn_mc_proc_local_9 = rn_mc_proc_local_9 >>> -shift_mc_proc_local_12;
          e_mc_proc_local_10 = e_mc_proc_local_10 + (r_ex_scclang_global_5 - 62);
          if (e_mc_proc_local_10 <= 0) begin
            rn_mc_proc_local_9 = rn_mc_proc_local_9 >>> (1 - e_mc_proc_local_10);
            e_mc_proc_local_10 = 0;
          end
          else
            rn_mc_proc_local_9 = rn_mc_proc_local_9 & (54'sd4503599627370496 - 1);
          rn_mc_proc_local_9 = rn_mc_proc_local_9 + (((s_mc_proc_local_3 << 11) + e_mc_proc_local_10) << 52);
          {{fp_mc_proc_local_2_sign__ref_0, fp_mc_proc_local_2_expo__ref_0}, fp_mc_proc_local_2_frac__ref_0} = rn_mc_proc_local_9;
        end
        itf.m_stream_data_frac <= fp_mc_proc_local_2_frac__ref_0;
        itf.m_stream_data_expo <= fp_mc_proc_local_2_expo__ref_0;
        itf.m_stream_data_sign <= fp_mc_proc_local_2_sign__ref_0;
        fp_mc_proc_local_2_frac = fp_mc_proc_local_2_frac__ref_0;
        fp_mc_proc_local_2_sign = fp_mc_proc_local_2_sign__ref_0;
        fp_mc_proc_local_2_expo = fp_mc_proc_local_2_expo__ref_0;
      end
      always @(posedge itf.clk) begin : ms_proc
        reg [0:0] _zb_ms_proc_local_13;
        reg [0:0] _got_bhdr_ms_proc_local_14;
        reg [31:0] i_ms_proc_local_15;
        reg [31:0] i_ms_proc_local_16;
        if (itf.reset == 0) begin
          count_scclang_global_1 <= 4'd0;
          itf.s_bhdr_ready <= 0;
          itf.s_ready <= 0;
          got_bhdr_scclang_global_2 <= 0;
          got_blk_scclang_global_3 <= 0;
        end
        else begin
          _zb_ms_proc_local_13 = 0;
          _got_bhdr_ms_proc_local_14 = 0;
          if (((count_scclang_global_1 == 0) && itf.s_bhdr_valid) && (got_bhdr_scclang_global_2 == 0)) begin
            _got_bhdr_ms_proc_local_14 = 1;
            got_bhdr_scclang_global_2 <= _got_bhdr_ms_proc_local_14;
            _zb_ms_proc_local_13 = itf.s_bhdr_data_zb;
            zb_scclang_global_6 <= _zb_ms_proc_local_13;
            r_ex_scclang_global_5 <= itf.s_bhdr_data_exp;
            if (_zb_ms_proc_local_13) begin
              for (i_ms_proc_local_15 = 0; i_ms_proc_local_15 < 16; i_ms_proc_local_15 = i_ms_proc_local_15 + 1)
                r_blk_scclang_global_4[i_ms_proc_local_15] <= 64'd0;
              got_blk_scclang_global_3 <= 1;
            end
            itf.s_bhdr_ready <= 1;
          end
          if (got_bhdr_scclang_global_2 == 1)
            itf.s_bhdr_ready <= 0;
          if ((count_scclang_global_1 == 0) && ((_got_bhdr_ms_proc_local_14 && !_zb_ms_proc_local_13) || (got_bhdr_scclang_global_2 && !zb_scclang_global_6))) begin
            if (itf.s_valid) begin
              got_blk_scclang_global_3 <= 1;
              for (i_ms_proc_local_16 = 0; i_ms_proc_local_16 < 16; i_ms_proc_local_16 = i_ms_proc_local_16 + 1)
                r_blk_scclang_global_4[i_ms_proc_local_16] <= itf.s_block[(15 - i_ms_proc_local_16) * 64+:64];
              itf.s_ready <= 1;
            end
          end
          if (got_blk_scclang_global_3)
            itf.s_ready <= 0;
          if (count_scclang_global_1 != 0) begin
            got_bhdr_scclang_global_2 <= 0;
            got_blk_scclang_global_3 <= 0;
          end
          if (c_sync_scclang_global_0) begin
            if (count_scclang_global_1 == 15)
              count_scclang_global_1 <= 4'd0;
            else
              count_scclang_global_1 <= count_scclang_global_1 + 1;
          end
        end
      end
    end
  endgenerate
  assign itf.clk = clk;
  assign itf.reset = reset;
  assign itf.s_block = s_block;
  assign itf.s_valid = s_valid;
  assign itf.s_bhdr_data_zb = s_bhdr_data_zb;
  assign itf.s_bhdr_data_exp = s_bhdr_data_exp;
  assign itf.s_bhdr_valid = s_bhdr_valid;
  assign s_bhdr_ready = itf.s_bhdr_ready;
  assign s_ready = itf.s_ready;
  assign m_stream_data_frac = itf.m_stream_data_frac;
  assign m_stream_data_expo = itf.m_stream_data_expo;
  assign m_stream_data_sign = itf.m_stream_data_sign;
  assign m_stream_valid = itf.m_stream_valid;
  assign itf.m_stream_ready = m_stream_ready;
endmodule
