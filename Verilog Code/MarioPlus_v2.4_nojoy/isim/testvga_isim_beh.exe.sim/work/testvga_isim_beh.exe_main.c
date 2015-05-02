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



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000004251784553_2213597132_init();
    work_m_00000000000376743543_0042511002_init();
    xilinxcorelib_ver_m_00000000001358910285_2806399997_init();
    xilinxcorelib_ver_m_00000000001687936702_3549473565_init();
    xilinxcorelib_ver_m_00000000000277421008_3322971280_init();
    xilinxcorelib_ver_m_00000000001603977570_2369314091_init();
    work_m_00000000002489990758_3645498680_init();
    work_m_00000000001408871605_1079485097_init();
    work_m_00000000003785841549_0126320049_init();
    work_m_00000000002842332963_1087167475_init();
    work_m_00000000003979486454_2682470855_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003979486454_2682470855");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
