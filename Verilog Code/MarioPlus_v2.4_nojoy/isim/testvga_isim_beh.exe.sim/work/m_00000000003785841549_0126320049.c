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
static const char *ng0 = "C:/Users/toto/Downloads/PONG-master/TEST/graph.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {3241U, 0U};
static int ng3[] = {320, 0};
static int ng4[] = {640, 0};
static int ng5[] = {480, 0};
static int ng6[] = {448, 0};
static int ng7[] = {352, 0};
static unsigned int ng8[] = {4080U, 0U};



static void Initial_37_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(37, ng0);

LAB2:    xsi_set_current_line(38, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3544);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 12);
    xsi_set_current_line(39, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3704);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 12);

LAB1:    return;
}

static void Always_42_1(char *t0)
{
    char t6[8];
    char t8[8];
    char t15[8];
    char t30[8];
    char t34[8];
    char t66[8];
    char t80[8];
    char t84[8];
    char t92[8];
    char t124[8];
    char t138[8];
    char t142[8];
    char t150[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t31;
    unsigned int t32;
    char *t33;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    int t58;
    int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    char *t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t79;
    char *t81;
    char *t82;
    char *t83;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    char *t91;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    char *t97;
    char *t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    char *t106;
    char *t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    int t116;
    int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    char *t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    char *t131;
    char *t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    char *t136;
    char *t137;
    char *t139;
    char *t140;
    char *t141;
    char *t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    unsigned int t147;
    unsigned int t148;
    char *t149;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    char *t154;
    char *t155;
    char *t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    unsigned int t160;
    unsigned int t161;
    unsigned int t162;
    unsigned int t163;
    char *t164;
    char *t165;
    unsigned int t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    int t174;
    int t175;
    unsigned int t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    char *t182;
    unsigned int t183;
    unsigned int t184;
    unsigned int t185;
    unsigned int t186;
    unsigned int t187;
    char *t188;
    char *t189;

LAB0:    t1 = (t0 + 4872U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 5440);
    *((int *)t2) = 1;
    t3 = (t0 + 4904);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(42, ng0);

LAB5:    xsi_set_current_line(43, ng0);
    t4 = (t0 + 2024U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_minus(t6, 32, t5, 11, t4, 32);
    t7 = (t0 + 3224);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 12);
    xsi_set_current_line(44, ng0);
    t2 = (t0 + 2184U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_minus(t6, 32, t3, 11, t2, 32);
    t4 = (t0 + 3384);
    xsi_vlogvar_assign_value(t4, t6, 0, 0, 12);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 3224);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t7 = (t4 + 4);
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 0);
    *((unsigned int *)t8) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t5) = t12;
    t13 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t13 & 127U);
    t14 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t14 & 127U);
    t16 = (t0 + 3384);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memset(t15, 0, 8);
    t19 = (t15 + 4);
    t20 = (t18 + 4);
    t21 = *((unsigned int *)t18);
    t22 = (t21 >> 0);
    *((unsigned int *)t15) = t22;
    t23 = *((unsigned int *)t20);
    t24 = (t23 >> 0);
    *((unsigned int *)t19) = t24;
    t25 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t25 & 31U);
    t26 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t26 & 31U);
    xsi_vlogtype_concat(t6, 12, 12, 2U, t15, 5, t8, 7);
    t27 = (t0 + 3544);
    xsi_vlogvar_assign_value(t27, t6, 0, 0, 12);
    xsi_set_current_line(46, ng0);
    t2 = (t0 + 2024U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB7;

LAB6:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t3) < *((unsigned int *)t2))
        goto LAB9;

LAB8:    *((unsigned int *)t6) = 1;

LAB9:    memset(t8, 0, 8);
    t16 = (t6 + 4);
    t9 = *((unsigned int *)t16);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB11;

LAB12:    if (*((unsigned int *)t16) != 0)
        goto LAB13;

LAB14:    t18 = (t8 + 4);
    t14 = *((unsigned int *)t8);
    t21 = *((unsigned int *)t18);
    t22 = (t14 || t21);
    if (t22 > 0)
        goto LAB15;

