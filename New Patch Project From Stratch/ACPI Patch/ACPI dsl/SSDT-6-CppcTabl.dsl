/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-6-CppcTabl.aml, Tue Jun 25 12:50:23 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000393 (915)
 *     Revision         0x01
 *     Checksum         0x6A
 *     OEM ID           "CppcTa"
 *     OEM Table ID     "CppcTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120711 (538052369)
 */
DefinitionBlock ("", "SSDT", 1, "CppcTa", "CppcTabl", 0x00001000)
{
    /*
     * External declarations were imported from
     * a reference file -- refs.txt
     */

    External (_GPE.MMTB, MethodObj)    // Imported: 0 Arguments
    External (_GPE.VHOV, MethodObj)    // Imported: 3 Arguments
    External (_PR_.CPU0, ProcessorObj)
    External (_PR_.CPU0._PPC, IntObj)
    External (_PR_.CPU0._PSS, PkgObj)
    External (_PR_.CPU0._TSS, IntObj)    // Warning: Unknown object
    External (_PR_.CPU1, ProcessorObj)
    External (_PR_.CPU2, ProcessorObj)
    External (_PR_.CPU3, ProcessorObj)
    External (_PR_.CPU4, ProcessorObj)
    External (_PR_.CPU5, ProcessorObj)
    External (_PR_.CPU6, ProcessorObj)
    External (_PR_.CPU7, ProcessorObj)
    External (_SB_.PCI0.IGPU.DD02._BCM, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECMD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECWT, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.SATA.SDSM, MethodObj)    // Imported: 4 Arguments
    External (_SB_.PCI0.XHC_.RHUB.TPLD, MethodObj)    // Imported: 2 Arguments
    External (MDBG, MethodObj)    // Imported: 1 Arguments
    External (OSYS, FieldUnitObj)
    External (PDC0, IntObj)
    External (TCNT, FieldUnitObj)

    Scope (\_SB)
    {
        Device (PCCD)
        {
            Name (PCCA, 0xCAB07018)
            Name (PCCS, 0x00001000)
            Name (PENB, 0x00000001)
            Name (_HID, EisaId ("INT340F"))  // _HID: Hardware ID
            Name (_STR, Unicode ("Collaborative Processor Performance Control (CPPC)"))  // _STR: Description String
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LGreaterEqual (OSYS, 0x07DC))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (TMPP, Package (0x02)
            {
                0x80000000, 
                0x80000000
            })
            Method (PADR, 0, NotSerialized)
            {
                Store (PCCA, Index (TMPP, Zero))
                Store (PCCS, Index (TMPP, One))
                Return (TMPP)
            }

            Method (GPRN, 0, Serialized)
            {
                Switch (ToInteger (TCNT))
                {
                    Case (0x08)
                    {
                        Notify (\_PR.CPU0, 0x83)
                        Notify (\_PR.CPU1, 0x83)
                        Notify (\_PR.CPU2, 0x83)
                        Notify (\_PR.CPU3, 0x83)
                        Notify (\_PR.CPU4, 0x83)
                        Notify (\_PR.CPU5, 0x83)
                        Notify (\_PR.CPU6, 0x83)
                        Notify (\_PR.CPU7, 0x83)
                    }
                    Case (0x04)
                    {
                        Notify (\_PR.CPU0, 0x83)
                        Notify (\_PR.CPU1, 0x83)
                        Notify (\_PR.CPU2, 0x83)
                        Notify (\_PR.CPU3, 0x83)
                    }
                    Case (0x02)
                    {
                        Notify (\_PR.CPU0, 0x83)
                        Notify (\_PR.CPU1, 0x83)
                    }
                    Default
                    {
                        Notify (\_PR.CPU0, 0x83)
                    }

                }
            }

            Name (PCFG, Zero)
            Method (_PTC, 0, NotSerialized)  // _PTC: Processor Throttling Control
            {
                If (LAnd (CondRefOf (\PDC0), LNotEqual (\PDC0, 0x80000000)))
                {
                    If (And (\PDC0, 0x04))
                    {
                        Return (Package (0x02)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x05,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000001810, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x05,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000001810, // Address
                                    ,)
                            }
                        })
                    }
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }
                    })
                }
            }

            Method (_PSS, 0, NotSerialized)  // _PSS: Performance Supported States
            {
                If (CondRefOf (\_PR.CPU0._PSS))
                {
                    Return (\_PR.CPU0._PSS)
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        Package (0x06)
                        {
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }, 

                        Package (0x06)
                        {
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }
                    })
                }
            }

            Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilities
            {
                If (CondRefOf (\_PR.CPU0._PPC))
                {
                    Return (\_PR.CPU0._PPC)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_TSS, 0, NotSerialized)  // _TSS: Throttling Supported States
            {
                If (CondRefOf (\_PR.CPU0._TSS))
                {
                    Return (\_PR.CPU0._TSS)
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        Package (0x05)
                        {
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }, 

                        Package (0x05)
                        {
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }
                    })
                }
            }
        }
    }
}

