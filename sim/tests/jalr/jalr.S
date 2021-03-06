###############################################################################
# File         : jalr.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Test the functionality of the 'jalr' instruction.
#
###############################################################################


    .section .boot, "x"
    .balign 4
    .set    noreorder
    .global boot
    .ent    boot
boot:
    lui     $s0, 0x8002         # Load the base address of the status/test registers
    ori     $s1, $0, 1          # Prepare the 'done' status
    # la      $t0, $target
    lui     $t0, 0x0
    addiu   $t0, $t0, $target
#    jr      $t0		# removed to test jal
    ori     $v0, $0, 0          # The test result starts as a failure
    jalr    $t0			# added to test jal
    nop				# added to test jal

$finish:
    sw      $v0, 4($s0)
    sw      $s1, 0($s0)

$done:
    j       $done
    nop

$target:
   # ori     $v0, $0, 1          # Set the result to pass
    jr      $ra			# edited to test jal
    ori     $v0, $0, 1          # Set the result to pass
   

    .end boot