LAB16:    memcpy(t34, t8, 8);

LAB17:    memset(t66, 0, 8);
    t67 = (t34 + 4);
    t68 = *((unsigned int *)t67);
    t69 = (~(t68));
    t70 = *((unsigned int *)t34);
    t71 = (t70 & t69);
    t72 = (t71 & 1U);
    if (t72 != 0)
        goto LAB30;

LAB31:    if (*((unsigned int *)t67) != 0)
        goto LAB32;

LAB33:    t74 = (t66 + 4);
    t75 = *((unsigned int *)t66);
    t76 = *((unsigned int *)t74);
    t77 = (t75 || t76);
    if (t77 > 0)
        goto LAB34;

LAB35:    memcpy(t92, t66, 8);

LAB36:    memset(t124, 0, 8);
    t125 = (t92 + 4);
    t126 = *((unsigned int *)t125);
    t127 = (~(t126));
    t128 = *((unsigned int *)t92);
    t129 = (t128 & t127);
    t130 = (t129 & 1U);
    if (t130 != 0)
        goto LAB49;

LAB50:    if (*((unsigned int *)t125) != 0)
        goto LAB51;

LAB52:    t132 = (t124 + 4);
    t133 = *((unsigned int *)t124);
    t134 = *((unsigned int *)t132);
    t135 = (t133 || t134);
    if (t135 > 0)
        goto LAB53;

LAB54:    memcpy(t150, t124, 8);

LAB55:    t182 = (t150 + 4);
    t183 = *((unsigned int *)t182);
    t184 = (~(t183));
    t185 = *((unsigned int *)t150);
    t186 = (t185 & t184);
    t187 = (t186 != 0);
    if (t187 > 0)
        goto LAB68;

LAB69:    xsi_set_current_line(56, ng0);

LAB138:    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 3064);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 12);

LAB70:    goto LAB2;

LAB7:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB9;

LAB11:    *((unsigned int *)t8) = 1;
    goto LAB14;

LAB13:    t17 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB14;

LAB15:    t19 = (t0 + 2184U);
    t20 = *((char **)t19);
    t19 = ((char*)((ng1)));
    memset(t15, 0, 8);
    t27 = (t20 + 4);
    if (*((unsigned int *)t27) != 0)
        goto LAB19;

LAB18:    t28 = (t19 + 4);
    if (*((unsigned int *)t28) != 0)
        goto LAB19;

LAB22:    if (*((unsigned int *)t20) < *((unsigned int *)t19))
        goto LAB21;

LAB20:    *((unsigned int *)t15) = 1;

LAB21:    memset(t30, 0, 8);
    t31 = (t15 + 4);
    t23 = *((unsigned int *)t31);
    t24 = (~(t23));
    t25 = *((unsigned int *)t15);
    t26 = (t25 & t24);
    t32 = (t26 & 1U);
    if (t32 != 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t31) != 0)
        goto LAB25;

LAB26:    t35 = *((unsigned int *)t8);
    t36 = *((unsigned int *)t30);
    t37 = (t35 & t36);
    *((unsigned int *)t34) = t37;
    t38 = (t8 + 4);
    t39 = (t30 + 4);
    t40 = (t34 + 4);
    t41 = *((unsigned int *)t38);
    t42 = *((unsigned int *)t39);
    t43 = (t41 | t42);
    *((unsigned int *)t40) = t43;
    t44 = *((unsigned int *)t40);
    t45 = (t44 != 0);
    if (t45 == 1)
        goto LAB27;

LAB28:
LAB29:    goto LAB17;

LAB19:    t29 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB21;

LAB23:    *((unsigned int *)t30) = 1;
    goto LAB26;

LAB25:    t33 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t33) = 1;
    goto LAB26;

