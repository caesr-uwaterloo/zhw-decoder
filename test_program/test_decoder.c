#include <stdio.h>
#include <riscv-pk/encoding.h>
#include "marchid.h"
#include <stdint.h>

#define NUM_DWORDS_PER_BLOCK (16)

#define MAX_NUM_BLOCKS (0x100)

#define NUM_64_BIT_VALS ( NUM_DWORDS_PER_BLOCK * MAX_NUM_BLOCKS )
//#define NUM_64_BIT_VALS (32)
//#define NUM_64_BIT_VALS (16)

#define OUTPUT_SIZE_PER_BLOCK ( 0x100 / 0x10 )

#define OUTPUT_ARRAY_LENGTH (OUTPUT_SIZE_PER_BLOCK * MAX_NUM_BLOCKS)

volatile int * read_addr = (int*) (0x88000000L);

#define REGS_START_ADDR (0xa000000L)

volatile uint16_t * maxbits         = (uint16_t*) ( REGS_START_ADDR + 0x00 );
volatile uint16_t * minbits         = (uint16_t*) ( REGS_START_ADDR + 0x02 );
volatile uint16_t * maxprec         = (uint16_t*) ( REGS_START_ADDR + 0x04 );
volatile uint16_t * minexp          = (uint16_t*) ( REGS_START_ADDR + 0x06 );

volatile uint64_t * read_address    = (uint64_t*) ( REGS_START_ADDR + 0x08 );
volatile uint64_t * write_address   = (uint64_t*) ( REGS_START_ADDR + 0x10 );
volatile uint32_t * num_dwords_to_read  = (uint32_t*) ( REGS_START_ADDR + 0x18 );

volatile uint16_t * start_reg       = (uint16_t*) ( REGS_START_ADDR + 0x1c );
volatile uint16_t * done_reg        = (uint16_t*) ( REGS_START_ADDR + 0x1e );
volatile uint64_t * read_this       = (uint64_t*) ( REGS_START_ADDR + 0x20 );

volatile uint64_t * indicator       = (uint64_t*) ( REGS_START_ADDR + 0x28 );
volatile uint64_t * indicator2      = (uint64_t*) ( REGS_START_ADDR + 0x30 );

volatile uint32_t * num_dwords_to_write = (uint32_t*) ( REGS_START_ADDR + 0x38 );

volatile uint64_t * timer           = (uint64_t*) ( REGS_START_ADDR + 0x40 );
volatile uint64_t * timer_decoder   = (uint64_t*) ( REGS_START_ADDR + 0x48 );

volatile uint64_t * count_decoder_ticks = (uint64_t*) ( REGS_START_ADDR + 0x50 );
volatile uint64_t * count_rDMA_ticks    = (uint64_t*) ( REGS_START_ADDR + 0x58 );
volatile uint64_t * count_wDMA_ticks    = (uint64_t*) ( REGS_START_ADDR + 0x60 );
volatile uint64_t * count_system_ticks  = (uint64_t*) ( REGS_START_ADDR + 0x68 );

volatile uint64_t * internal_out    = (uint64_t*) ( REGS_START_ADDR + 0x100 );
volatile uint64_t * internal_out2   = (uint64_t*) ( REGS_START_ADDR + 0x300 );
volatile uint64_t * internal_out3   = (uint64_t*) ( REGS_START_ADDR + 0x500 );
volatile uint64_t * internal_out4   = (uint64_t*) ( REGS_START_ADDR + 0x700 );

//#include "test_decoder.h"

#include "tvs.h"

volatile uint64_t __attribute__((aligned(64))) output[OUTPUT_ARRAY_LENGTH];

void print_mem( int values )
{
    printf( "Next %d values are:", values );
    int iter;
    for( iter = 0; iter < values; iter++ )
    {
        if( ( iter & 0xf ) == 0 )
        {
            printf( "\n" );
        }
        printf( "%d ", read_addr[iter] );
    }
    printf( "\n" );
}

