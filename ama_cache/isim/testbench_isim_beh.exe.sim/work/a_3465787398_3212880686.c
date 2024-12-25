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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Morteza/Desktop/Projects/ama_cache/ama_ram.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


static void work_a_3465787398_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;

LAB0:    xsi_set_current_line(61, ng0);

LAB3:    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t1 = (t0 + 3600);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 12288U);
    xsi_driver_first_trans_fast(t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3465787398_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3520);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1672U);
    t5 = *((char **)t1);
    t1 = (t0 + 1352U);
    t6 = *((char **)t1);
    t1 = (t0 + 5952U);
    t7 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t6, t1);
    t8 = (t7 - 1023);
    t9 = (t8 * -1);
    xsi_vhdl_check_range_of_index(1023, 0, -1, t7);
    t10 = (12U * t9);
    t11 = (0 + t10);
    t12 = (t5 + t11);
    t13 = (t0 + 3664);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t12, 12U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB3;

}


extern void work_a_3465787398_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3465787398_3212880686_p_0,(void *)work_a_3465787398_3212880686_p_1};
	xsi_register_didat("work_a_3465787398_3212880686", "isim/testbench_isim_beh.exe.sim/work/a_3465787398_3212880686.didat");
	xsi_register_executes(pe);
}