LAB27:    t46 = *((unsigned int *)t34);
    t47 = *((unsigned int *)t40);
    *((unsigned int *)t34) = (t46 | t47);
    t48 = (t8 + 4);
    t49 = (t30 + 4);
    t50 = *((unsigned int *)t8);
    t51 = (~(t50));
    t52 = *((unsigned int *)t48);
    t53 = (~(t52));
    t54 = *((unsigned int *)t30);
    t55 = (~(t54));
    t56 = *((unsigned int *)t49);
    t57 = (~(t56));
    t58 = (t51 & t53);
    t59 = (t55 & t57);
    t60 = (~(t58));
    t61 = (~(t59));
    t62 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t62 & t60);
    t63 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t63 & t61);
    t64 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t64 & t60);
    t65 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t65 & t61);
    goto LAB29;

LAB30:    *((unsigned int *)t66) = 1;
    goto LAB33;

LAB32:    t73 = (t66 + 4);
    *((unsigned int *)t66) = 1;
    *((unsigned int *)t73) = 1;
    goto LAB33;

LAB34:    t78 = (t0 + 2024U);
    t79 = *((char **)t78);
    t78 = ((char*)((ng4)));
    memset(t80, 0, 8);
    t81 = (t79 + 4);
    if (*((unsigned int *)t81) != 0)
        goto LAB38;

LAB37:    t82 = (t78 + 4);
    if (*((unsigned int *)t82) != 0)
        goto LAB38;

LAB41:    if (*((unsigned int *)t79) < *((unsigned int *)t78))
        goto LAB39;

LAB40:    memset(t84, 0, 8);
    t85 = (t80 + 4);
    t86 = *((unsigned int *)t85);
    t87 = (~(t86));
    t88 = *((unsigned int *)t80);
    t89 = (t88 & t87);
    t90 = (t89 & 1U);
    if (t90 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t85) != 0)
        goto LAB44;

LAB45:    t93 = *((unsigned int *)t66);
    t94 = *((unsigned int *)t84);
    t95 = (t93 & t94);
    *((unsigned int *)t92) = t95;
    t96 = (t66 + 4);
    t97 = (t84 + 4);
    t98 = (t92 + 4);
    t99 = *((unsigned int *)t96);
    t100 = *((unsigned int *)t97);
    t101 = (t99 | t100);
    *((unsigned int *)t98) = t101;
    t102 = *((unsigned int *)t98);
    t103 = (t102 != 0);
    if (t103 == 1)
        goto LAB46;

LAB47:
LAB48:    goto LAB36;

LAB38:    t83 = (t80 + 4);
    *((unsigned int *)t80) = 1;
    *((unsigned int *)t83) = 1;
    goto LAB40;

LAB39:    *((unsigned int *)t80) = 1;
    goto LAB40;

LAB42:    *((unsigned int *)t84) = 1;
    goto LAB45;

LAB44:    t91 = (t84 + 4);
    *((unsigned int *)t84) = 1;
    *((unsigned int *)t91) = 1;
    goto LAB45;

LAB46:    t104 = *((unsigned int *)t92);
    t105 = *((unsigned int *)t98);
    *((unsigned int *)t92) = (t104 | t105);
    t106 = (t66 + 4);
    t107 = (t84 + 4);
    t108 = *((unsigned int *)t66);
    t109 = (~(t108));
    t110 = *((unsigned int *)t106);
    t111 = (~(t110));
    t112 = *((unsigned int *)t84);
    t113 = (~(t112));
    t114 = *((unsigned int *)t107);
    t115 = (~(t114));
    t116 = (t109 & t111);
    t117 = (t113 & t115);
    t118 = (~(t116));
    t119 = (~(t117));
    t120 = *((unsigned int *)t98);
    *((unsigned int *)t98) = (t120 & t118);
    t121 = *((unsigned int *)t98);
    *((unsigned int *)t98) = (t121 & t119);
    t122 = *((unsigned int *)t92);
    *((unsigned int *)t92) = (t122 & t118);
    t123 = *((unsigned int *)t92);
    *((unsigned int *)t92) = (t123 & t119);
    goto LAB48;

LAB49:    *((unsigned int *)t124) = 1;
    goto LAB52;

LAB51:    t131 = (t124 + 4);
    *((unsigned int *)t124) = 1;
    *((unsigned int *)t131) = 1;
    goto LAB52;