void button_test()
{
    printf( "This prints\n" );
    printf( "pointer sizes are %ld\n", sizeof(start_reg) );
    printf( "Addresses we care about are start button = %lx and read this = %lx\n", (uint64_t)start_reg, (uint64_t)read_this );
    *start_reg = 0;
    printf( "There is no failure\n" );
    printf( "Button is pressed initially? %d\n", *start_reg );
    printf( "Dummy reg is initially %ld\n", *read_this );
    *start_reg = 1;
    printf( "Button stays down? %d\n", *start_reg );
    printf( "Dummy reg is now %ld\n", *read_this );
    *start_reg = 1;
    printf( "Button stays down again? %d\n", *start_reg );
    printf( "Dummy reg is now %ld\n", *read_this );
}

void push_button()
{
    *start_reg = 1;
}

void do_standard_tests()
{
    print_mem( 40 );
    button_test();
    push_button();
    print_mem( 40 );
    //printf( "Indicator = %d\n", *indicator );
}

void dump_initial_state()
{
    int iter;
    printf( "Dumping initial state:\n" );
    
    printf( "Indicators:\n" );
    printf( "Indicator = %lx, Indicator2 = %lx\n", *indicator, *indicator2 );
    
    printf( "Internal Array1,2,3,4:\n" );
    for( iter = 0; iter < NUM_64_BIT_VALS; iter++ )
    {
        printf( "%lx    %lx    %lx    %lx\n", internal_out[iter], internal_out2[iter], internal_out3[iter], internal_out4[iter] );
    }
    
    printf( "done = %x\n", *done_reg );
}

void test_decoder( volatile uint64_t * inputArr, uint64_t num_dwords )
{
    //printf( "Doing the real test\n" );
    
    //printf( "Setting read address %lx\n", (uint64_t) inputArr );
    *read_address = (uint64_t) inputArr;
    //printf( "Setting write address %lx\n", (uint64_t) output );
    *write_address = (uint64_t) output;
    //printf( "Setting data size\n" );
    *num_dwords_to_read = num_dwords;
    *num_dwords_to_write = 0x100 * num_dwords / 16;
    
    //printf( "Setting output array to deadbeef...\n" );
    int iter;
    //for( iter = 0; iter < OUTPUT_ARRAY_LENGTH; iter++ )
    //{
    //    output[iter] = 0xdeadbeef;
    //}
    
    //printf( "Setting settings\n" );
    *maxbits = 0x0040;
    *minbits = 0x0040;
    *maxprec = 0x0040;
    *minexp  = 0xfbce;
    
    //printf( "Guaranteeing that done is down\n" );
    *done_reg = 0;
    
    //printf( "Indicators before starting:\n" );
    //printf( "Indicator = %lx, Indicator2 = %lx\n", *indicator, *indicator2 );
    
    //printf( "Starting\n" );
    
    uint64_t start_time = *timer;
    
    asm( "fence" );
    *start_reg = 1;
    
    int see_what_happened_limit = 40;
    int num_passes = 0;
    
    //while( ( *done_reg < 1 ) && ( num_passes < see_what_happened_limit ) )
    //{
    //    printf( "Indicator = %lx, Indicator2 = %lx, num passes = %d\n", *indicator, *indicator2, num_passes++ );
    //}
    
    while( *done_reg < 1 ); // spin wait
    
    uint64_t end_time   = *timer;
    uint64_t end2_time  = *timer;
    
    uint64_t measurement_time   = end2_time - end_time;
    uint64_t elapsed_time       = end_time - start_time - measurement_time;
    printf( "num_dwords = %ld, whole cycles = %ld, decoder cycles = %ld, rDMA cycles = %ld, wDMA cycles = %ld. Cycles at 500 MHz.\n", num_dwords, *count_system_ticks, *count_decoder_ticks, *count_rDMA_ticks, *count_wDMA_ticks );
    
    //printf( "Done was asserted\n" );
    
    //printf( "Indicators after finishing:\n" );
    //printf( "Indicator = %lx, Indicator2 = %lx\n", *indicator, *indicator2 );
    
    //printf( "%ld, ", elapsed_time );
    
    //printf( "Clock ticks elapsed (1 GHz) = %ld\n", elapsed_time );
    
    //for( iter = 0; iter < OUTPUT_ARRAY_LENGTH/4; iter++ )
    //{
    //    printf( "%lx    %lx    %lx    %lx\n", output[4*iter+0], output[4*iter+1], output[4*iter+2], output[4*iter+3] );
    //    
    //    if( output[ 4*iter+3 ] == 0xdeadbeef )
    //    {
    //        printf( "...\n" );
    //        break;
    //    }
    //}
    
    //printf( "Internal Array1,2,3,4:\n" );
    //for( iter = 0; iter < 64; iter++ )
    //{
    //    printf( "%lx    %lx    %lx    %lx\n", internal_out[iter], internal_out2[iter], internal_out3[iter], internal_out4[iter] );
    //}
    
    *done_reg = 0;
    asm( "fence" );
    
    return;
    //return elapsed_time;
}

