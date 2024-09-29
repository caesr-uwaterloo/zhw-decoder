import siliconcompiler

def main():
    leModule = "encode_sc_module_1"
    input_file = "z3test_hdl.v"
    #target_lib = "asap7_demo"
    target_lib = "freepdk45_demo"
    #target_lib = "sky130_demo"

    chip = siliconcompiler.Chip( leModule )
    chip.input( input_file )
    chip.set( 'option', 'frontend', 'verilog' )
    chip.load_target( target_lib )
    #chip.clock( 'clk', period=3.3 )
    chip.clock( 'clk', period=10 )
    chip.set( 'option', 'remote', False )
    
    # 252MHz 
    #chip.set( 'constraint', 'outline', [ (0,0), (400, 300)] )
    #chip.set( 'constraint', 'corearea', [ (10,10), (390, 290) ] )
    
    # 
    #chip.set( 'constraint', 'outline', [ (0,0), (250, 200)] )
    #chip.set( 'constraint', 'corearea', [ (10,10), (240, 190) ] )

    #
    ## no area constraint
    
    # 268 MHz
    #chip.set( 'constraint', 'outline', [ (0,0), (200, 150)] )
    #chip.set( 'constraint', 'corearea', [ (10,10), (190, 140) ] )

    chip.run()
    chip.summary()
    chip.show()
    
    return 0



if __name__ == '__main__':
    main()
    
