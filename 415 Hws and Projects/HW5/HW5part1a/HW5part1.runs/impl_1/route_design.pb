
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px� 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px� 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px� 
C
.Phase 1 Build RT Design | Checksum: 1c8221f94
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:33 ; elapsed = 00:00:29 . Memory (MB): peak = 1659.465 ; gain = 117.0622default:defaulth px� 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px� 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px� 
B
-Phase 2.1 Create Timer | Checksum: 1c8221f94
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:29 . Memory (MB): peak = 1659.465 ; gain = 117.0622default:defaulth px� 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px� 
N
9Phase 2.2 Fix Topology Constraints | Checksum: 1c8221f94
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:29 . Memory (MB): peak = 1665.500 ; gain = 123.0982default:defaulth px� 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px� 
G
2Phase 2.3 Pre Route Cleanup | Checksum: 1c8221f94
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:29 . Memory (MB): peak = 1665.500 ; gain = 123.0982default:defaulth px� 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px� 
B
-Phase 2.4 Update Timing | Checksum: 4972ce34
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:29 . Memory (MB): peak = 1672.328 ; gain = 129.9262default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=-0.095 | TNS=-0.095 | WHS=-0.067 | THS=-0.190 |
2default:defaultZ35-416h px� 
H
3Phase 2 Router Initialization | Checksum: 55092786
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:29 . Memory (MB): peak = 1672.328 ; gain = 129.9262default:defaulth px� 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px� 
C
.Phase 3 Initial Routing | Checksum: 14c1293da
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:30 . Memory (MB): peak = 1673.453 ; gain = 131.0512default:defaulth px� 
�
>Design has %s pins with tight setup and hold constraints.

%s
244*route2
62default:default2�
�The top 5 pins with tight setup and hold constraints:

+--------------------------+--------------------------+----------------------------------------------------------------------------------------------------------+
|       Launch Clock       |      Capture Clock       |                                                 Pin                                                      |
+--------------------------+--------------------------+----------------------------------------------------------------------------------------------------------+
|                      clk |                      clk |                                                                                         save_sum_reg[7]/D|
|                      clk |                      clk |                                                                                         save_sum_reg[8]/D|
|                      clk |                      clk |                                                                                         save_sum_reg[5]/D|
|                      clk |                      clk |                                                                                         save_sum_reg[6]/D|
|                      clk |                      clk |                                                                                         save_sum_reg[4]/D|
+--------------------------+--------------------------+----------------------------------------------------------------------------------------------------------+

