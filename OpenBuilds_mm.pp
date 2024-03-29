+================================================
+
+ Grbl - Vectric machine output configuration file
+
+================================================
+
+ History
+
+ Who      When       What
+ ======== ========== ===========================
+ EdwardP  28/11/2014 Written from GCode_mm.pp
+                     Added arc move support
+ EdwardP  11/02/2015 Commented out arcs as these
+                     slow GRBL performance appear
+                     interpolated anyway
+ EdwardP  18/06/2015 Explicitly set absolute mode (G90)
+ Mark     24/11/2015 Updated for interim 0.9 spec.
+                     Renaming to be machine specific.
+                     Removing M30 from Footer.
+ EdwardP  01/02/2018 Updated according to 1.1 spec
+                     Changed to 1.3 precision
+                     Spindle off (M5) in footer
+                     Added VTransfer Direct Output
+ EdwardP  07/12/2018 Added grbl laser 1.1 support.
+                     - Power variable (0-1000 range)
+                     - Power on change only
+                     - [P] added to feedrate records
+                     - New laser record types:
+                       o JET_TOOL_ON
+                       o JET_TOOL_OFF
+                       o JET_TOOL_POWER
+ MohamedM 13/12/2018 Move M3 and [S] from the header
+                     to a new SPINDLE_ON section which
+                     is not output in laser toolpaths
+                     or when the spindle speed is invalid (negative).
+ EdwardP 20/12/2018  Re-enabled arcs in response to
+                     customer feedback ZD105327
+ CharlotteP 26/03/2020 Updated to open builds from base
+                     grbl with ZD141201
+ PetervdWalt 11/6/2020 Updated Header to include G20/G90 Modals
+                     for OpenBuilds BlackBox
+ PetervdWalt 11/07/2023 Updated to use MIN_ARC_RADIUS
+ ======== ========== ===========================

POST_NAME = "OpenBuilds GRBL (mm) (*.GCODE)"

POST_BASE = "Grbl_mm.pp"

FILE_EXTENSION = "GCODE"

VAR MIN_ARC_RADIUS = 1

+================================================
+
+    Block definitions for toolpath output
+
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"T1"
"G17"
"G21"
"G90"
"G0[ZH]"
"G0[XH][YH]"


+---------------------------------------------------
+  Command output after the header to switch spindle on
+---------------------------------------------------

begin SPINDLE_ON

"M3[S]"
"G4 P1.8"