LAB53:    t136 = (t0 + 2184U);
    t137 = *((char **)t136);
    t136 = ((char*)((ng5)));
    memset(t138, 0, 8);
    t139 = (t137 + 4);
    if (*((unsigned int *)t139) != 0)
        goto LAB57;

LAB56:    t140 = (t136 + 4);
    if (*((unsigned int *)t140) != 0)
        goto LAB57;

LAB60:    if (*((unsigned int *)t137) < *((unsigned int *)t136))
        goto LAB58;

LAB59:    memset(t142, 0, 8);
    t143 = (t138 + 4);
    t144 = *((unsigned int *)t143);
    t145 = (~(t144));
    t146 = *((unsigned int *)t138);
    t147 = (t146 & t145);
    t148 = (t147 & 1U);
    if (t148 != 0)
        goto LAB61;

LAB62:    if (*((unsigned int *)t143) != 0)
        goto LAB63;

LAB64:    t151 = *((unsigned int *)t124);
    t152 = *((unsigned int *)t142);
    t153 = (t151 & t152);
    *((unsigned int *)t150) = t153;
    t154 = (t124 + 4);
    t155 = (t142 + 4);
    t156 = (t150 + 4);
    t157 = *((unsigned int *)t154);
    t158 = *((unsigned int *)t155);
    t159 = (t157 | t158);
    *((unsigned int *)t156) = t159;
    t160 = *((unsigned int *)t156);
    t161 = (t160 != 0);
    if (t161 == 1)
        goto LAB65;

LAB66:
LAB67:    goto LAB55;

LAB57:    t141 = (t138 + 4);
    *((unsigned int *)t138) = 1;
    *((unsigned int *)t141) = 1;
    goto LAB59;

LAB58:    *((unsigned int *)t138) = 1;
    goto LAB59;

LAB61:    *((unsigned int *)t142) = 1;
    goto LAB64;

LAB63:    t149 = (t142 + 4);
    *((unsigned int *)t142) = 1;
    *((unsigned int *)t149) = 1;
    goto LAB64;

LAB65:    t162 = *((unsigned int *)t150);
    t163 = *((unsigned int *)t156);
    *((unsigned int *)t150) = (t162 | t163);
    t164 = (t124 + 4);
    t165 = (t142 + 4);
    t166 = *((unsigned int *)t124);
    t167 = (~(t166));
    t168 = *((unsigned int *)t164);
    t169 = (~(t168));
    t170 = *((unsigned int *)t142);
    t171 = (~(t170));
    t172 = *((unsigned int *)t165);
    t173 = (~(t172));
    t174 = (t167 & t169);
    t175 = (t171 & t173);
    t176 = (~(t174));
    t177 = (~(t175));
    t178 = *((unsigned int *)t156);
    *((unsigned int *)t156) = (t178 & t176);
    t179 = *((unsigned int *)t156);
    *((unsigned int *)t156) = (t179 & t177);
    t180 = *((unsigned int *)t150);
    *((unsigned int *)t150) = (t180 & t176);
    t181 = *((unsigned int *)t150);
    *((unsigned int *)t150) = (t181 & t177);
    goto LAB67;

LAB68:    xsi_set_current_line(46, ng0);

