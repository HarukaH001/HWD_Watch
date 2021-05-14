/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *STD_STANDARD;
char *IEEE_P_2592010699;
char *IEEE_P_1242562249;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_a_1013071132_3212880686_init();
    work_a_2204167630_3212880686_init();
    work_a_3884552535_3212880686_init();
    work_a_4020003922_3212880686_init();
    work_a_0791455480_3212880686_init();
    ieee_p_1242562249_init();
    work_a_3236426119_3212880686_init();
    work_a_3405603648_3212880686_init();
    work_a_2760285262_3212880686_init();
    work_a_0106818411_3212880686_init();
    work_a_2292039125_3212880686_init();
    work_a_3821434563_3212880686_init();
    work_a_1306858229_3212880686_init();
    work_a_0287768360_3212880686_init();
    work_a_0846123803_3212880686_init();
    work_a_1767528624_3212880686_init();
    work_a_3106259048_3212880686_init();
    work_a_2179961587_3212880686_init();
    work_a_1078057753_3212880686_init();
    work_a_0884763542_3212880686_init();
    work_a_3328048123_3212880686_init();
    work_a_1645819427_3212880686_init();
    work_a_0286164271_3212880686_init();


    xsi_register_tops("work_a_0286164271_3212880686");

    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");

    return xsi_run_simulation(argc, argv);

}