File with complete list of pins: tight_setup_hold_pins.txt
2default:defaultZ35-580h px� 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px� 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=0.067  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
H
3Phase 4.1 Global Iteration 0 | Checksum: 121e79876
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:30 . Memory (MB): peak = 1673.453 ; gain = 131.0512default:defaulth px� 
F
1Phase 4 Rip-up And Reroute | Checksum: 121e79876
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:30 . Memory (MB): peak = 1673.453 ; gain = 131.0512default:defaulth px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px� 
C
.Phase 5.1 Delay CleanUp | Checksum: 121e79876
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:30 . Memory (MB): peak = 1673.453 ; gain = 131.0512default:defaulth px� 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px� 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 121e79876
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:30 . Memory (MB): peak = 1673.453 ; gain = 131.0512default:defaulth px� 
O
:Phase 5 Delay and Skew Optimization | Checksum: 121e79876
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:30 . Memory (MB): peak = 1673.453 ; gain = 131.0512default:defaulth px� 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 6.1.1 Update Timing | Checksum: 1291370c9
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:30 . Memory (MB): peak = 1673.453 ; gain = 131.0512default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=0.162  | TNS=0.000  | WHS=0.189  | THS=0.000  |
2default:defaultZ35-416h px� 
C
.Phase 6.1 Hold Fix Iter | Checksum: 1291370c9
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:30 . Memory (MB): peak = 1673.453 ; gain = 131.0512default:defaulth px� 
A
,Phase 6 Post Hold Fix | Checksum: 1291370c9
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:30 . Memory (MB): peak = 1673.453 ; gain = 131.0512default:defaulth px� 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px� 
B
-Phase 7 Route finalize | Checksum: 1291370c9
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:30 . Memory (MB): peak = 1673.453 ; gain = 131.0512default:defaulth px� 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px� 
I
4Phase 8 Verifying routed nets | Checksum: 1291370c9
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:30 . Memory (MB): peak = 1675.523 ; gain = 133.1212default:defaulth px� 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px� 
E
0Phase 9 Depositing Routes | Checksum: 176ea426e
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:30 . Memory (MB): peak = 1675.523 ; gain = 133.1212default:defaulth px� 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px� 
�
Estimated Timing Summary %s
57*route2J
6| WNS=0.162  | TNS=0.000  | WHS=0.189  | THS=0.000  |
2default:defaultZ35-57h px� 
�
�The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327h px� 
G
2Phase 10 Post Router Timing | Checksum: 176ea426e
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:30 . Memory (MB): peak = 1675.523 ; gain = 133.1212default:defaulth px� 
@
Router Completed Successfully
2*	routeflowZ35-16h px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:34 ; elapsed = 00:00:30 . Memory (MB): peak = 1675.523 ; gain = 133.1212default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1012default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:00:352default:default2
00:00:312default:default2
1675.5232default:default2
142.1802default:defaultZ17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1675.5232default:default2
0.0002default:defaultZ17-268h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2 
00:00:00.0432default:default2
1685.3552default:default2
9.8322default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2w
cC:/Users/nehmy/OneDrive/Desktop/415 Hws and Projects/HW5part1/HW5part1.runs/impl_1/adder_routed.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2x
dExecuting : report_drc -file adder_drc_routed.rpt -pb adder_drc_routed.pb -rpx adder_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2k
Wreport_drc -file adder_drc_routed.rpt -pb adder_drc_routed.pb -rpx adder_drc_routed.rpx2default:defaultZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
gC:/Users/nehmy/OneDrive/Desktop/415 Hws and Projects/HW5part1/HW5part1.runs/impl_1/adder_drc_routed.rptgC:/Users/nehmy/OneDrive/Desktop/415 Hws and Projects/HW5part1/HW5part1.runs/impl_1/adder_drc_routed.rpt2default:default8Z2-168h px� 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px� 
�
%s4*runtcl2�
�Executing : report_methodology -file adder_methodology_drc_routed.rpt -pb adder_methodology_drc_routed.pb -rpx adder_methodology_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
�report_methodology -file adder_methodology_drc_routed.rpt -pb adder_methodology_drc_routed.pb -rpx adder_methodology_drc_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px� 
�
2The results of Report Methodology are in file %s.
450*coretcl2�
sC:/Users/nehmy/OneDrive/Desktop/415 Hws and Projects/HW5part1/HW5part1.runs/impl_1/adder_methodology_drc_routed.rptsC:/Users/nehmy/OneDrive/Desktop/415 Hws and Projects/HW5part1/HW5part1.runs/impl_1/adder_methodology_drc_routed.rpt2default:default8Z2-1520h px� 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px� 
�
%s4*runtcl2�
tExecuting : report_power -file adder_power_routed.rpt -pb adder_power_summary_routed.pb -rpx adder_power_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2{
greport_power -file adder_power_routed.rpt -pb adder_power_summary_routed.pb -rpx adder_power_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1132default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px� 
�
%s4*runtcl2k
WExecuting : report_route_status -file adder_route_status.rpt -pb adder_route_status.pb
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_timing_summary -max_paths 10 -file adder_timing_summary_routed.rpt -pb adder_timing_summary_routed.pb -rpx adder_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 
~
%s4*runtcl2b
NExecuting : report_incremental_reuse -file adder_incremental_reuse_routed.rpt
2default:defaulth px� 
g
BIncremental flow is disabled. No incremental reuse Info to report.423*	vivadotclZ4-1062h px� 
~
%s4*runtcl2b
NExecuting : report_clock_utilization -file adder_clock_utilization_routed.rpt
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_bus_skew -warn_on_violation -file adder_bus_skew_routed.rpt -pb adder_bus_skew_routed.pb -rpx adder_bus_skew_routed.rpx
2default:defaulth px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 


End Record