LAB71:    xsi_set_current_line(47, ng0);
    t188 = ((char*)((ng2)));
    t189 = (t0 + 3064);
    xsi_vlogvar_assign_value(t189, t188, 0, 0, 12);
    xsi_set_current_line(48, ng0);
    t2 = (t0 + 2024U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB73;

LAB72:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB73;

LAB76:    if (*((unsigned int *)t3) < *((unsigned int *)t2))
        goto LAB75;

LAB74:    *((unsigned int *)t6) = 1;

LAB75:    memset(t8, 0, 8);
    t16 = (t6 + 4);
    t9 = *((unsigned int *)t16);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB77;

LAB78:    if (*((unsigned int *)t16) != 0)
        goto LAB79;

LAB80:    t18 = (t8 + 4);
    t14 = *((unsigned int *)t8);
    t21 = *((unsigned int *)t18);
    t22 = (t14 || t21);
    if (t22 > 0)
        goto LAB81;

LAB82:    memcpy(t34, t8, 8);

LAB83:    memset(t66, 0, 8);
    t67 = (t34 + 4);
    t68 = *((unsigned int *)t67);
    t69 = (~(t68));
    t70 = *((unsigned int *)t34);
    t71 = (t70 & t69);
    t72 = (t71 & 1U);
    if (t72 != 0)
        goto LAB96;

LAB97:    if (*((unsigned int *)t67) != 0)
        goto LAB98;

LAB99:    t74 = (t66 + 4);
    t75 = *((unsigned int *)t66);
    t76 = *((unsigned int *)t74);
    t77 = (t75 || t76);
    if (t77 > 0)
        goto LAB100;

LAB101:    memcpy(t92, t66, 8);

LAB102:    memset(t124, 0, 8);
    t125 = (t92 + 4);
    t126 = *((unsigned int *)t125);
    t127 = (~(t126));
    t128 = *((unsigned int *)t92);
    t129 = (t128 & t127);
    t130 = (t129 & 1U);
    if (t130 != 0)
        goto LAB115;

LAB116:    if (*((unsigned int *)t125) != 0)
        goto LAB117;

LAB118:    t132 = (t124 + 4);
    t133 = *((unsigned int *)t124);
    t134 = *((unsigned int *)t132);
    t135 = (t133 || t134);
    if (t135 > 0)
        goto LAB119;

LAB120:    memcpy(t150, t124, 8);

LAB121:    t182 = (t150 + 4);
    t183 = *((unsigned int *)t182);
    t184 = (~(t183));
    t185 = *((unsigned int *)t150);
    t186 = (t185 & t184);
    t187 = (t186 != 0);
    if (t187 > 0)
        goto LAB134;

LAB135:
LAB136:    goto LAB70;

LAB73:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB75;

LAB77:    *((unsigned int *)t8) = 1;
    goto LAB80;

LAB79:    t17 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB80;

LAB81:    t19 = (t0 + 2184U);
    t20 = *((char **)t19);
    t19 = ((char*)((ng3)));
    memset(t15, 0, 8);
    t27 = (t20 + 4);
    if (*((unsigned int *)t27) != 0)
        goto LAB85;

LAB84:    t28 = (t19 + 4);
    if (*((unsigned int *)t28) != 0)
        goto LAB85;

LAB88:    if (*((unsigned int *)t20) < *((unsigned int *)t19))
        goto LAB87;

LAB86:    *((unsigned int *)t15) = 1;

LAB87:    memset(t30, 0, 8);
    t31 = (t15 + 4);
    t23 = *((unsigned int *)t31);
    t24 = (~(t23));
    t25 = *((unsigned int *)t15);
    t26 = (t25 & t24);
    t32 = (t26 & 1U);
    if (t32 != 0)
        goto LAB89;

LAB90:    if (*((unsigned int *)t31) != 0)
        goto LAB91;

LAB92:    t35 = *((unsigned int *)t8);
    t36 = *((unsigned int *)t30);
    t37 = (t35 & t36);
    *((unsigned int *)t34) = t37;
    t38 = (t8 + 4);
    t39 = (t30 + 4);
    t40 = (t34 + 4);
    t41 = *((unsigned int *)t38);
    t42 = *((unsigned int *)t39);
    t43 = (t41 | t42);
    *((unsigned int *)t40) = t43;
    t44 = *((unsigned int *)t40);
    t45 = (t44 != 0);
    if (t45 == 1)
        goto LAB93;

LAB94:
LAB95:    goto LAB83;

LAB85:    t29 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB87;

LAB89:    *((unsigned int *)t30) = 1;
    goto LAB92;

LAB91:    t33 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t33) = 1;
    goto LAB92;