/*
void test_decoder2()
{
    printf( "Doing the real test\n" );
    
    printf( "Setting read address %lx\n", (uint64_t) input );
    *read_address = (uint64_t) input;
    printf( "Setting write address %lx\n", (uint64_t) output );
    *write_address = (uint64_t) output;
    printf( "Setting data size\n" );
    *num_dwords_to_read = NUM_64_BIT_VALS / 2;
    
    printf( "Setting settings\n" );
    *maxbits = 0x0200;
    *minbits = 0x0200;
    *maxprec = 0x0040;
    *minexp  = 0xfbce;
    
    printf( "Indicators before starting:\n" );
    printf( "Indicator = %lx, Indicator2 = %lx\n", *indicator, *indicator2 );
    
    printf( "Starting\n" );
    *start_reg = 1;
    
    int see_what_happened_limit = 20;
    int num_passes = 0;
    
    //while( *done_reg < 1 )
    //{
    //    printf( "Indicator = %lx, Indicator2 = %lx, num passes = %d\n", *indicator, *indicator2, num_passes++ );
    //}
    //printf( "Done was asserted\n" );
    
    //printf( "Indicators after finishing:\n" );
    //printf( "Indicator = %lx, Indicator2 = %lx\n", *indicator, *indicator2 );
    
    printf( "Setting output array to deadbeef...\n" );
    int iter;
    for( iter = 0; iter < NUM_64_BIT_VALS; iter++ )
    {
        output[iter] = 0xdeadbeef;
        //printf( "%lx\n", output[iter] );
    }
    
    printf( "Starting another transaction.\n" );
    
    while( *start_reg )
    {
        printf( "Waiting for start_reg to go low...\n" );
    }
    
    printf( "Starting the new transfer..." );
    *read_address = (uint64_t) &input[ NUM_64_BIT_VALS/2 ];
    *write_address = (uint64_t) &output[ NUM_64_BIT_VALS/2 ];
    *start_reg = 1;
    
    while( ( *done_reg < 2 ) && ( num_passes < see_what_happened_limit ) )
    {
        printf( "Indicator = %lx, Indicator2 = %lx, num passes = %d, done_reg=%d\n", *indicator, *indicator2, num_passes++, *done_reg );
    }
    printf( "Done was asserted\n" );
    
    printf( "Indicators after finishing:\n" );
    printf( "Indicator = %lx, Indicator2 = %lx\n", *indicator, *indicator2 );
    
    printf( "Result is:\n" );
    for( iter = 0; iter < NUM_64_BIT_VALS; iter++ )
    {
        printf( "%lx\n", output[iter] );
    }
}
*/

int main(void) {
    uint64_t marchid = read_csr(marchid);
    const char* march = get_march(marchid);
    printf("Hello world from core 0, a %s\n", march);

    uint32_t block_iter;
    
    for( block_iter = NUM_DWORDS_PER_BLOCK; block_iter < NUM_64_BIT_VALS; block_iter = block_iter << 1 )
    //for( block_iter = NUM_DWORDS_PER_BLOCK; block_iter < (2*NUM_DWORDS_PER_BLOCK); block_iter = block_iter << 1 )
    {
        if( INPUT_LEN >= block_iter )
        {
            //uint64_t time_elapsed = test_decoder( input, block_iter );
            test_decoder( input, block_iter );
            //printf( "%ld, \n", time_elapsed );
        }
        else
        {
            printf( "No more for block_iter = %ld\n", block_iter );
            //printf( "NA, \n" );
            break;
        }
    }
    
    printf( "done\n" );

    //test_decoder( input );
    
    //test_decoder( input2 );
    
    //test_decoder( input3 );
    
    //test_decoder( input4 );
    
    //test_decoder( input5 );
    
    //test_decoder( input6 );

    //playground();
    return 0;
}
