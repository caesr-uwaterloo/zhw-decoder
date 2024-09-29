import siliconcompiler

def main():
    leModule = "decoder"
    #leModule = "decode_ints_sc_module_4"
    input_file = "z7test_hdl_new.v"
    target_lib = "asap7_demo"
    #target_lib = "freepdk45_demo"
    #target_lib = "sky130_demo"

    chip = siliconcompiler.Chip( leModule )
    chip.input( input_file )
    chip.set( 'option', 'frontend', 'verilog' )
    chip.load_target( target_lib )
    chip.clock( 'clk', period=100 )
    chip.set( 'option', 'remote', False )

    # for sky130, the core area was set to 100.28 201.28 2300.0 1797.92
    
    # 36.876 MHz
    #chip.set( 'constraint', 'outline', [ (0,0), (400, 300)] )
    #chip.set( 'constraint', 'corearea', [ (10,10), (390, 290) ] )
    
    # 36.7 MHz
    #chip.set( 'constraint', 'outline', [ (0,0), (250, 200)] )
    #chip.set( 'constraint', 'corearea', [ (10,10), (240, 190) ] )

    # 36.47 MHz
    ## no area constraint
    
    # 
    #chip.set( 'constraint', 'outline', [ (0,0), (200, 180)] )
    #chip.set( 'constraint', 'corearea', [ (10,10), (190, 170) ] )

    chip.run()
    chip.summary()
    chip.show()
    
    return 0



if __name__ == '__main__':
    main()
    