LAB93:    t46 = *((unsigned int *)t34);
    t47 = *((unsigned int *)t40);
    *((unsigned int *)t34) = (t46 | t47);
    t48 = (t8 + 4);
    t49 = (t30 + 4);
    t50 = *((unsigned int *)t8);
    t51 = (~(t50));
    t52 = *((unsigned int *)t48);
    t53 = (~(t52));
    t54 = *((unsigned int *)t30);
    t55 = (~(t54));
    t56 = *((unsigned int *)t49);
    t57 = (~(t56));
    t58 = (t51 & t53);
    t59 = (t55 & t57);
    t60 = (~(t58));
    t61 = (~(t59));
    t62 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t62 & t60);
    t63 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t63 & t61);
    t64 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t64 & t60);
    t65 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t65 & t61);
    goto LAB95;

LAB96:    *((unsigned int *)t66) = 1;
    goto LAB99;

LAB98:    t73 = (t66 + 4);
    *((unsigned int *)t66) = 1;
    *((unsigned int *)t73) = 1;
    goto LAB99;

LAB100:    t78 = (t0 + 2024U);
    t79 = *((char **)t78);
    t78 = ((char*)((ng6)));
    memset(t80, 0, 8);
    t81 = (t79 + 4);
    if (*((unsigned int *)t81) != 0)
        goto LAB104;

LAB103:    t82 = (t78 + 4);
    if (*((unsigned int *)t82) != 0)
        goto LAB104;

LAB107:    if (*((unsigned int *)t79) < *((unsigned int *)t78))
        goto LAB105;

LAB106:    memset(t84, 0, 8);
    t85 = (t80 + 4);
    t86 = *((unsigned int *)t85);
    t87 = (~(t86));
    t88 = *((unsigned int *)t80);
    t89 = (t88 & t87);
    t90 = (t89 & 1U);
    if (t90 != 0)
        goto LAB108;

LAB109:    if (*((unsigned int *)t85) != 0)
        goto LAB110;

LAB111:    t93 = *((unsigned int *)t66);
    t94 = *((unsigned int *)t84);
    t95 = (t93 & t94);
    *((unsigned int *)t92) = t95;
    t96 = (t66 + 4);
    t97 = (t84 + 4);
    t98 = (t92 + 4);
    t99 = *((unsigned int *)t96);
    t100 = *((unsigned int *)t97);
    t101 = (t99 | t100);
    *((unsigned int *)t98) = t101;
    t102 = *((unsigned int *)t98);
    t103 = (t102 != 0);
    if (t103 == 1)
        goto LAB112;

LAB113:
LAB114:    goto LAB102;

LAB104:    t83 = (t80 + 4);
    *((unsigned int *)t80) = 1;
    *((unsigned int *)t83) = 1;
    goto LAB106;

LAB105:    *((unsigned int *)t80) = 1;
    goto LAB106;

LAB108:    *((unsigned int *)t84) = 1;
    goto LAB111;

LAB110:    t91 = (t84 + 4);
    *((unsigned int *)t84) = 1;
    *((unsigned int *)t91) = 1;
    goto LAB111;

LAB112:    t104 = *((unsigned int *)t92);
    t105 = *((unsigned int *)t98);
    *((unsigned int *)t92) = (t104 | t105);
    t106 = (t66 + 4);
    t107 = (t84 + 4);
    t108 = *((unsigned int *)t66);
    t109 = (~(t108));
    t110 = *((unsigned int *)t106);
    t111 = (~(t110));
    t112 = *((unsigned int *)t84);
    t113 = (~(t112));
    t114 = *((unsigned int *)t107);
    t115 = (~(t114));
    t116 = (t109 & t111);
    t117 = (t113 & t115);
    t118 = (~(t116));
    t119 = (~(t117));
    t120 = *((unsigned int *)t98);
    *((unsigned int *)t98) = (t120 & t118);
    t121 = *((unsigned int *)t98);
    *((unsigned int *)t98) = (t121 & t119);
    t122 = *((unsigned int *)t92);
    *((unsigned int *)t92) = (t122 & t118);
    t123 = *((unsigned int *)t92);
    *((unsigned int *)t92) = (t123 & t119);
    goto LAB114;

LAB115:    *((unsigned int *)t124) = 1;
    goto LAB118;

LAB117:    t131 = (t124 + 4);
    *((unsigned int *)t124) = 1;
    *((unsigned int *)t131) = 1;
    goto LAB118;

LAB119:    t136 = (t0 + 2184U);
    t137 = *((char **)t136);
    t136 = ((char*)((ng7)));
    memset(t138, 0, 8);
    t139 = (t137 + 4);
    if (*((unsigned int *)t139) != 0)
        goto LAB123;

LAB122:    t140 = (t136 + 4);
    if (*((unsigned int *)t140) != 0)
        goto LAB123;

LAB126:    if (*((unsigned int *)t137) < *((unsigned int *)t136))
        goto LAB124;

LAB125:    memset(t142, 0, 8);
    t143 = (t138 + 4);
    t144 = *((unsigned int *)t143);
    t145 = (~(t144));
    t146 = *((unsigned int *)t138);
    t147 = (t146 & t145);
    t148 = (t147 & 1U);
    if (t148 != 0)
        goto LAB127;

LAB128:    if (*((unsigned int *)t143) != 0)
        goto LAB129;

LAB130:    t151 = *((unsigned int *)t124);
    t152 = *((unsigned int *)t142);
    t153 = (t151 & t152);
    *((unsigned int *)t150) = t153;
    t154 = (t124 + 4);
    t155 = (t142 + 4);
    t156 = (t150 + 4);
    t157 = *((unsigned int *)t154);
    t158 = *((unsigned int *)t155);
    t159 = (t157 | t158);
    *((unsigned int *)t156) = t159;
    t160 = *((unsigned int *)t156);
    t161 = (t160 != 0);
    if (t161 == 1)
        goto LAB131;

LAB132:
LAB133:    goto LAB121;

LAB123:    t141 = (t138 + 4);
    *((unsigned int *)t138) = 1;
    *((unsigned int *)t141) = 1;
    goto LAB125;

LAB124:    *((unsigned int *)t138) = 1;
    goto LAB125;

LAB127:    *((unsigned int *)t142) = 1;
    goto LAB130;

LAB129:    t149 = (t142 + 4);
    *((unsigned int *)t142) = 1;
    *((unsigned int *)t149) = 1;
    goto LAB130;

LAB131:    t162 = *((unsigned int *)t150);
    t163 = *((unsigned int *)t156);
    *((unsigned int *)t150) = (t162 | t163);
    t164 = (t124 + 4);
    t165 = (t142 + 4);
    t166 = *((unsigned int *)t124);
    t167 = (~(t166));
    t168 = *((unsigned int *)t164);
    t169 = (~(t168));
    t170 = *((unsigned int *)t142);
    t171 = (~(t170));
    t172 = *((unsigned int *)t165);
    t173 = (~(t172));
    t174 = (t167 & t169);
    t175 = (t171 & t173);
    t176 = (~(t174));
    t177 = (~(t175));
    t178 = *((unsigned int *)t156);
    *((unsigned int *)t156) = (t178 & t176);
    t179 = *((unsigned int *)t156);
    *((unsigned int *)t156) = (t179 & t177);
    t180 = *((unsigned int *)t150);
    *((unsigned int *)t150) = (t180 & t176);
    t181 = *((unsigned int *)t150);
    *((unsigned int *)t150) = (t181 & t177);
    goto LAB133;

LAB134:    xsi_set_current_line(48, ng0);

LAB137:    xsi_set_current_line(49, ng0);
    t188 = (t0 + 2664U);
    t189 = *((char **)t188);
    t188 = (t0 + 3064);
    xsi_vlogvar_assign_value(t188, t189, 0, 0, 12);
    goto LAB136;

}

static void Cont_65_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 5120U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 3064);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5536);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 4095U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 11);
    t18 = (t0 + 5456);
    *((int *)t18) = 1;

LAB1:    return;
}


extern void work_m_00000000003785841549_0126320049_init()
{
	static char *pe[] = {(void *)Initial_37_0,(void *)Always_42_1,(void *)Cont_65_2};
	xsi_register_didat("work_m_00000000003785841549_0126320049", "isim/testvga_isim_beh.exe.sim/work/m_00000000003785841549_0126320049.didat");
	xsi_register_executes(pe);
}
