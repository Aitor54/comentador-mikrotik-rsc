# 2026-01-29 10:19:47 by RouterOS 7.20.8
# software id = UCY7-5TYH
#
# model = CCR2004-16G-2S+
# serial number = HH90AC4ZSB6
/interface bridge
add name=BR_VLAN5
add name=BR_VLAN8
add name=BR_VLAN50
add name=BR_VLAN99
add name=BR_VLAN1344
add name=BR_VLAN1401
add name=BR_VLAN1405
add name=BR_VLAN1408
add name=BR_VLAN1414
/interface ethernet
set [ find default-name=ether4 ] disabled=yes
set [ find default-name=ether5 ] disabled=yes
set [ find default-name=ether6 ] disabled=yes
set [ find default-name=ether7 ] disabled=yes
set [ find default-name=ether8 ] disabled=yes
set [ find default-name=ether9 ] disabled=yes
set [ find default-name=ether10 ] disabled=yes
set [ find default-name=ether11 ] disabled=yes
set [ find default-name=ether12 ] disabled=yes
set [ find default-name=ether13 ] disabled=yes
set [ find default-name=ether14 ] disabled=yes
set [ find default-name=sfp-sfpplus1 ] disabled=yes
set [ find default-name=sfp-sfpplus2 ] disabled=yes
/interface eoip
add keepalive=1s,3 local-address=172.19.10.241 loop-protect=off mac-address=\
    FE:12:23:72:9F:0D name=IF-EOIP-2011-QC10 remote-address=172.19.10.242 \
    tunnel-id=101
add keepalive=1s,3 local-address=172.19.11.241 loop-protect=off mac-address=\
    FE:C2:10:CE:1D:49 name=IF-EOIP-2011-QC11 remote-address=172.19.11.242 \
    tunnel-id=111
add keepalive=1s,3 local-address=172.19.12.241 loop-protect=off mac-address=\
    FE:1F:B2:2B:CD:5C name=IF-EOIP-2011-QC12 remote-address=172.19.12.242 \
    tunnel-id=121
add keepalive=1s,3 local-address=172.19.14.241 loop-protect=off mac-address=\
    FE:6F:56:78:BA:3F name=IF-EOIP-2011-QC14 remote-address=172.19.14.242 \
    tunnel-id=141
add keepalive=1s,3 local-address=172.19.15.241 loop-protect=off mac-address=\
    FE:4D:6D:89:31:BF name=IF-EOIP-2011-QC15 remote-address=172.19.15.242 \
    tunnel-id=151
add keepalive=1s,3 local-address=172.19.16.241 loop-protect=off mac-address=\
    FE:8A:CD:5E:FF:05 name=IF-EOIP-2011-QC16 remote-address=172.19.16.242 \
    tunnel-id=161
add keepalive=1s,3 local-address=172.19.17.241 loop-protect=off mac-address=\
    FE:DF:88:95:75:76 name=IF-EOIP-2011-QC17 remote-address=172.19.17.242 \
    tunnel-id=171
add keepalive=1s,3 local-address=172.19.18.241 loop-protect=off mac-address=\
    FE:B9:E5:89:A9:87 name=IF-EOIP-2011-QC18 remote-address=172.19.18.242 \
    tunnel-id=181
add keepalive=1s,3 local-address=172.19.19.241 loop-protect=off mac-address=\
    FE:75:A0:44:89:CF name=IF-EOIP-2011-QC19 remote-address=172.19.19.242 \
    tunnel-id=191
add keepalive=1s,3 local-address=172.19.20.241 loop-protect=off mac-address=\
    FE:38:49:3C:33:28 name=IF-EOIP-2011-QC20 remote-address=172.19.20.242 \
    tunnel-id=201
add keepalive=1s,3 local-address=172.19.21.241 loop-protect=off mac-address=\
    FE:05:62:71:67:69 name=IF-EOIP-2011-QC21 remote-address=172.19.21.242 \
    tunnel-id=211
add keepalive=1s,3 local-address=172.19.22.241 loop-protect=off mac-address=\
    FE:77:7B:05:23:0E name=IF-EOIP-2011-QC22 remote-address=172.19.22.242 \
    tunnel-id=221
add keepalive=1s,3 local-address=172.19.23.241 loop-protect=off mac-address=\
    FE:C1:E7:41:B5:49 name=IF-EOIP-2011-QC23 remote-address=172.19.23.242 \
    tunnel-id=231
add keepalive=1s,3 local-address=172.19.24.241 loop-protect=off mac-address=\
    FE:CD:47:BE:43:E5 name=IF-EOIP-2011-QC24 remote-address=172.19.24.242 \
    tunnel-id=241
add keepalive=1s,3 local-address=172.19.25.241 loop-protect=off mac-address=\
    FE:B1:6E:96:59:1F name=IF-EOIP-2011-QC25 remote-address=172.19.25.242 \
    tunnel-id=251
add keepalive=1s,3 local-address=172.19.26.241 loop-protect=off mac-address=\
    FE:2D:C3:A9:21:B4 name=IF-EOIP-2011-QC26 remote-address=172.19.26.242 \
    tunnel-id=261
add keepalive=1s,3 local-address=172.19.27.241 loop-protect=off mac-address=\
    FE:02:B1:FB:B2:75 name=IF-EOIP-2011-QC27 remote-address=172.19.27.242 \
    tunnel-id=271
add keepalive=1s,3 local-address=172.19.28.241 loop-protect=off mac-address=\
    FE:50:B2:46:E6:E5 name=IF-EOIP-2011-QC28 remote-address=172.19.28.242 \
    tunnel-id=281
add keepalive=1s,3 local-address=172.19.29.241 loop-protect=off mac-address=\
    FE:D9:CE:0C:47:AF name=IF-EOIP-2011-QC29 remote-address=172.19.29.242 \
    tunnel-id=291
add keepalive=1s,3 local-address=172.19.10.241 loop-protect=off mac-address=\
    FE:6F:52:8A:DF:E9 name=IF-EOIP-SOB-QC10 remote-address=172.19.10.243 \
    tunnel-id=102
add keepalive=1s,3 local-address=172.19.11.241 loop-protect=off mac-address=\
    FE:C0:06:6D:33:C0 name=IF-EOIP-SOB-QC11 remote-address=172.19.11.243 \
    tunnel-id=112
add keepalive=1s,3 local-address=172.19.12.241 loop-protect=off mac-address=\
    FE:63:7B:22:C8:E7 name=IF-EOIP-SOB-QC12 remote-address=172.19.12.243 \
    tunnel-id=122
add keepalive=1s,3 local-address=172.19.14.241 loop-protect=off mac-address=\
    FE:7A:5C:E9:58:BC name=IF-EOIP-SOB-QC14 remote-address=172.19.14.243 \
    tunnel-id=142
add keepalive=1s,3 local-address=172.19.15.241 loop-protect=off mac-address=\
    FE:48:5A:11:C5:10 name=IF-EOIP-SOB-QC15 remote-address=172.19.15.243 \
    tunnel-id=152
add keepalive=1s,3 local-address=172.19.16.241 loop-protect=off mac-address=\
    FE:91:28:FD:A5:DA name=IF-EOIP-SOB-QC16 remote-address=172.19.16.243 \
    tunnel-id=162
add keepalive=1s,3 local-address=172.19.17.241 loop-protect=off mac-address=\
    FE:95:A2:31:EE:5D name=IF-EOIP-SOB-QC17 remote-address=172.19.17.243 \
    tunnel-id=172
add keepalive=1s,3 local-address=172.19.18.241 loop-protect=off mac-address=\
    FE:4D:07:44:06:1F name=IF-EOIP-SOB-QC18 remote-address=172.19.18.243 \
    tunnel-id=182
add keepalive=1s,3 local-address=172.19.19.241 loop-protect=off mac-address=\
    FE:7D:DB:B7:38:F8 name=IF-EOIP-SOB-QC19 remote-address=172.19.19.243 \
    tunnel-id=192
add keepalive=1s,3 local-address=172.19.20.241 loop-protect=off mac-address=\
    FE:10:68:EB:8A:E2 name=IF-EOIP-SOB-QC20 remote-address=172.19.20.243 \
    tunnel-id=202
add keepalive=1s,3 local-address=172.19.21.241 loop-protect=off mac-address=\
    FE:09:38:73:67:DB name=IF-EOIP-SOB-QC21 remote-address=172.19.21.243 \
    tunnel-id=212
add keepalive=1s,3 local-address=172.19.22.241 loop-protect=off mac-address=\
    FE:2F:20:AB:CF:57 name=IF-EOIP-SOB-QC22 remote-address=172.19.22.243 \
    tunnel-id=222
add keepalive=1s,3 local-address=172.19.23.241 loop-protect=off mac-address=\
    FE:95:1A:76:50:EB name=IF-EOIP-SOB-QC23 remote-address=172.19.23.243 \
    tunnel-id=232
add keepalive=1s,3 local-address=172.19.24.241 loop-protect=off mac-address=\
    FE:67:56:14:B3:9B name=IF-EOIP-SOB-QC24 remote-address=172.19.24.243 \
    tunnel-id=242
add keepalive=1s,3 local-address=172.19.25.241 loop-protect=off mac-address=\
    FE:73:A3:16:A8:A3 name=IF-EOIP-SOB-QC25 remote-address=172.19.25.243 \
    tunnel-id=252
add keepalive=1s,3 local-address=172.19.26.241 loop-protect=off mac-address=\
    FE:6B:1E:A2:D0:8C name=IF-EOIP-SOB-QC26 remote-address=172.19.26.243 \
    tunnel-id=262
add keepalive=1s,3 local-address=172.19.27.241 loop-protect=off mac-address=\
    FE:64:2E:2C:FF:9A name=IF-EOIP-SOB-QC27 remote-address=172.19.27.243 \
    tunnel-id=272
add keepalive=1s,3 local-address=172.19.28.241 loop-protect=off mac-address=\
    FE:66:ED:EB:02:C9 name=IF-EOIP-SOB-QC28 remote-address=172.19.28.243 \
    tunnel-id=282
add keepalive=1s,3 local-address=172.19.29.241 loop-protect=off mac-address=\
    FE:1D:8F:23:B9:78 name=IF-EOIP-SOB-QC29 remote-address=172.19.29.243 \
    tunnel-id=292
/interface vrrp
add interface=BR_VLAN50 name=IF-VRRP-VLAN50 priority=249 vrid=0
/interface vlan
add interface=IF-EOIP-2011-QC14 name=IF-VLAN5-QC14-2011-OUT vlan-id=5
add interface=IF-EOIP-SOB-QC10 name=IF-VLAN8-QC10-SOB-OUT vlan-id=8
add interface=IF-EOIP-2011-QC11 name=IF-VLAN8-QC11-2011-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC11 name=IF-VLAN8-QC11-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC12 name=IF-VLAN8-QC12-SOB-OUT vlan-id=8
add interface=IF-EOIP-2011-QC14 name=IF-VLAN8-QC14-2011-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC14 name=IF-VLAN8-QC14-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC15 name=IF-VLAN8-QC15-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC16 name=IF-VLAN8-QC16-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC17 name=IF-VLAN8-QC17-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC18 name=IF-VLAN8-QC18-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC19 name=IF-VLAN8-QC19-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC20 name=IF-VLAN8-QC20-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC21 name=IF-VLAN8-QC21-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC22 name=IF-VLAN8-QC22-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC23 name=IF-VLAN8-QC23-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC24 name=IF-VLAN8-QC24-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC25 name=IF-VLAN8-QC25-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC26 name=IF-VLAN8-QC26-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC27 name=IF-VLAN8-QC27-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC28 name=IF-VLAN8-QC28-SOB-OUT vlan-id=8
add interface=IF-EOIP-SOB-QC29 name=IF-VLAN8-QC29-SOB-OUT vlan-id=8
add interface=IF-EOIP-2011-QC11 name=IF-VLAN50-QC11-2011-OUT vlan-id=50
add interface=IF-EOIP-2011-QC14 name=IF-VLAN50-QC14-2011-OUT vlan-id=50
add interface=IF-EOIP-2011-QC11 name=IF-VLAN99-QC11-2011-OUT vlan-id=99
add interface=IF-EOIP-2011-QC14 name=IF-VLAN99-QC14-2011-OUT vlan-id=99
add interface=IF-EOIP-2011-QC10 name=IF-VLAN1344-QC10-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC11 name=IF-VLAN1344-QC11-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC12 name=IF-VLAN1344-QC12-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC14 name=IF-VLAN1344-QC14-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC15 name=IF-VLAN1344-QC15-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC16 name=IF-VLAN1344-QC16-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC17 name=IF-VLAN1344-QC17-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC18 name=IF-VLAN1344-QC18-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC19 name=IF-VLAN1344-QC19-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC20 name=IF-VLAN1344-QC20-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC21 name=IF-VLAN1344-QC21-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC22 name=IF-VLAN1344-QC22-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC23 name=IF-VLAN1344-QC23-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC24 name=IF-VLAN1344-QC24-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC25 name=IF-VLAN1344-QC25-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC26 name=IF-VLAN1344-QC26-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC27 name=IF-VLAN1344-QC27-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC28 name=IF-VLAN1344-QC28-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC29 name=IF-VLAN1344-QC29-2011-OUT vlan-id=1344
add interface=IF-EOIP-2011-QC11 name=IF-VLAN1401-DMZ-RTG-QC11-2011-OUT \
    vlan-id=1401
add interface=IF-EOIP-2011-QC14 name=IF-VLAN1401-DMZ-RTG-QC14-2011-OUT \
    vlan-id=1401
add interface=IF-EOIP-2011-QC10 name=IF-VLAN1405-QC10-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC11 name=IF-VLAN1405-QC11-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC12 name=IF-VLAN1405-QC12-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC14 name=IF-VLAN1405-QC14-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC15 name=IF-VLAN1405-QC15-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC16 name=IF-VLAN1405-QC16-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC17 name=IF-VLAN1405-QC17-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC18 name=IF-VLAN1405-QC18-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC19 name=IF-VLAN1405-QC19-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC20 name=IF-VLAN1405-QC20-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC21 name=IF-VLAN1405-QC21-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC22 name=IF-VLAN1405-QC22-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC23 name=IF-VLAN1405-QC23-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC24 name=IF-VLAN1405-QC24-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC25 name=IF-VLAN1405-QC25-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC26 name=IF-VLAN1405-QC26-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC27 name=IF-VLAN1405-QC27-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC28 name=IF-VLAN1405-QC28-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC29 name=IF-VLAN1405-QC29-2011-OUT vlan-id=1405
add interface=IF-EOIP-2011-QC10 name=IF-VLAN1408-QC10-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC11 name=IF-VLAN1408-QC11-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC12 name=IF-VLAN1408-QC12-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC14 name=IF-VLAN1408-QC14-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC15 name=IF-VLAN1408-QC15-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC16 name=IF-VLAN1408-QC16-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC17 name=IF-VLAN1408-QC17-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC18 name=IF-VLAN1408-QC18-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC19 name=IF-VLAN1408-QC19-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC20 name=IF-VLAN1408-QC20-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC21 name=IF-VLAN1408-QC21-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC22 name=IF-VLAN1408-QC22-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC23 name=IF-VLAN1408-QC23-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC24 name=IF-VLAN1408-QC24-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC25 name=IF-VLAN1408-QC25-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC26 name=IF-VLAN1408-QC26-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC27 name=IF-VLAN1408-QC27-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC28 name=IF-VLAN1408-QC28-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC29 name=IF-VLAN1408-QC29-2011-OUT vlan-id=1408
add interface=IF-EOIP-2011-QC10 name=IF-VLAN1414-QC10-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC11 name=IF-VLAN1414-QC11-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC12 name=IF-VLAN1414-QC12-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC14 name=IF-VLAN1414-QC14-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC15 name=IF-VLAN1414-QC15-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC16 name=IF-VLAN1414-QC16-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC17 name=IF-VLAN1414-QC17-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC18 name=IF-VLAN1414-QC18-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC19 name=IF-VLAN1414-QC19-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC20 name=IF-VLAN1414-QC20-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC21 name=IF-VLAN1414-QC21-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC22 name=IF-VLAN1414-QC22-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC23 name=IF-VLAN1414-QC23-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC24 name=IF-VLAN1414-QC24-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC25 name=IF-VLAN1414-QC25-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC26 name=IF-VLAN1414-QC26-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC27 name=IF-VLAN1414-QC27-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC28 name=IF-VLAN1414-QC28-2011-OUT vlan-id=1414
add interface=IF-EOIP-2011-QC29 name=IF-VLAN1414-QC29-2011-OUT vlan-id=1414
/interface bonding
add mode=802.3ad name=IF-BOND-CISCO slaves=ether1,ether2
add mode=802.3ad name=IF-BOND-CISCO-LTE slaves=ether15,ether16
/interface vlan
add interface=IF-BOND-CISCO name=IF-VLAN5-IN vlan-id=5
add interface=IF-BOND-CISCO name=IF-VLAN8-IN vlan-id=8
add interface=IF-BOND-CISCO name=IF-VLAN50-GESTION vlan-id=50
add interface=IF-BOND-CISCO-LTE name=IF-VLAN53-CISCO-LTE vlan-id=53
add interface=IF-BOND-CISCO name=IF-VLAN99-RTG-TRACKING-IN vlan-id=99
add interface=IF-BOND-CISCO name=IF-VLAN1344-IN vlan-id=1344
add interface=IF-BOND-CISCO name=IF-VLAN1401-DMZ-RTG-IN vlan-id=1401
add interface=IF-BOND-CISCO name=IF-VLAN1405-IN vlan-id=1405
add interface=IF-BOND-CISCO name=IF-VLAN1408-IN vlan-id=1408
add interface=IF-BOND-CISCO name=IF-VLAN1414-IN vlan-id=1414
add interface=IF-BOND-CISCO name=IF-VLAN1429-CCR vlan-id=1429
add interface=IF-BOND-CISCO name=IF-VLAN1700-WIFI-QC10 vlan-id=1700
add interface=IF-BOND-CISCO name=IF-VLAN1701-FIBRA1-QC10 vlan-id=1701
add interface=IF-BOND-CISCO name=IF-VLAN1702-FIBRA2-QC10 vlan-id=1702
add interface=IF-BOND-CISCO name=IF-VLAN1703-FIBRA3-QC10 vlan-id=1703
add interface=IF-BOND-CISCO name=IF-VLAN1704-WIFI-SOB-QC10 vlan-id=1704
add interface=IF-BOND-CISCO name=IF-VLAN1710-WIFI-QC11 vlan-id=1710
add interface=IF-BOND-CISCO name=IF-VLAN1711-FIBRA1-QC11 vlan-id=1711
add interface=IF-BOND-CISCO name=IF-VLAN1712-FIBRA2-QC11 vlan-id=1712
add interface=IF-BOND-CISCO name=IF-VLAN1713-FIBRA3-QC11 vlan-id=1713
add interface=IF-BOND-CISCO name=IF-VLAN1714-WIFI-SOB-QC11 vlan-id=1714
add interface=IF-BOND-CISCO name=IF-VLAN1720-WIFI-QC12 vlan-id=1720
add interface=IF-BOND-CISCO name=IF-VLAN1721-FIBRA1-QC12 vlan-id=1721
add interface=IF-BOND-CISCO name=IF-VLAN1722-FIBRA2-QC12 vlan-id=1722
add interface=IF-BOND-CISCO name=IF-VLAN1723-FIBRA3-QC12 vlan-id=1723
add interface=IF-BOND-CISCO name=IF-VLAN1724-WIFI-SOB-QC12 vlan-id=1724
add interface=IF-BOND-CISCO name=IF-VLAN1740-WIFI-QC14 vlan-id=1740
add interface=IF-BOND-CISCO name=IF-VLAN1741-FIBRA1-QC14 vlan-id=1741
add interface=IF-BOND-CISCO name=IF-VLAN1742-FIBRA2-QC14 vlan-id=1742
add interface=IF-BOND-CISCO name=IF-VLAN1743-FIBRA3-QC14 vlan-id=1743
add interface=IF-BOND-CISCO name=IF-VLAN1744-WIFI-SOB-QC14 vlan-id=1744
add interface=IF-BOND-CISCO name=IF-VLAN1750-WIFI-QC15 vlan-id=1750
add interface=IF-BOND-CISCO name=IF-VLAN1751-FIBRA1-QC15 vlan-id=1751
add interface=IF-BOND-CISCO name=IF-VLAN1752-FIBRA2-QC15 vlan-id=1752
add interface=IF-BOND-CISCO name=IF-VLAN1753-FIBRA3-QC15 vlan-id=1753
add interface=IF-BOND-CISCO name=IF-VLAN1754-WIFI-SOB-QC15 vlan-id=1754
add interface=IF-BOND-CISCO name=IF-VLAN1760-WIFI-QC16 vlan-id=1760
add interface=IF-BOND-CISCO name=IF-VLAN1761-FIBRA1-QC16 vlan-id=1761
add interface=IF-BOND-CISCO name=IF-VLAN1762-FIBRA2-QC16 vlan-id=1762
add interface=IF-BOND-CISCO name=IF-VLAN1763-FIBRA3-QC16 vlan-id=1763
add interface=IF-BOND-CISCO name=IF-VLAN1764-WIFI-SOB-QC16 vlan-id=1764
add interface=IF-BOND-CISCO name=IF-VLAN1770-WIFI-QC17 vlan-id=1770
add interface=IF-BOND-CISCO name=IF-VLAN1771-FIBRA1-QC17 vlan-id=1771
add interface=IF-BOND-CISCO name=IF-VLAN1772-FIBRA2-QC17 vlan-id=1772
add interface=IF-BOND-CISCO name=IF-VLAN1773-FIBRA3-QC17 vlan-id=1773
add interface=IF-BOND-CISCO name=IF-VLAN1774-WIFI-SOB-QC17 vlan-id=1774
add interface=IF-BOND-CISCO name=IF-VLAN1780-WIFI-QC18 vlan-id=1780
add interface=IF-BOND-CISCO name=IF-VLAN1781-FIBRA1-QC18 vlan-id=1781
add interface=IF-BOND-CISCO name=IF-VLAN1782-FIBRA2-QC18 vlan-id=1782
add interface=IF-BOND-CISCO name=IF-VLAN1783-FIBRA3-QC18 vlan-id=1783
add interface=IF-BOND-CISCO name=IF-VLAN1784-WIFI-SOB-QC18 vlan-id=1784
add interface=IF-BOND-CISCO name=IF-VLAN1790-WIFI-QC19 vlan-id=1790
add interface=IF-BOND-CISCO name=IF-VLAN1791-FIBRA1-QC19 vlan-id=1791
add interface=IF-BOND-CISCO name=IF-VLAN1792-FIBRA2-QC19 vlan-id=1792
add interface=IF-BOND-CISCO name=IF-VLAN1793-FIBRA3-QC19 vlan-id=1793
add interface=IF-BOND-CISCO name=IF-VLAN1794-WIFI-SOB-QC19 vlan-id=1794
add interface=IF-BOND-CISCO name=IF-VLAN1800-WIFI-QC20 vlan-id=1800
add interface=IF-BOND-CISCO name=IF-VLAN1801-FIBRA1-QC20 vlan-id=1801
add interface=IF-BOND-CISCO name=IF-VLAN1802-FIBRA2-QC20 vlan-id=1802
add interface=IF-BOND-CISCO name=IF-VLAN1803-FIBRA3-QC20 vlan-id=1803
add interface=IF-BOND-CISCO name=IF-VLAN1804-WIFI-SOB-QC20 vlan-id=1804
add interface=IF-BOND-CISCO name=IF-VLAN1810-WIFI-QC21 vlan-id=1810
add interface=IF-BOND-CISCO name=IF-VLAN1811-FIBRA1-QC21 vlan-id=1811
add interface=IF-BOND-CISCO name=IF-VLAN1812-FIBRA2-QC21 vlan-id=1812
add interface=IF-BOND-CISCO name=IF-VLAN1813-FIBRA3-QC21 vlan-id=1813
add interface=IF-BOND-CISCO name=IF-VLAN1814-WIFI-SOB-QC21 vlan-id=1814
add interface=IF-BOND-CISCO name=IF-VLAN1820-WIFI-QC22 vlan-id=1820
add interface=IF-BOND-CISCO name=IF-VLAN1821-FIBRA1-QC22 vlan-id=1821
add interface=IF-BOND-CISCO name=IF-VLAN1822-FIBRA2-QC22 vlan-id=1822
add interface=IF-BOND-CISCO name=IF-VLAN1823-FIBRA3-QC22 vlan-id=1823
add interface=IF-BOND-CISCO name=IF-VLAN1824-WIFI-SOB-QC22 vlan-id=1824
add interface=IF-BOND-CISCO name=IF-VLAN1830-WIFI-QC23 vlan-id=1830
add interface=IF-BOND-CISCO name=IF-VLAN1831-FIBRA1-QC23 vlan-id=1831
add interface=IF-BOND-CISCO name=IF-VLAN1832-FIBRA2-QC23 vlan-id=1832
add interface=IF-BOND-CISCO name=IF-VLAN1833-FIBRA3-QC23 vlan-id=1833
add interface=IF-BOND-CISCO name=IF-VLAN1834-WIFI-SOB-QC23 vlan-id=1834
add interface=IF-BOND-CISCO name=IF-VLAN1840-WIFI-QC24 vlan-id=1840
add interface=IF-BOND-CISCO name=IF-VLAN1841-FIBRA1-QC24 vlan-id=1841
add interface=IF-BOND-CISCO name=IF-VLAN1842-FIBRA2-QC24 vlan-id=1842
add interface=IF-BOND-CISCO name=IF-VLAN1843-FIBRA3-QC24 vlan-id=1843
add interface=IF-BOND-CISCO name=IF-VLAN1844-WIFI-SOB-QC24 vlan-id=1844
add interface=IF-BOND-CISCO name=IF-VLAN1850-WIFI-QC25 vlan-id=1850
add interface=IF-BOND-CISCO name=IF-VLAN1851-FIBRA1-QC25 vlan-id=1851
add interface=IF-BOND-CISCO name=IF-VLAN1852-FIBRA2-QC25 vlan-id=1852
add interface=IF-BOND-CISCO name=IF-VLAN1853-FIBRA3-QC25 vlan-id=1853
add interface=IF-BOND-CISCO name=IF-VLAN1854-WIFI-SOB-QC25 vlan-id=1854
add interface=IF-BOND-CISCO name=IF-VLAN1860-WIFI-QC26 vlan-id=1860
add interface=IF-BOND-CISCO name=IF-VLAN1861-FIBRA1-QC26 vlan-id=1861
add interface=IF-BOND-CISCO name=IF-VLAN1862-FIBRA2-QC26 vlan-id=1862
add interface=IF-BOND-CISCO name=IF-VLAN1863-FIBRA3-QC26 vlan-id=1863
add interface=IF-BOND-CISCO name=IF-VLAN1864-WIFI-SOB-QC26 vlan-id=1864
add interface=IF-BOND-CISCO name=IF-VLAN1870-WIFI-QC27 vlan-id=1870
add interface=IF-BOND-CISCO name=IF-VLAN1871-FIBRA1-QC27 vlan-id=1871
add interface=IF-BOND-CISCO name=IF-VLAN1872-FIBRA2-QC27 vlan-id=1872
add interface=IF-BOND-CISCO name=IF-VLAN1873-FIBRA3-QC27 vlan-id=1873
add interface=IF-BOND-CISCO name=IF-VLAN1874-WIFI-SOB-QC27 vlan-id=1874
add interface=IF-BOND-CISCO name=IF-VLAN1880-WIFI-QC28 vlan-id=1880
add interface=IF-BOND-CISCO name=IF-VLAN1881-FIBRA1-QC28 vlan-id=1881
add interface=IF-BOND-CISCO name=IF-VLAN1882-FIBRA2-QC28 vlan-id=1882
add interface=IF-BOND-CISCO name=IF-VLAN1883-FIBRA3-QC28 vlan-id=1883
add interface=IF-BOND-CISCO name=IF-VLAN1884-WIFI-SOB-QC28 vlan-id=1884
add interface=IF-BOND-CISCO name=IF-VLAN1890-WIFI-QC29 vlan-id=1890
add interface=IF-BOND-CISCO name=IF-VLAN1891-FIBRA1-QC29 vlan-id=1891
add interface=IF-BOND-CISCO name=IF-VLAN1892-FIBRA2-QC29 vlan-id=1892
add interface=IF-BOND-CISCO name=IF-VLAN1893-FIBRA3-QC29 vlan-id=1893
add interface=IF-BOND-CISCO name=IF-VLAN1894-WIFI-SOB-QC29 vlan-id=1894
/interface vrrp
add interface=IF-VLAN1701-FIBRA1-QC10 name=IF-VRRP-FIBRA1-QC10 priority=249
add interface=IF-VLAN1711-FIBRA1-QC11 name=IF-VRRP-FIBRA1-QC11 priority=249 \
    vrid=11
add interface=IF-VLAN1721-FIBRA1-QC12 name=IF-VRRP-FIBRA1-QC12 priority=249 \
    vrid=21
add interface=IF-VLAN1741-FIBRA1-QC14 name=IF-VRRP-FIBRA1-QC14 priority=249 \
    vrid=41
add interface=IF-VLAN1751-FIBRA1-QC15 name=IF-VRRP-FIBRA1-QC15 priority=249 \
    vrid=51
add interface=IF-VLAN1761-FIBRA1-QC16 name=IF-VRRP-FIBRA1-QC16 priority=249 \
    vrid=61
add interface=IF-VLAN1771-FIBRA1-QC17 name=IF-VRRP-FIBRA1-QC17 priority=249 \
    vrid=71
add interface=IF-VLAN1781-FIBRA1-QC18 name=IF-VRRP-FIBRA1-QC18 priority=249 \
    vrid=81
add interface=IF-VLAN1791-FIBRA1-QC19 name=IF-VRRP-FIBRA1-QC19 priority=249 \
    vrid=91
add interface=IF-VLAN1801-FIBRA1-QC20 name=IF-VRRP-FIBRA1-QC20 priority=249 \
    vrid=101
add interface=IF-VLAN1811-FIBRA1-QC21 name=IF-VRRP-FIBRA1-QC21 priority=249 \
    vrid=111
add interface=IF-VLAN1821-FIBRA1-QC22 name=IF-VRRP-FIBRA1-QC22 priority=249 \
    vrid=121
add interface=IF-VLAN1831-FIBRA1-QC23 name=IF-VRRP-FIBRA1-QC23 priority=249 \
    vrid=131
add interface=IF-VLAN1841-FIBRA1-QC24 name=IF-VRRP-FIBRA1-QC24 priority=249 \
    vrid=141
add interface=IF-VLAN1851-FIBRA1-QC25 name=IF-VRRP-FIBRA1-QC25 priority=249 \
    vrid=151
add interface=IF-VLAN1861-FIBRA1-QC26 name=IF-VRRP-FIBRA1-QC26 priority=249 \
    vrid=161
add interface=IF-VLAN1871-FIBRA1-QC27 name=IF-VRRP-FIBRA1-QC27 priority=249 \
    vrid=171
add interface=IF-VLAN1881-FIBRA1-QC28 name=IF-VRRP-FIBRA1-QC28 priority=249 \
    vrid=181
add interface=IF-VLAN1891-FIBRA1-QC29 name=IF-VRRP-FIBRA1-QC29 priority=249 \
    vrid=191
add interface=IF-VLAN1702-FIBRA2-QC10 name=IF-VRRP-FIBRA2-QC10 priority=249 \
    vrid=2
add interface=IF-VLAN1712-FIBRA2-QC11 name=IF-VRRP-FIBRA2-QC11 priority=249 \
    vrid=12
add interface=IF-VLAN1722-FIBRA2-QC12 name=IF-VRRP-FIBRA2-QC12 priority=249 \
    vrid=22
add interface=IF-VLAN1742-FIBRA2-QC14 name=IF-VRRP-FIBRA2-QC14 priority=249 \
    vrid=42
add interface=IF-VLAN1752-FIBRA2-QC15 name=IF-VRRP-FIBRA2-QC15 priority=249 \
    vrid=52
add interface=IF-VLAN1762-FIBRA2-QC16 name=IF-VRRP-FIBRA2-QC16 priority=249 \
    vrid=62
add interface=IF-VLAN1772-FIBRA2-QC17 name=IF-VRRP-FIBRA2-QC17 priority=249 \
    vrid=72
add interface=IF-VLAN1782-FIBRA2-QC18 name=IF-VRRP-FIBRA2-QC18 priority=249 \
    vrid=82
add interface=IF-VLAN1792-FIBRA2-QC19 name=IF-VRRP-FIBRA2-QC19 priority=249 \
    vrid=92
add interface=IF-VLAN1802-FIBRA2-QC20 name=IF-VRRP-FIBRA2-QC20 priority=249 \
    vrid=102
add interface=IF-VLAN1812-FIBRA2-QC21 name=IF-VRRP-FIBRA2-QC21 priority=249 \
    vrid=112
add interface=IF-VLAN1822-FIBRA2-QC22 name=IF-VRRP-FIBRA2-QC22 priority=249 \
    vrid=122
add interface=IF-VLAN1832-FIBRA2-QC23 name=IF-VRRP-FIBRA2-QC23 priority=249 \
    vrid=132
add interface=IF-VLAN1842-FIBRA2-QC24 name=IF-VRRP-FIBRA2-QC24 priority=249 \
    vrid=142
add interface=IF-VLAN1852-FIBRA2-QC25 name=IF-VRRP-FIBRA2-QC25 priority=249 \
    vrid=152
add interface=IF-VLAN1862-FIBRA2-QC26 name=IF-VRRP-FIBRA2-QC26 priority=249 \
    vrid=162
add interface=IF-VLAN1872-FIBRA2-QC27 name=IF-VRRP-FIBRA2-QC27 priority=249 \
    vrid=172
add interface=IF-VLAN1882-FIBRA2-QC28 name=IF-VRRP-FIBRA2-QC28 priority=249 \
    vrid=182
add interface=IF-VLAN1892-FIBRA2-QC29 name=IF-VRRP-FIBRA2-QC29 priority=249 \
    vrid=192
add interface=IF-VLAN1703-FIBRA3-QC10 name=IF-VRRP-FIBRA3-QC10 priority=249 \
    vrid=3
add interface=IF-VLAN1713-FIBRA3-QC11 name=IF-VRRP-FIBRA3-QC11 priority=249 \
    vrid=13
add interface=IF-VLAN1723-FIBRA3-QC12 name=IF-VRRP-FIBRA3-QC12 priority=249 \
    vrid=23
add interface=IF-VLAN1743-FIBRA3-QC14 name=IF-VRRP-FIBRA3-QC14 priority=249 \
    vrid=43
add interface=IF-VLAN1753-FIBRA3-QC15 name=IF-VRRP-FIBRA3-QC15 priority=249 \
    vrid=53
add interface=IF-VLAN1763-FIBRA3-QC16 name=IF-VRRP-FIBRA3-QC16 priority=249 \
    vrid=63
add interface=IF-VLAN1773-FIBRA3-QC17 name=IF-VRRP-FIBRA3-QC17 priority=249 \
    vrid=73
add interface=IF-VLAN1783-FIBRA3-QC18 name=IF-VRRP-FIBRA3-QC18 priority=249 \
    vrid=83
add interface=IF-VLAN1793-FIBRA3-QC19 name=IF-VRRP-FIBRA3-QC19 priority=249 \
    vrid=93
add interface=IF-VLAN1803-FIBRA3-QC20 name=IF-VRRP-FIBRA3-QC20 priority=249 \
    vrid=103
add interface=IF-VLAN1813-FIBRA3-QC21 name=IF-VRRP-FIBRA3-QC21 priority=249 \
    vrid=113
add interface=IF-VLAN1823-FIBRA3-QC22 name=IF-VRRP-FIBRA3-QC22 priority=249 \
    vrid=123
add interface=IF-VLAN1833-FIBRA3-QC23 name=IF-VRRP-FIBRA3-QC23 priority=249 \
    vrid=133
add interface=IF-VLAN1843-FIBRA3-QC24 name=IF-VRRP-FIBRA3-QC24 priority=249 \
    vrid=143
add interface=IF-VLAN1853-FIBRA3-QC25 name=IF-VRRP-FIBRA3-QC25 priority=249 \
    vrid=153
add interface=IF-VLAN1863-FIBRA3-QC26 name=IF-VRRP-FIBRA3-QC26 priority=249 \
    vrid=163
add interface=IF-VLAN1873-FIBRA3-QC27 name=IF-VRRP-FIBRA3-QC27 priority=249 \
    vrid=173
add interface=IF-VLAN1883-FIBRA3-QC28 name=IF-VRRP-FIBRA3-QC28 priority=249 \
    vrid=183
add interface=IF-VLAN1893-FIBRA3-QC29 name=IF-VRRP-FIBRA3-QC29 priority=249 \
    vrid=193
add interface=IF-VLAN53-CISCO-LTE name=IF-VRRP-LTE priority=249 vrid=6
add interface=IF-VLAN1700-WIFI-QC10 name=IF-VRRP-WIFI-QC10 priority=249 vrid=\
    5
add interface=IF-VLAN1710-WIFI-QC11 name=IF-VRRP-WIFI-QC11 priority=249 vrid=\
    15
add interface=IF-VLAN1720-WIFI-QC12 name=IF-VRRP-WIFI-QC12 priority=249 vrid=\
    25
add interface=IF-VLAN1740-WIFI-QC14 name=IF-VRRP-WIFI-QC14 priority=249 vrid=\
    45
add interface=IF-VLAN1750-WIFI-QC15 name=IF-VRRP-WIFI-QC15 priority=249 vrid=\
    55
add interface=IF-VLAN1760-WIFI-QC16 name=IF-VRRP-WIFI-QC16 priority=249 vrid=\
    65
add interface=IF-VLAN1770-WIFI-QC17 name=IF-VRRP-WIFI-QC17 priority=249 vrid=\
    75
add interface=IF-VLAN1780-WIFI-QC18 name=IF-VRRP-WIFI-QC18 priority=249 vrid=\
    85
add interface=IF-VLAN1790-WIFI-QC19 name=IF-VRRP-WIFI-QC19 priority=249 vrid=\
    95
add interface=IF-VLAN1800-WIFI-QC20 name=IF-VRRP-WIFI-QC20 priority=249 vrid=\
    105
add interface=IF-VLAN1810-WIFI-QC21 name=IF-VRRP-WIFI-QC21 priority=249 vrid=\
    115
add interface=IF-VLAN1820-WIFI-QC22 name=IF-VRRP-WIFI-QC22 priority=249 vrid=\
    125
add interface=IF-VLAN1830-WIFI-QC23 name=IF-VRRP-WIFI-QC23 priority=249 vrid=\
    135
add interface=IF-VLAN1840-WIFI-QC24 name=IF-VRRP-WIFI-QC24 priority=249 vrid=\
    145
add interface=IF-VLAN1850-WIFI-QC25 name=IF-VRRP-WIFI-QC25 priority=249 vrid=\
    155
add interface=IF-VLAN1860-WIFI-QC26 name=IF-VRRP-WIFI-QC26 priority=249 vrid=\
    165
add interface=IF-VLAN1870-WIFI-QC27 name=IF-VRRP-WIFI-QC27 priority=249 vrid=\
    175
add interface=IF-VLAN1880-WIFI-QC28 name=IF-VRRP-WIFI-QC28 priority=249 vrid=\
    185
add interface=IF-VLAN1890-WIFI-QC29 name=IF-VRRP-WIFI-QC29 priority=249 vrid=\
    195
add interface=IF-VLAN1704-WIFI-SOB-QC10 name=IF-VRRP-WIFI-SOB-QC10 priority=\
    249 vrid=4
add interface=IF-VLAN1714-WIFI-SOB-QC11 name=IF-VRRP-WIFI-SOB-QC11 priority=\
    249 vrid=14
add interface=IF-VLAN1724-WIFI-SOB-QC12 name=IF-VRRP-WIFI-SOB-QC12 priority=\
    249 vrid=24
add interface=IF-VLAN1744-WIFI-SOB-QC14 name=IF-VRRP-WIFI-SOB-QC14 priority=\
    249 vrid=44
add interface=IF-VLAN1754-WIFI-SOB-QC15 name=IF-VRRP-WIFI-SOB-QC15 priority=\
    249 vrid=54
add interface=IF-VLAN1764-WIFI-SOB-QC16 name=IF-VRRP-WIFI-SOB-QC16 priority=\
    249 vrid=64
add interface=IF-VLAN1774-WIFI-SOB-QC17 name=IF-VRRP-WIFI-SOB-QC17 priority=\
    249 vrid=74
add interface=IF-VLAN1784-WIFI-SOB-QC18 name=IF-VRRP-WIFI-SOB-QC18 priority=\
    249 vrid=84
add interface=IF-VLAN1794-WIFI-SOB-QC19 name=IF-VRRP-WIFI-SOB-QC19 priority=\
    249 vrid=94
add interface=IF-VLAN1804-WIFI-SOB-QC20 name=IF-VRRP-WIFI-SOB-QC20 priority=\
    249 vrid=104
add interface=IF-VLAN1814-WIFI-SOB-QC21 name=IF-VRRP-WIFI-SOB-QC21 priority=\
    249 vrid=114
add interface=IF-VLAN1824-WIFI-SOB-QC22 name=IF-VRRP-WIFI-SOB-QC22 priority=\
    249 vrid=124
add interface=IF-VLAN1834-WIFI-SOB-QC23 name=IF-VRRP-WIFI-SOB-QC23 priority=\
    249 vrid=134
add interface=IF-VLAN1844-WIFI-SOB-QC24 name=IF-VRRP-WIFI-SOB-QC24 priority=\
    249 vrid=144
add interface=IF-VLAN1854-WIFI-SOB-QC25 name=IF-VRRP-WIFI-SOB-QC25 priority=\
    249 vrid=154
add interface=IF-VLAN1864-WIFI-SOB-QC26 name=IF-VRRP-WIFI-SOB-QC26 priority=\
    249 vrid=164
add interface=IF-VLAN1874-WIFI-SOB-QC27 name=IF-VRRP-WIFI-SOB-QC27 priority=\
    249 vrid=174
add interface=IF-VLAN1884-WIFI-SOB-QC28 name=IF-VRRP-WIFI-SOB-QC28 priority=\
    249 vrid=184
add interface=IF-VLAN1894-WIFI-SOB-QC29 name=IF-VRRP-WIFI-SOB-QC29 priority=\
    249 vrid=194
/interface list
add name=Management
add include=dynamic name=Core
/port
set 0 name=serial0
/routing bgp instance
add as=65000 disabled=no name=QC10 router-id=172.19.10.241
add as=65000 disabled=no name=QC11 router-id=172.19.11.241
add as=65000 disabled=no name=QC12 router-id=172.19.12.241
add as=65000 disabled=no name=QC14 router-id=172.19.14.241
add as=65000 disabled=no name=QC15 router-id=172.19.15.241
add as=65000 disabled=no name=QC16 router-id=172.19.16.241
add as=65000 disabled=no name=QC17 router-id=172.19.17.241
add as=65000 disabled=no name=QC18 router-id=172.19.18.241
add as=65000 disabled=no name=QC19 router-id=172.19.19.241
add as=65000 disabled=no name=QC20 router-id=172.19.20.241
add as=65000 disabled=no name=QC21 router-id=172.19.21.241
add as=65000 disabled=no name=QC22 router-id=172.19.22.241
add as=65000 disabled=no name=QC23 router-id=172.19.23.241
add as=65000 disabled=no name=QC24 router-id=172.19.24.241
add as=65000 disabled=no name=QC25 router-id=172.19.25.241
add as=65000 disabled=no name=QC26 router-id=172.19.26.241
add as=65000 disabled=no name=QC27 router-id=172.19.27.241
add as=65000 disabled=no name=QC28 router-id=172.19.28.241
add as=65000 disabled=no name=QC29 router-id=172.19.29.241
/routing bgp template
add as=65000 disabled=no name=QC10 output.network=Lo-QC10 routing-table=main
add as=65000 disabled=no name=QC11 output.network=Lo-QC11 routing-table=main
add as=65000 disabled=no name=QC12 output.network=Lo-QC12 routing-table=main
add as=65000 disabled=no name=QC14 output.network=Lo-QC14 routing-table=main
add as=65000 disabled=no name=QC15 output.network=Lo-QC15 routing-table=main
add as=65000 disabled=no name=QC16 output.network=Lo-QC16 routing-table=main
add as=65000 disabled=no name=QC17 output.network=Lo-QC17 routing-table=main
add as=65000 disabled=no name=QC18 output.network=Lo-QC18 routing-table=main
add as=65000 disabled=no name=QC19 output.network=Lo-QC19 routing-table=main
add as=65000 disabled=no name=QC20 output.network=Lo-QC20 routing-table=main
add as=65000 disabled=no name=QC21 output.network=Lo-QC21 routing-table=main
add as=65000 disabled=no name=QC22 output.network=Lo-QC22 routing-table=main
add as=65000 disabled=no name=QC23 output.network=Lo-QC23 routing-table=main
add as=65000 disabled=no name=QC24 output.network=Lo-QC24 routing-table=main
add as=65000 disabled=no name=QC25 output.network=Lo-QC25 routing-table=main
add as=65000 disabled=no name=QC26 output.network=Lo-QC26 routing-table=main
add as=65000 disabled=no name=QC27 output.network=Lo-QC27 routing-table=main
add as=65000 disabled=no name=QC28 output.network=Lo-QC28 routing-table=main
add as=65000 disabled=no name=QC29 output.network=Lo-QC29 routing-table=main
/snmp community
set [ find default=yes ] disabled=yes
add addresses=::/0 authentication-password=1234567890 encryption-password=\
    1234567890 encryption-protocol=AES name=snmp4otnetwork security=\
    authorized
/interface bridge port
add bridge=BR_VLAN8 interface=IF-VLAN8-IN
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC10-SOB-OUT
add bridge=BR_VLAN1344 interface=IF-VLAN1344-IN
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC10-2011-OUT
add bridge=BR_VLAN1414 interface=IF-VLAN1414-IN
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC10-2011-OUT
add bridge=BR_VLAN1408 interface=IF-VLAN1408-IN
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC10-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-IN
add bridge=BR_VLAN1401 interface=IF-VLAN1401-DMZ-RTG-IN
add bridge=BR_VLAN1401 interface=IF-VLAN1401-DMZ-RTG-QC11-2011-OUT
add bridge=BR_VLAN1401 interface=IF-VLAN1401-DMZ-RTG-QC14-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC10-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC11-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC11-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC11-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC11-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC11-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC12-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC12-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC12-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC12-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC12-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC28-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC28-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC28-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC28-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC28-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC29-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC29-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC29-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC29-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC29-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC26-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC26-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC26-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC26-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC26-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC14-SOB-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC14-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC11-2011-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC14-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC14-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC14-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC14-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC22-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC22-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC22-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC22-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC22-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC21-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC21-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC21-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC21-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC21-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC18-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC18-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC18-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC18-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC18-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC19-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC19-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC19-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC19-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC19-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC17-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC17-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC17-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC17-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC17-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC25-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC25-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC25-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC25-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC25-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC15-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC15-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC15-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC15-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC15-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC16-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC16-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC16-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC16-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC16-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC27-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC27-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC27-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC27-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC27-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC20-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC20-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC20-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC20-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC20-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC23-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC23-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC23-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC23-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC23-2011-OUT
add bridge=BR_VLAN8 horizon=10 interface=IF-VLAN8-QC24-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 interface=IF-VLAN1344-QC24-2011-OUT
add bridge=BR_VLAN1405 interface=IF-VLAN1405-QC24-2011-OUT
add bridge=BR_VLAN1408 horizon=10 interface=IF-VLAN1408-QC24-2011-OUT
add bridge=BR_VLAN1414 horizon=10 interface=IF-VLAN1414-QC24-2011-OUT
add bridge=BR_VLAN5 interface=IF-VLAN5-IN
add bridge=BR_VLAN5 interface=IF-VLAN5-QC14-2011-OUT
add bridge=BR_VLAN50 interface=IF-VLAN50-GESTION
add bridge=BR_VLAN50 interface=IF-VLAN50-QC11-2011-OUT
add bridge=BR_VLAN50 interface=IF-VLAN50-QC14-2011-OUT
add bridge=BR_VLAN99 interface=IF-VLAN99-QC11-2011-OUT
add bridge=BR_VLAN99 interface=IF-VLAN99-QC14-2011-OUT
add bridge=BR_VLAN99 interface=IF-VLAN99-RTG-TRACKING-IN
/ip firewall connection tracking
set enabled=yes
/ip neighbor discovery-settings
set discover-interface-list=Management
/ipv6 settings
set disable-ipv6=yes
/interface l2tp-server server
set default-profile=default enabled=yes ipsec-secret=tunel-LTE use-ipsec=yes
/interface list member
add interface=BR_VLAN50 list=Management
add interface=ether3 list=Management
add interface=IF-VRRP-VLAN50 list=Management
add interface=IF-EOIP-2011-QC10 list=Core
add interface=IF-EOIP-2011-QC11 list=Core
add interface=IF-EOIP-2011-QC12 list=Core
add interface=IF-EOIP-2011-QC14 list=Core
add interface=IF-EOIP-2011-QC15 list=Core
add interface=IF-EOIP-2011-QC16 list=Core
add interface=IF-EOIP-2011-QC17 list=Core
add interface=IF-EOIP-2011-QC18 list=Core
add interface=IF-EOIP-2011-QC19 list=Core
add interface=IF-EOIP-2011-QC20 list=Core
add interface=IF-EOIP-2011-QC21 list=Core
add interface=IF-EOIP-2011-QC22 list=Core
add interface=IF-EOIP-2011-QC23 list=Core
add interface=IF-EOIP-2011-QC24 list=Core
add interface=IF-EOIP-2011-QC25 list=Core
add interface=IF-EOIP-2011-QC26 list=Core
add interface=IF-EOIP-2011-QC27 list=Core
add interface=IF-EOIP-2011-QC28 list=Core
add interface=IF-EOIP-2011-QC29 list=Core
add interface=IF-EOIP-SOB-QC10 list=Core
add interface=IF-EOIP-SOB-QC11 list=Core
add interface=IF-EOIP-SOB-QC12 list=Core
add interface=IF-EOIP-SOB-QC14 list=Core
add interface=IF-EOIP-SOB-QC15 list=Core
add interface=IF-EOIP-SOB-QC16 list=Core
add interface=IF-EOIP-SOB-QC17 list=Core
add interface=IF-EOIP-SOB-QC18 list=Core
add interface=IF-EOIP-SOB-QC19 list=Core
add interface=IF-EOIP-SOB-QC20 list=Core
add interface=IF-EOIP-SOB-QC21 list=Core
add interface=IF-EOIP-SOB-QC22 list=Core
add interface=IF-EOIP-SOB-QC23 list=Core
add interface=IF-EOIP-SOB-QC24 list=Core
add interface=IF-EOIP-SOB-QC25 list=Core
add interface=IF-EOIP-SOB-QC26 list=Core
add interface=IF-EOIP-SOB-QC27 list=Core
add interface=IF-EOIP-SOB-QC28 list=Core
add interface=IF-EOIP-SOB-QC29 list=Core
add interface=IF-BOND-CISCO list=Core
add interface=IF-BOND-CISCO-LTE list=Core
/ip address
add address=172.19.10.2/28 interface=IF-VRRP-FIBRA1-QC10 network=172.19.10.0
add address=172.19.10.18/28 interface=IF-VRRP-FIBRA2-QC10 network=\
    172.19.10.16
add address=172.19.10.34/28 interface=IF-VRRP-FIBRA3-QC10 network=\
    172.19.10.32
add address=172.19.10.50/28 interface=IF-VRRP-WIFI-SOB-QC10 network=\
    172.19.10.48
add address=172.19.10.66/28 interface=IF-VRRP-WIFI-QC10 network=172.19.10.64
add address=172.19.10.241 interface=lo network=172.19.10.241
add address=172.17.1.201/24 interface=BR_VLAN50 network=172.17.1.0
add address=172.19.10.177/30 interface=IF-VLAN1701-FIBRA1-QC10 network=\
    172.19.10.176
add address=172.19.10.181/30 interface=IF-VLAN1702-FIBRA2-QC10 network=\
    172.19.10.180
add address=172.19.10.185/30 interface=IF-VLAN1703-FIBRA3-QC10 network=\
    172.19.10.184
add address=172.19.10.189/30 interface=IF-VLAN1704-WIFI-SOB-QC10 network=\
    172.19.10.188
add address=172.19.10.193/30 interface=IF-VLAN1700-WIFI-QC10 network=\
    172.19.10.192
add address=10.34.183.232/28 interface=IF-VLAN53-CISCO-LTE network=\
    10.34.183.224
add address=172.19.11.241 interface=lo network=172.19.11.241
add address=172.19.11.189/30 interface=IF-VLAN1714-WIFI-SOB-QC11 network=\
    172.19.11.188
add address=172.19.11.193/30 interface=IF-VLAN1710-WIFI-QC11 network=\
    172.19.11.192
add address=172.19.12.181/30 interface=IF-VLAN1722-FIBRA2-QC12 network=\
    172.19.12.180
add address=172.19.11.177/30 interface=IF-VLAN1711-FIBRA1-QC11 network=\
    172.19.11.176
add address=172.19.11.185/30 interface=IF-VLAN1713-FIBRA3-QC11 network=\
    172.19.11.184
add address=172.19.11.2/28 interface=IF-VRRP-FIBRA1-QC11 network=172.19.11.0
add address=172.19.11.18/28 interface=IF-VRRP-FIBRA2-QC11 network=\
    172.19.11.16
add address=172.19.11.34/28 interface=IF-VRRP-FIBRA3-QC11 network=\
    172.19.11.32
add address=172.19.11.66/28 interface=IF-VRRP-WIFI-QC11 network=172.19.11.64
add address=172.19.11.50/28 interface=IF-VRRP-WIFI-SOB-QC11 network=\
    172.19.11.48
add address=172.19.12.241 interface=lo network=172.19.12.241
add address=172.19.12.2/28 interface=IF-VRRP-FIBRA1-QC12 network=172.19.12.0
add address=172.19.28.18/28 interface=IF-VRRP-FIBRA2-QC28 network=\
    172.19.28.16
add address=172.19.12.34/28 interface=IF-VRRP-FIBRA3-QC12 network=\
    172.19.12.32
add address=172.19.12.50/28 interface=IF-VRRP-WIFI-SOB-QC12 network=\
    172.19.12.48
add address=172.19.12.66/28 interface=IF-VRRP-WIFI-QC12 network=172.19.12.64
add address=172.19.12.177/30 interface=IF-VLAN1721-FIBRA1-QC12 network=\
    172.19.12.176
add address=172.19.12.189/30 interface=IF-VLAN1724-WIFI-SOB-QC12 network=\
    172.19.12.188
add address=172.19.12.193/30 interface=IF-VLAN1720-WIFI-QC12 network=\
    172.19.12.192
add address=172.19.11.181/30 interface=IF-VLAN1712-FIBRA2-QC11 network=\
    172.19.11.180
add address=172.19.12.185/30 interface=IF-VLAN1723-FIBRA3-QC12 network=\
    172.19.12.184
add address=172.19.28.241 interface=lo network=172.19.28.241
add address=172.19.28.2/28 interface=IF-VRRP-FIBRA1-QC28 network=172.19.28.0
add address=172.19.12.18/28 interface=IF-VRRP-FIBRA2-QC12 network=\
    172.19.12.16
add address=172.19.28.34/28 interface=IF-VRRP-FIBRA3-QC28 network=\
    172.19.28.32
add address=172.19.28.50/28 interface=IF-VRRP-WIFI-SOB-QC28 network=\
    172.19.28.48
add address=172.19.28.66/28 interface=IF-VRRP-WIFI-QC28 network=172.19.28.64
add address=172.19.28.177/30 interface=IF-VLAN1881-FIBRA1-QC28 network=\
    172.19.28.176
add address=172.19.28.181/30 interface=IF-VLAN1882-FIBRA2-QC28 network=\
    172.19.28.180
add address=172.19.28.185/30 interface=IF-VLAN1883-FIBRA3-QC28 network=\
    172.19.28.184
add address=172.19.28.189/30 interface=IF-VLAN1884-WIFI-SOB-QC28 network=\
    172.19.28.188
add address=172.19.28.193/30 interface=IF-VLAN1880-WIFI-QC28 network=\
    172.19.28.192
add address=172.19.29.241 interface=lo network=172.19.29.241
add address=172.19.29.2/28 interface=IF-VRRP-FIBRA1-QC29 network=172.19.29.0
add address=172.19.29.18/28 interface=IF-VRRP-FIBRA2-QC29 network=\
    172.19.29.16
add address=172.19.29.34/28 interface=IF-VRRP-FIBRA3-QC29 network=\
    172.19.29.32
add address=172.19.29.50/28 interface=IF-VRRP-WIFI-SOB-QC29 network=\
    172.19.29.48
add address=172.19.29.66/28 interface=IF-VRRP-WIFI-QC29 network=172.19.29.64
add address=172.19.29.177/30 interface=IF-VLAN1891-FIBRA1-QC29 network=\
    172.19.29.176
add address=172.19.29.181/30 interface=IF-VLAN1892-FIBRA2-QC29 network=\
    172.19.29.180
add address=172.19.29.185/30 interface=IF-VLAN1893-FIBRA3-QC29 network=\
    172.19.29.184
add address=172.19.29.189/30 interface=IF-VLAN1894-WIFI-SOB-QC29 network=\
    172.19.29.188
add address=172.19.29.193/30 interface=IF-VLAN1890-WIFI-QC29 network=\
    172.19.29.192
add address=172.19.26.241 interface=lo network=172.19.26.241
add address=172.19.26.2/28 interface=IF-VRRP-FIBRA1-QC26 network=172.19.26.0
add address=172.19.26.18/28 interface=IF-VRRP-FIBRA2-QC26 network=\
    172.19.26.16
add address=172.19.26.34/28 interface=IF-VRRP-FIBRA3-QC26 network=\
    172.19.26.32
add address=172.19.26.50/28 interface=IF-VRRP-WIFI-SOB-QC26 network=\
    172.19.26.48
add address=172.19.26.66/28 interface=IF-VRRP-WIFI-QC26 network=172.19.26.64
add address=172.19.26.177/30 interface=IF-VLAN1861-FIBRA1-QC26 network=\
    172.19.26.176
add address=172.19.26.181/30 interface=IF-VLAN1862-FIBRA2-QC26 network=\
    172.19.26.180
add address=172.19.26.185/30 interface=IF-VLAN1863-FIBRA3-QC26 network=\
    172.19.26.184
add address=172.19.26.189/30 interface=IF-VLAN1864-WIFI-SOB-QC26 network=\
    172.19.26.188
add address=172.19.26.193/30 interface=IF-VLAN1860-WIFI-QC26 network=\
    172.19.26.192
add address=172.19.14.241 interface=lo network=172.19.14.241
add address=172.19.14.2/28 interface=IF-VRRP-FIBRA1-QC14 network=172.19.14.0
add address=172.19.14.18/28 interface=IF-VRRP-FIBRA2-QC14 network=\
    172.19.14.16
add address=172.19.14.34/28 interface=IF-VRRP-FIBRA3-QC14 network=\
    172.19.14.32
add address=172.19.14.50/28 interface=IF-VRRP-WIFI-SOB-QC14 network=\
    172.19.14.48
add address=172.19.14.66/28 interface=IF-VRRP-WIFI-QC14 network=172.19.14.64
add address=172.19.14.177/30 interface=IF-VLAN1741-FIBRA1-QC14 network=\
    172.19.14.176
add address=172.19.14.181/30 interface=IF-VLAN1742-FIBRA2-QC14 network=\
    172.19.14.180
add address=172.19.14.185/30 interface=IF-VLAN1743-FIBRA3-QC14 network=\
    172.19.14.184
add address=172.19.14.189/30 interface=IF-VLAN1744-WIFI-SOB-QC14 network=\
    172.19.14.188
add address=172.19.14.193/30 interface=IF-VLAN1740-WIFI-QC14 network=\
    172.19.14.192
add address=172.19.22.241 interface=lo network=172.19.22.241
add address=172.19.22.2/28 interface=IF-VRRP-FIBRA1-QC22 network=172.19.22.0
add address=172.19.22.18/28 interface=IF-VRRP-FIBRA2-QC22 network=\
    172.19.22.16
add address=172.19.22.34/28 interface=IF-VRRP-FIBRA3-QC22 network=\
    172.19.22.32
add address=172.19.22.50/28 interface=IF-VRRP-WIFI-SOB-QC22 network=\
    172.19.22.48
add address=172.19.22.66/28 interface=IF-VRRP-WIFI-QC22 network=172.19.22.64
add address=172.19.22.177/30 interface=IF-VLAN1821-FIBRA1-QC22 network=\
    172.19.22.176
add address=172.19.22.181/30 interface=IF-VLAN1822-FIBRA2-QC22 network=\
    172.19.22.180
add address=172.19.22.185/30 interface=IF-VLAN1823-FIBRA3-QC22 network=\
    172.19.22.184
add address=172.19.22.189/30 interface=IF-VLAN1824-WIFI-SOB-QC22 network=\
    172.19.22.188
add address=172.19.22.193/30 interface=IF-VLAN1820-WIFI-QC22 network=\
    172.19.22.192
add address=172.19.21.241 interface=lo network=172.19.21.241
add address=172.19.21.2/28 interface=IF-VRRP-FIBRA1-QC21 network=172.19.21.0
add address=172.19.21.18/28 interface=IF-VRRP-FIBRA2-QC21 network=\
    172.19.21.16
add address=172.19.21.34/28 interface=IF-VRRP-FIBRA3-QC21 network=\
    172.19.21.32
add address=172.19.21.50/28 interface=IF-VRRP-WIFI-SOB-QC21 network=\
    172.19.21.48
add address=172.19.21.66/28 interface=IF-VRRP-WIFI-QC21 network=172.19.21.64
add address=172.19.21.177/30 interface=IF-VLAN1811-FIBRA1-QC21 network=\
    172.19.21.176
add address=172.19.21.181/30 interface=IF-VLAN1812-FIBRA2-QC21 network=\
    172.19.21.180
add address=172.19.21.185/30 interface=IF-VLAN1813-FIBRA3-QC21 network=\
    172.19.21.184
add address=172.19.21.189/30 interface=IF-VLAN1814-WIFI-SOB-QC21 network=\
    172.19.21.188
add address=172.19.21.193/30 interface=IF-VLAN1810-WIFI-QC21 network=\
    172.19.21.192
add address=172.19.18.241 interface=lo network=172.19.18.241
add address=172.19.18.2/28 interface=IF-VRRP-FIBRA1-QC18 network=172.19.18.0
add address=172.19.18.18/28 interface=IF-VRRP-FIBRA2-QC18 network=\
    172.19.18.16
add address=172.19.18.34/28 interface=IF-VRRP-FIBRA3-QC18 network=\
    172.19.18.32
add address=172.19.18.50/28 interface=IF-VRRP-WIFI-SOB-QC18 network=\
    172.19.18.48
add address=172.19.18.66/28 interface=IF-VRRP-WIFI-QC18 network=172.19.18.64
add address=172.19.18.177/30 interface=IF-VLAN1781-FIBRA1-QC18 network=\
    172.19.18.176
add address=172.19.18.181/30 interface=IF-VLAN1782-FIBRA2-QC18 network=\
    172.19.18.180
add address=172.19.18.185/30 interface=IF-VLAN1783-FIBRA3-QC18 network=\
    172.19.18.184
add address=172.19.18.189/30 interface=IF-VLAN1784-WIFI-SOB-QC18 network=\
    172.19.18.188
add address=172.19.18.193/30 interface=IF-VLAN1780-WIFI-QC18 network=\
    172.19.18.192
add address=172.19.19.241 interface=lo network=172.19.19.241
add address=172.19.19.2/28 interface=IF-VRRP-FIBRA1-QC19 network=172.19.19.0
add address=172.19.19.18/28 interface=IF-VRRP-FIBRA2-QC19 network=\
    172.19.19.16
add address=172.19.19.34/28 interface=IF-VRRP-FIBRA3-QC19 network=\
    172.19.19.32
add address=172.19.19.50/28 interface=IF-VRRP-WIFI-SOB-QC19 network=\
    172.19.19.48
add address=172.19.19.66/28 interface=IF-VRRP-WIFI-QC19 network=172.19.19.64
add address=172.19.19.177/30 interface=IF-VLAN1791-FIBRA1-QC19 network=\
    172.19.19.176
add address=172.19.19.181/30 interface=IF-VLAN1792-FIBRA2-QC19 network=\
    172.19.19.180
add address=172.19.19.185/30 interface=IF-VLAN1793-FIBRA3-QC19 network=\
    172.19.19.184
add address=172.19.19.189/30 interface=IF-VLAN1794-WIFI-SOB-QC19 network=\
    172.19.19.188
add address=172.19.19.193/30 interface=IF-VLAN1790-WIFI-QC19 network=\
    172.19.19.192
add address=172.19.17.241 interface=lo network=172.19.17.241
add address=172.19.17.2/28 interface=IF-VRRP-FIBRA1-QC17 network=172.19.17.0
add address=172.19.17.18/28 interface=IF-VRRP-FIBRA2-QC17 network=\
    172.19.17.16
add address=172.19.17.34/28 interface=IF-VRRP-FIBRA3-QC17 network=\
    172.19.17.32
add address=172.19.17.50/28 interface=IF-VRRP-WIFI-SOB-QC17 network=\
    172.19.17.48
add address=172.19.17.66/28 interface=IF-VRRP-WIFI-QC17 network=172.19.17.64
add address=172.19.17.177/30 interface=IF-VLAN1771-FIBRA1-QC17 network=\
    172.19.17.176
add address=172.19.17.181/30 interface=IF-VLAN1772-FIBRA2-QC17 network=\
    172.19.17.180
add address=172.19.17.185/30 interface=IF-VLAN1773-FIBRA3-QC17 network=\
    172.19.17.184
add address=172.19.17.189/30 interface=IF-VLAN1774-WIFI-SOB-QC17 network=\
    172.19.17.188
add address=172.19.17.193/30 interface=IF-VLAN1770-WIFI-QC17 network=\
    172.19.17.192
add address=172.19.25.241 interface=lo network=172.19.25.241
add address=172.19.25.2/28 interface=IF-VRRP-FIBRA1-QC25 network=172.19.25.0
add address=172.19.25.18/28 interface=IF-VRRP-FIBRA2-QC25 network=\
    172.19.25.16
add address=172.19.25.34/28 interface=IF-VRRP-FIBRA3-QC25 network=\
    172.19.25.32
add address=172.19.25.50/28 interface=IF-VRRP-WIFI-SOB-QC25 network=\
    172.19.25.48
add address=172.19.25.66/28 interface=IF-VRRP-WIFI-QC25 network=172.19.25.64
add address=172.19.25.177/30 interface=IF-VLAN1851-FIBRA1-QC25 network=\
    172.19.25.176
add address=172.19.25.181/30 interface=IF-VLAN1852-FIBRA2-QC25 network=\
    172.19.25.180
add address=172.19.25.185/30 interface=IF-VLAN1853-FIBRA3-QC25 network=\
    172.19.25.184
add address=172.19.25.189/30 interface=IF-VLAN1854-WIFI-SOB-QC25 network=\
    172.19.25.188
add address=172.19.25.193/30 interface=IF-VLAN1850-WIFI-QC25 network=\
    172.19.25.192
add address=172.19.15.241 interface=lo network=172.19.15.241
add address=172.19.15.2/28 interface=IF-VRRP-FIBRA1-QC15 network=172.19.15.0
add address=172.19.15.18/28 interface=IF-VRRP-FIBRA2-QC15 network=\
    172.19.15.16
add address=172.19.15.34/28 interface=IF-VRRP-FIBRA3-QC15 network=\
    172.19.15.32
add address=172.19.15.50/28 interface=IF-VRRP-WIFI-SOB-QC15 network=\
    172.19.15.48
add address=172.19.15.66/28 interface=IF-VRRP-WIFI-QC15 network=172.19.15.64
add address=172.19.15.177/30 interface=IF-VLAN1751-FIBRA1-QC15 network=\
    172.19.15.176
add address=172.19.15.181/30 interface=IF-VLAN1752-FIBRA2-QC15 network=\
    172.19.15.180
add address=172.19.15.185/30 interface=IF-VLAN1753-FIBRA3-QC15 network=\
    172.19.15.184
add address=172.19.15.189/30 interface=IF-VLAN1754-WIFI-SOB-QC15 network=\
    172.19.15.188
add address=172.19.15.193/30 interface=IF-VLAN1750-WIFI-QC15 network=\
    172.19.15.192
add address=172.19.16.241 interface=lo network=172.19.16.241
add address=172.19.16.2/28 interface=IF-VRRP-FIBRA1-QC16 network=172.19.16.0
add address=172.19.16.18/28 interface=IF-VRRP-FIBRA2-QC16 network=\
    172.19.16.16
add address=172.19.16.34/28 interface=IF-VRRP-FIBRA3-QC16 network=\
    172.19.16.32
add address=172.19.16.50/28 interface=IF-VRRP-WIFI-SOB-QC16 network=\
    172.19.16.48
add address=172.19.16.66/28 interface=IF-VRRP-WIFI-QC16 network=172.19.16.64
add address=172.19.16.177/30 interface=IF-VLAN1761-FIBRA1-QC16 network=\
    172.19.16.176
add address=172.19.16.181/30 interface=IF-VLAN1762-FIBRA2-QC16 network=\
    172.19.16.180
add address=172.19.16.185/30 interface=IF-VLAN1763-FIBRA3-QC16 network=\
    172.19.16.184
add address=172.19.16.189/30 interface=IF-VLAN1764-WIFI-SOB-QC16 network=\
    172.19.16.188
add address=172.19.16.193/30 interface=IF-VLAN1760-WIFI-QC16 network=\
    172.19.16.192
add address=172.19.27.241 interface=lo network=172.19.27.241
add address=172.19.27.2/28 interface=IF-VRRP-FIBRA1-QC27 network=172.19.27.0
add address=172.19.27.18/28 interface=IF-VRRP-FIBRA2-QC27 network=\
    172.19.27.16
add address=172.19.27.34/28 interface=IF-VRRP-FIBRA3-QC27 network=\
    172.19.27.32
add address=172.19.27.50/28 interface=IF-VRRP-WIFI-SOB-QC27 network=\
    172.19.27.48
add address=172.19.27.66/28 interface=IF-VRRP-WIFI-QC27 network=172.19.27.64
add address=172.19.27.177/30 interface=IF-VLAN1871-FIBRA1-QC27 network=\
    172.19.27.176
add address=172.19.27.181/30 interface=IF-VLAN1872-FIBRA2-QC27 network=\
    172.19.27.180
add address=172.19.27.185/30 interface=IF-VLAN1873-FIBRA3-QC27 network=\
    172.19.27.184
add address=172.19.27.189/30 interface=IF-VLAN1874-WIFI-SOB-QC27 network=\
    172.19.27.188
add address=172.19.27.193/30 interface=IF-VLAN1870-WIFI-QC27 network=\
    172.19.27.192
add address=172.19.20.241 interface=lo network=172.19.20.241
add address=172.19.20.2/28 interface=IF-VRRP-FIBRA1-QC20 network=172.19.20.0
add address=172.19.20.18/28 interface=IF-VRRP-FIBRA2-QC20 network=\
    172.19.20.16
add address=172.19.20.34/28 interface=IF-VRRP-FIBRA3-QC20 network=\
    172.19.20.32
add address=172.19.20.50/28 interface=IF-VRRP-WIFI-SOB-QC20 network=\
    172.19.20.48
add address=172.19.20.66/28 interface=IF-VRRP-WIFI-QC20 network=172.19.20.64
add address=172.19.20.177/30 interface=IF-VLAN1801-FIBRA1-QC20 network=\
    172.19.20.176
add address=172.19.20.181/30 interface=IF-VLAN1802-FIBRA2-QC20 network=\
    172.19.20.180
add address=172.19.20.185/30 interface=IF-VLAN1803-FIBRA3-QC20 network=\
    172.19.20.184
add address=172.19.20.189/30 interface=IF-VLAN1804-WIFI-SOB-QC20 network=\
    172.19.20.188
add address=172.19.20.193/30 interface=IF-VLAN1800-WIFI-QC20 network=\
    172.19.20.192
add address=172.19.23.241 interface=lo network=172.19.23.241
add address=172.19.23.2/28 interface=IF-VRRP-FIBRA1-QC23 network=172.19.23.0
add address=172.19.23.18/28 interface=IF-VRRP-FIBRA2-QC23 network=\
    172.19.23.16
add address=172.19.23.34/28 interface=IF-VRRP-FIBRA3-QC23 network=\
    172.19.23.32
add address=172.19.23.50/28 interface=IF-VRRP-WIFI-SOB-QC23 network=\
    172.19.23.48
add address=172.19.23.66/28 interface=IF-VRRP-WIFI-QC23 network=172.19.23.64
add address=172.19.23.177/30 interface=IF-VLAN1831-FIBRA1-QC23 network=\
    172.19.23.176
add address=172.19.23.181/30 interface=IF-VLAN1832-FIBRA2-QC23 network=\
    172.19.23.180
add address=172.19.23.185/30 interface=IF-VLAN1833-FIBRA3-QC23 network=\
    172.19.23.184
add address=172.19.23.189/30 interface=IF-VLAN1834-WIFI-SOB-QC23 network=\
    172.19.23.188
add address=172.19.23.193/30 interface=IF-VLAN1830-WIFI-QC23 network=\
    172.19.23.192
add address=172.19.24.241 interface=lo network=172.19.24.241
add address=172.19.24.2/28 interface=IF-VRRP-FIBRA1-QC24 network=172.19.24.0
add address=172.19.24.18/28 interface=IF-VRRP-FIBRA2-QC24 network=\
    172.19.24.16
add address=172.19.24.34/28 interface=IF-VRRP-FIBRA3-QC24 network=\
    172.19.24.32
add address=172.19.24.50/28 interface=IF-VRRP-WIFI-SOB-QC24 network=\
    172.19.24.48
add address=172.19.24.66/28 interface=IF-VRRP-WIFI-QC24 network=172.19.24.64
add address=172.19.24.177/30 interface=IF-VLAN1841-FIBRA1-QC24 network=\
    172.19.24.176
add address=172.19.24.181/30 interface=IF-VLAN1842-FIBRA2-QC24 network=\
    172.19.24.180
add address=172.19.24.185/30 interface=IF-VLAN1843-FIBRA3-QC24 network=\
    172.19.24.184
add address=172.19.24.189/30 interface=IF-VLAN1844-WIFI-SOB-QC24 network=\
    172.19.24.188
add address=172.19.24.193/30 interface=IF-VLAN1840-WIFI-QC24 network=\
    172.19.24.192
add address=10.34.183.231/28 interface=IF-VRRP-LTE network=10.34.183.224
add address=172.17.1.200/24 interface=IF-VRRP-VLAN50 network=172.17.1.0
/ip dns
set servers=172.17.1.250
/ip firewall address-list
add address=172.19.10.241 list=Lo-QC10
add address=172.19.11.241 list=Lo-QC11
add address=172.19.12.241 list=Lo-QC12
add address=172.19.14.241 list=Lo-QC14
add address=172.19.15.241 list=Lo-QC15
add address=172.19.16.241 list=Lo-QC16
add address=172.19.17.241 list=Lo-QC17
add address=172.19.18.241 list=Lo-QC18
add address=172.19.19.241 list=Lo-QC19
add address=172.19.20.241 list=Lo-QC20
add address=172.19.21.241 list=Lo-QC21
add address=172.19.22.241 list=Lo-QC22
add address=172.19.23.241 list=Lo-QC23
add address=172.19.24.241 list=Lo-QC24
add address=172.19.25.241 list=Lo-QC25
add address=172.19.26.241 list=Lo-QC26
add address=172.19.27.241 list=Lo-QC27
add address=172.19.28.241 list=Lo-QC28
add address=172.19.29.241 list=Lo-QC29
/ip firewall filter
add action=fasttrack-connection chain=forward comment=\
    FASTTRACK_FORWARD_ESTABLISHED_RELATED connection-state=\
    established,related hw-offload=yes
add action=accept chain=input comment=ACCEPT_INPUT_ESTABLISHED_RELATED \
    connection-state=established,related
add action=accept chain=forward comment=ACCEPT_FORWARD_ESTABLISHED_RELATED \
    connection-state=established,related
add action=accept chain=output comment=ACCEPT_OUTPUT_ESTABLISHED_RELATED \
    connection-state=established,related
add action=accept chain=input comment=ACCEPT_INPUT_VRRP protocol=vrrp
add action=accept chain=input comment=ACCEPT_INPUT_BGP_VLANS dst-address=\
    172.19.0.0/16 src-address=172.19.0.0/16
add action=accept chain=input comment=ACCEPT_INPUT_L2TP dst-port=1701 \
    in-interface=IF-VRRP-LTE protocol=udp
add action=accept chain=input comment=ACCEPT_INPUT_WINBOX dst-port=8291 \
    in-interface-list=Management protocol=tcp
add action=accept chain=input comment=ACCEPT_INPUT_SSH dst-port=22 \
    in-interface-list=Management protocol=tcp
add action=accept chain=input comment=ACCEPT_INPUT_SNMP dst-port=161 \
    in-interface-list=Management protocol=udp
add action=accept chain=input comment=ACCEPT_INPUT_MNDP dst-port=5678 \
    protocol=udp
add action=accept chain=input comment=ACCEPT_INPUT_ICMP protocol=icmp
add action=drop chain=input comment=DROP_ANY_INPUT log=yes
add action=accept chain=forward comment=ACCEPT_FORWARD_THROUGH_EOIP \
    in-interface-list=Core out-interface-list=Core
add action=drop chain=forward comment=DROP_ANY_FORWARD log=yes
add action=accept chain=output comment=ACCEPT_REPLY_WINBOX \
    out-interface-list=Management protocol=tcp src-port=8291
add action=accept chain=output comment=ACCEPT_REPLY_SSH out-interface-list=\
    Management protocol=tcp src-port=22
add action=accept chain=output comment=ACCEPT_REPLY_SNMP out-interface-list=\
    Management protocol=udp src-port=161
add action=accept chain=output comment=ACCEPT_OUTPUT_VRRP protocol=vrrp
add action=accept chain=output comment=ACCEPT_OUTPUT_BGP_VLANS dst-address=\
    172.19.0.0/16 src-address=172.19.0.0/16
add action=accept chain=output comment=ACCEPT_OUTPUT_L2TP port=1701 protocol=\
    udp
add action=accept chain=output comment=ACCEPT_OUTPUT_MNDP protocol=udp \
    src-port=5678
add action=accept chain=output comment=ACCEPT_OUTPUT_ICMP protocol=icmp
add action=accept chain=output comment=ACCEPT_OUTPUT_DNS dst-address=\
    172.17.1.250 dst-port=53 protocol=udp
add action=accept chain=output comment=ACCEPT_OUTPUT_NTP dst-address=\
    172.17.1.250 dst-port=123 protocol=udp
add action=drop chain=output comment=DROP_ANY_OUTPUT log=yes
/ip firewall nat
add action=masquerade chain=srcnat dst-address=172.19.0.0/16 src-address=\
    172.17.1.0/24
/ip firewall service-port
set ftp disabled=yes
set tftp disabled=yes
set h323 disabled=yes
set sip disabled=yes
set pptp disabled=yes
set rtsp disabled=no
/ip ipsec profile
set [ find default=yes ] dpd-interval=2m dpd-maximum-failures=5
/ip route
add distance=1 dst-address=10.34.64.0/23 gateway=10.34.183.230
add distance=1 dst-address=10.34.178.16/28 gateway=172.17.1.1
add distance=1 dst-address=10.34.178.20/32 gateway=172.17.1.1
add distance=1 dst-address=10.34.180.0/28 gateway=172.17.1.1
add distance=1 dst-address=10.236.0.0/16 gateway=172.17.1.1
add distance=1 dst-address=172.16.1.6/32 gateway=172.17.1.1
add distance=1 dst-address=172.17.4.0/24 gateway=172.17.1.1
add distance=1 dst-address=192.168.2.0/24 gateway=172.17.1.1
/ip service
set ftp disabled=yes
set telnet disabled=yes
set www disabled=yes
/ip ssh
set strong-crypto=yes
/ipv6 nd
set [ find default=yes ] disabled=yes
/ppp secret
add local-address=172.19.10.81 name=tunel-lte-qc10 password=Tunel-LTE \
    remote-address=172.19.10.82
add local-address=172.19.11.81 name=tunel-lte-qc11 password=Tunel-LTE \
    remote-address=172.19.11.82
add local-address=172.19.12.81 name=tunel-lte-qc12 password=Tunel-LTE \
    remote-address=172.19.12.82
add local-address=172.19.28.81 name=tunel-lte-qc28 password=Tunel-LTE \
    remote-address=172.19.28.82
add local-address=172.19.29.81 name=tunel-lte-qc29 password=Tunel-LTE \
    remote-address=172.19.29.82
add local-address=172.19.26.81 name=tunel-lte-qc26 password=Tunel-LTE \
    remote-address=172.19.26.82
add local-address=172.19.14.81 name=tunel-lte-qc14 password=Tunel-LTE \
    remote-address=172.19.14.82
add local-address=172.19.22.81 name=tunel-lte-qc22 password=Tunel-LTE \
    remote-address=172.19.22.82
add local-address=172.19.21.81 name=tunel-lte-qc21 password=Tunel-LTE \
    remote-address=172.19.21.82
add local-address=172.19.18.81 name=tunel-lte-qc18 password=Tunel-LTE \
    remote-address=172.19.18.82
add local-address=172.19.19.81 name=tunel-lte-qc19 password=Tunel-LTE \
    remote-address=172.19.19.82
add local-address=172.19.17.81 name=tunel-lte-qc17 password=Tunel-LTE \
    remote-address=172.19.17.82
add local-address=172.19.25.81 name=tunel-lte-qc25 password=Tunel-LTE \
    remote-address=172.19.25.82
add local-address=172.19.15.81 name=tunel-lte-qc15 password=Tunel-LTE \
    remote-address=172.19.15.82
add local-address=172.19.16.81 name=tunel-lte-qc16 password=Tunel-LTE \
    remote-address=172.19.16.82
add local-address=172.19.27.81 name=tunel-lte-qc27 password=Tunel-LTE \
    remote-address=172.19.27.82
add local-address=172.19.20.81 name=tunel-lte-qc20 password=Tunel-LTE \
    remote-address=172.19.20.82
add local-address=172.19.23.81 name=tunel-lte-qc23 password=Tunel-LTE \
    remote-address=172.19.23.82
add local-address=172.19.24.81 name=tunel-lte-qc24 password=Tunel-LTE \
    remote-address=172.19.24.82
/routing bgp connection
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC10 keepalive-time=1s local.address=172.19.10.2 .role=ebgp \
    name=FIBRA1-2011-QC10 output.filter-chain=BGP-OUT-QC10 .network=Lo-QC10 \
    .no-client-to-client-reflection=yes remote.address=172.19.10.3/32 .as=\
    65010 routing-table=main templates=QC10
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC10 keepalive-time=1s local.address=172.19.10.18 .role=ebgp \
    name=FIBRA2-2011-QC10 output.filter-chain=BGP-OUT-QC10 .network=Lo-QC10 \
    .no-client-to-client-reflection=yes remote.address=172.19.10.19/32 .as=\
    65010 routing-table=main templates=QC10
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC10 keepalive-time=1s local.address=172.19.10.34 .role=ebgp \
    name=FIBRA3-2011-QC10 output.filter-chain=BGP-OUT-QC10 .network=Lo-QC10 \
    .no-client-to-client-reflection=yes remote.address=172.19.10.35/32 .as=\
    65010 routing-table=main templates=QC10
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC10 keepalive-time=1s local.address=172.19.10.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC10 output.filter-chain=BGP-OUT-QC10 .network=Lo-QC10 \
    .no-client-to-client-reflection=yes remote.address=172.19.10.52/32 .as=\
    65110 routing-table=main templates=QC10
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC10 keepalive-time=1s local.address=172.19.10.2 .role=ebgp \
    name=FIBRA1-SOB-QC10 output.filter-chain=BGP-OUT-QC10 .network=Lo-QC10 \
    .no-client-to-client-reflection=yes remote.address=172.19.10.4/32 .as=\
    65110 routing-table=main templates=QC10
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC10 keepalive-time=1s local.address=172.19.10.18 .role=ebgp \
    name=FIBRA2-SOB-QC10 output.filter-chain=BGP-OUT-QC10 .network=Lo-QC10 \
    .no-client-to-client-reflection=yes remote.address=172.19.10.20/32 .as=\
    65110 routing-table=main templates=QC10
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC10 keepalive-time=1s local.address=172.19.10.34 .role=ebgp \
    name=FIBRA3-SOB-QC10 output.filter-chain=BGP-OUT-QC10 .network=Lo-QC10 \
    .no-client-to-client-reflection=yes remote.address=172.19.10.36/32 .as=\
    65110 routing-table=main templates=QC10
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC10 keepalive-time=1s local.address=172.19.10.66 .role=ebgp \
    name=WIFI-SE-2011-QC10 output.filter-chain=BGP-OUT-QC10 .network=Lo-QC10 \
    .no-client-to-client-reflection=yes remote.address=172.19.10.67/32 .as=\
    65010 routing-table=main templates=QC10
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC10 keepalive-time=1s local.address=172.19.10.66 .role=ebgp \
    name=WIFI-SE-SOB-QC10 output.filter-chain=BGP-OUT-QC10 .network=Lo-QC10 \
    .no-client-to-client-reflection=yes remote.address=172.19.10.68/32 .as=\
    65110 routing-table=main templates=QC10
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC10 keepalive-time=1s local.address=172.19.10.50 .role=ebgp \
    name=WIFI-SOB-2011-QC10 output.filter-chain=BGP-OUT-QC10 .network=Lo-QC10 \
    .no-client-to-client-reflection=yes remote.address=172.19.10.51/32 .as=\
    65010 routing-table=main templates=QC10
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC10 keepalive-time=1s local.address=172.19.10.81 .role=ebgp \
    name=LTE-SOB-QC10 output.filter-chain=BGP-OUT-QC10 .network=Lo-QC10 \
    .no-client-to-client-reflection=yes remote.address=172.19.10.82/32 .as=\
    65110 routing-table=main templates=QC10
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC11 keepalive-time=1s local.address=172.19.11.2 .role=ebgp \
    name=FIBRA1-2011-QC11 output.filter-chain=BGP-OUT-QC11 .network=Lo-QC11 \
    .no-client-to-client-reflection=yes remote.address=172.19.11.3/32 .as=\
    65011 routing-table=main templates=QC11
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC11 keepalive-time=1s local.address=172.19.11.18 .role=ebgp \
    name=FIBRA2-2011-QC11 output.filter-chain=BGP-OUT-QC11 .network=Lo-QC11 \
    .no-client-to-client-reflection=yes remote.address=172.19.11.19/32 .as=\
    65011 routing-table=main templates=QC11
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC11 keepalive-time=1s local.address=172.19.11.34 .role=ebgp \
    name=FIBRA3-2011-QC11 output.filter-chain=BGP-OUT-QC11 .network=Lo-QC11 \
    .no-client-to-client-reflection=yes remote.address=172.19.11.35/32 .as=\
    65011 routing-table=main templates=QC11
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC11 keepalive-time=1s local.address=172.19.11.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC11 output.filter-chain=BGP-OUT-QC11 .network=Lo-QC11 \
    .no-client-to-client-reflection=yes remote.address=172.19.11.52/32 .as=\
    65111 routing-table=main templates=QC11
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC11 keepalive-time=1s local.address=172.19.11.2 .role=ebgp \
    name=FIBRA1-SOB-QC11 output.filter-chain=BGP-OUT-QC11 .network=Lo-QC11 \
    .no-client-to-client-reflection=yes remote.address=172.19.11.4/32 .as=\
    65111 routing-table=main templates=QC11
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC11 keepalive-time=1s local.address=172.19.11.18 .role=ebgp \
    name=FIBRA2-SOB-QC11 output.filter-chain=BGP-OUT-QC11 .network=Lo-QC11 \
    .no-client-to-client-reflection=yes remote.address=172.19.11.20/32 .as=\
    65111 routing-table=main templates=QC11
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC11 keepalive-time=1s local.address=172.19.11.34 .role=ebgp \
    name=FIBRA3-SOB-QC11 output.filter-chain=BGP-OUT-QC11 .network=Lo-QC11 \
    .no-client-to-client-reflection=yes remote.address=172.19.11.36/32 .as=\
    65111 routing-table=main templates=QC11
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC11 keepalive-time=1s local.address=172.19.11.66 .role=ebgp \
    name=WIFI-SE-2011-QC11 output.filter-chain=BGP-OUT-QC11 .network=Lo-QC11 \
    .no-client-to-client-reflection=yes remote.address=172.19.11.67/32 .as=\
    65011 routing-table=main templates=QC11
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC11 keepalive-time=1s local.address=172.19.11.66 .role=ebgp \
    name=WIFI-SE-SOB-QC11 output.filter-chain=BGP-OUT-QC11 .network=Lo-QC11 \
    .no-client-to-client-reflection=yes remote.address=172.19.11.68/32 .as=\
    65111 routing-table=main templates=QC11
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC11 keepalive-time=1s local.address=172.19.11.50 .role=ebgp \
    name=WIFI-SOB-2011-QC11 output.filter-chain=BGP-OUT-QC11 .network=Lo-QC11 \
    .no-client-to-client-reflection=yes remote.address=172.19.11.51/32 .as=\
    65011 routing-table=main templates=QC11
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC11 keepalive-time=1s local.address=172.19.11.81 .role=ebgp \
    name=LTE-SOB-QC11 output.filter-chain=BGP-OUT-QC11 .network=Lo-QC11 \
    .no-client-to-client-reflection=yes remote.address=172.19.11.82/32 .as=\
    65111 routing-table=main templates=QC11
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC12 keepalive-time=1s local.address=172.19.12.2 .role=ebgp \
    name=FIBRA1-2011-QC12 output.filter-chain=BGP-OUT-QC12 .network=Lo-QC12 \
    .no-client-to-client-reflection=yes remote.address=172.19.12.3/32 .as=\
    65012 routing-table=main templates=QC12
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC12 keepalive-time=1s local.address=172.19.12.18 .role=ebgp \
    name=FIBRA2-2011-QC12 output.filter-chain=BGP-OUT-QC12 .network=Lo-QC12 \
    .no-client-to-client-reflection=yes remote.address=172.19.12.19/32 .as=\
    65012 routing-table=main templates=QC12
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC12 keepalive-time=1s local.address=172.19.12.34 .role=ebgp \
    name=FIBRA3-2011-QC12 output.filter-chain=BGP-OUT-QC12 .network=Lo-QC12 \
    .no-client-to-client-reflection=yes remote.address=172.19.12.35/32 .as=\
    65012 routing-table=main templates=QC12
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC12 keepalive-time=1s local.address=172.19.12.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC12 output.filter-chain=BGP-OUT-QC12 .network=Lo-QC12 \
    .no-client-to-client-reflection=yes remote.address=172.19.12.52/32 .as=\
    65112 routing-table=main templates=QC12
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC12 keepalive-time=1s local.address=172.19.12.2 .role=ebgp \
    name=FIBRA1-SOB-QC12 output.filter-chain=BGP-OUT-QC12 .network=Lo-QC12 \
    .no-client-to-client-reflection=yes remote.address=172.19.12.4/32 .as=\
    65112 routing-table=main templates=QC12
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC12 keepalive-time=1s local.address=172.19.12.18 .role=ebgp \
    name=FIBRA2-SOB-QC12 output.filter-chain=BGP-OUT-QC12 .network=Lo-QC12 \
    .no-client-to-client-reflection=yes remote.address=172.19.12.20/32 .as=\
    65112 routing-table=main templates=QC12
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC12 keepalive-time=1s local.address=172.19.12.34 .role=ebgp \
    name=FIBRA3-SOB-QC12 output.filter-chain=BGP-OUT-QC12 .network=Lo-QC12 \
    .no-client-to-client-reflection=yes remote.address=172.19.12.36/32 .as=\
    65112 routing-table=main templates=QC12
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC12 keepalive-time=1s local.address=172.19.12.66 .role=ebgp \
    name=WIFI-SE-2011-QC12 output.filter-chain=BGP-OUT-QC12 .network=Lo-QC12 \
    .no-client-to-client-reflection=yes remote.address=172.19.12.67/32 .as=\
    65012 routing-table=main templates=QC12
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC12 keepalive-time=1s local.address=172.19.12.66 .role=ebgp \
    name=WIFI-SE-SOB-QC12 output.filter-chain=BGP-OUT-QC12 .network=Lo-QC12 \
    .no-client-to-client-reflection=yes remote.address=172.19.12.68/32 .as=\
    65112 routing-table=main templates=QC12
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC12 keepalive-time=1s local.address=172.19.12.50 .role=ebgp \
    name=WIFI-SOB-2011-QC12 output.filter-chain=BGP-OUT-QC12 .network=Lo-QC12 \
    .no-client-to-client-reflection=yes remote.address=172.19.12.51/32 .as=\
    65012 routing-table=main templates=QC12
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC12 keepalive-time=1s local.address=172.19.12.81 .role=ebgp \
    name=LTE-SOB-QC12 output.filter-chain=BGP-OUT-QC12 .network=Lo-QC12 \
    .no-client-to-client-reflection=yes remote.address=172.19.12.82/32 .as=\
    65112 routing-table=main templates=QC12
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC14 keepalive-time=1s local.address=172.19.14.2 .role=ebgp \
    name=FIBRA1-2011-QC14 output.filter-chain=BGP-OUT-QC14 .network=Lo-QC14 \
    .no-client-to-client-reflection=yes remote.address=172.19.14.3/32 .as=\
    65014 routing-table=main templates=QC14
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC14 keepalive-time=1s local.address=172.19.14.18 .role=ebgp \
    name=FIBRA2-2011-QC14 output.filter-chain=BGP-OUT-QC14 .network=Lo-QC14 \
    .no-client-to-client-reflection=yes remote.address=172.19.14.19/32 .as=\
    65014 routing-table=main templates=QC14
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC14 keepalive-time=1s local.address=172.19.14.34 .role=ebgp \
    name=FIBRA3-2011-QC14 output.filter-chain=BGP-OUT-QC14 .network=Lo-QC14 \
    .no-client-to-client-reflection=yes remote.address=172.19.14.35/32 .as=\
    65014 routing-table=main templates=QC14
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC14 keepalive-time=1s local.address=172.19.14.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC14 output.filter-chain=BGP-OUT-QC14 .network=Lo-QC14 \
    .no-client-to-client-reflection=yes remote.address=172.19.14.52/32 .as=\
    65114 routing-table=main templates=QC14
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC14 keepalive-time=1s local.address=172.19.14.2 .role=ebgp \
    name=FIBRA1-SOB-QC14 output.filter-chain=BGP-OUT-QC14 .network=Lo-QC14 \
    .no-client-to-client-reflection=yes remote.address=172.19.14.4/32 .as=\
    65114 routing-table=main templates=QC14
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC14 keepalive-time=1s local.address=172.19.14.18 .role=ebgp \
    name=FIBRA2-SOB-QC14 output.filter-chain=BGP-OUT-QC14 .network=Lo-QC14 \
    .no-client-to-client-reflection=yes remote.address=172.19.14.20/32 .as=\
    65114 routing-table=main templates=QC14
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC14 keepalive-time=1s local.address=172.19.14.34 .role=ebgp \
    name=FIBRA3-SOB-QC14 output.filter-chain=BGP-OUT-QC14 .network=Lo-QC14 \
    .no-client-to-client-reflection=yes remote.address=172.19.14.36/32 .as=\
    65114 routing-table=main templates=QC14
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC14 keepalive-time=1s local.address=172.19.14.66 .role=ebgp \
    name=WIFI-SE-2011-QC14 output.filter-chain=BGP-OUT-QC14 .network=Lo-QC14 \
    .no-client-to-client-reflection=yes remote.address=172.19.14.67/32 .as=\
    65014 routing-table=main templates=QC14
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC14 keepalive-time=1s local.address=172.19.14.66 .role=ebgp \
    name=WIFI-SE-SOB-QC14 output.filter-chain=BGP-OUT-QC14 .network=Lo-QC14 \
    .no-client-to-client-reflection=yes remote.address=172.19.14.68/32 .as=\
    65114 routing-table=main templates=QC14
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC14 keepalive-time=1s local.address=172.19.14.50 .role=ebgp \
    name=WIFI-SOB-2011-QC14 output.filter-chain=BGP-OUT-QC14 .network=Lo-QC14 \
    .no-client-to-client-reflection=yes remote.address=172.19.14.51/32 .as=\
    65014 routing-table=main templates=QC14
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC14 keepalive-time=1s local.address=172.19.14.81 .role=ebgp \
    name=LTE-SOB-QC14 output.filter-chain=BGP-OUT-QC14 .network=Lo-QC14 \
    .no-client-to-client-reflection=yes remote.address=172.19.14.82/32 .as=\
    65114 routing-table=main templates=QC14
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC15 keepalive-time=1s local.address=172.19.15.2 .role=ebgp \
    name=FIBRA1-2011-QC15 output.filter-chain=BGP-OUT-QC15 .network=Lo-QC15 \
    .no-client-to-client-reflection=yes remote.address=172.19.15.3/32 .as=\
    65015 routing-table=main templates=QC15
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC15 keepalive-time=1s local.address=172.19.15.18 .role=ebgp \
    name=FIBRA2-2011-QC15 output.filter-chain=BGP-OUT-QC15 .network=Lo-QC15 \
    .no-client-to-client-reflection=yes remote.address=172.19.15.19/32 .as=\
    65015 routing-table=main templates=QC15
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC15 keepalive-time=1s local.address=172.19.15.34 .role=ebgp \
    name=FIBRA3-2011-QC15 output.filter-chain=BGP-OUT-QC15 .network=Lo-QC15 \
    .no-client-to-client-reflection=yes remote.address=172.19.15.35/32 .as=\
    65015 routing-table=main templates=QC15
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC15 keepalive-time=1s local.address=172.19.15.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC15 output.filter-chain=BGP-OUT-QC15 .network=Lo-QC15 \
    .no-client-to-client-reflection=yes remote.address=172.19.15.52/32 .as=\
    65115 routing-table=main templates=QC15
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC15 keepalive-time=1s local.address=172.19.15.2 .role=ebgp \
    name=FIBRA1-SOB-QC15 output.filter-chain=BGP-OUT-QC15 .network=Lo-QC15 \
    .no-client-to-client-reflection=yes remote.address=172.19.15.4/32 .as=\
    65115 routing-table=main templates=QC15
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC15 keepalive-time=1s local.address=172.19.15.18 .role=ebgp \
    name=FIBRA2-SOB-QC15 output.filter-chain=BGP-OUT-QC15 .network=Lo-QC15 \
    .no-client-to-client-reflection=yes remote.address=172.19.15.20/32 .as=\
    65115 routing-table=main templates=QC15
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC15 keepalive-time=1s local.address=172.19.15.34 .role=ebgp \
    name=FIBRA3-SOB-QC15 output.filter-chain=BGP-OUT-QC15 .network=Lo-QC15 \
    .no-client-to-client-reflection=yes remote.address=172.19.15.36/32 .as=\
    65115 routing-table=main templates=QC15
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC15 keepalive-time=1s local.address=172.19.15.66 .role=ebgp \
    name=WIFI-SE-2011-QC15 output.filter-chain=BGP-OUT-QC15 .network=Lo-QC15 \
    .no-client-to-client-reflection=yes remote.address=172.19.15.67/32 .as=\
    65015 routing-table=main templates=QC15
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC15 keepalive-time=1s local.address=172.19.15.66 .role=ebgp \
    name=WIFI-SE-SOB-QC15 output.filter-chain=BGP-OUT-QC15 .network=Lo-QC15 \
    .no-client-to-client-reflection=yes remote.address=172.19.15.68/32 .as=\
    65115 routing-table=main templates=QC15
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC15 keepalive-time=1s local.address=172.19.15.50 .role=ebgp \
    name=WIFI-SOB-2011-QC15 output.filter-chain=BGP-OUT-QC15 .network=Lo-QC15 \
    .no-client-to-client-reflection=yes remote.address=172.19.15.51/32 .as=\
    65015 routing-table=main templates=QC15
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC15 keepalive-time=1s local.address=172.19.15.81 .role=ebgp \
    name=LTE-SOB-QC15 output.filter-chain=BGP-OUT-QC15 .network=Lo-QC15 \
    .no-client-to-client-reflection=yes remote.address=172.19.15.82/32 .as=\
    65115 routing-table=main templates=QC15
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC16 keepalive-time=1s local.address=172.19.16.2 .role=ebgp \
    name=FIBRA1-2011-QC16 output.filter-chain=BGP-OUT-QC16 .network=Lo-QC16 \
    .no-client-to-client-reflection=yes remote.address=172.19.16.3/32 .as=\
    65016 routing-table=main templates=QC16
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC16 keepalive-time=1s local.address=172.19.16.18 .role=ebgp \
    name=FIBRA2-2011-QC16 output.filter-chain=BGP-OUT-QC16 .network=Lo-QC16 \
    .no-client-to-client-reflection=yes remote.address=172.19.16.19/32 .as=\
    65016 routing-table=main templates=QC16
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC16 keepalive-time=1s local.address=172.19.16.34 .role=ebgp \
    name=FIBRA3-2011-QC16 output.filter-chain=BGP-OUT-QC16 .network=Lo-QC16 \
    .no-client-to-client-reflection=yes remote.address=172.19.16.35/32 .as=\
    65016 routing-table=main templates=QC16
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC16 keepalive-time=1s local.address=172.19.16.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC16 output.filter-chain=BGP-OUT-QC16 .network=Lo-QC16 \
    .no-client-to-client-reflection=yes remote.address=172.19.16.52/32 .as=\
    65116 routing-table=main templates=QC16
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC16 keepalive-time=1s local.address=172.19.16.2 .role=ebgp \
    name=FIBRA1-SOB-QC16 output.filter-chain=BGP-OUT-QC16 .network=Lo-QC16 \
    .no-client-to-client-reflection=yes remote.address=172.19.16.4/32 .as=\
    65116 routing-table=main templates=QC16
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC16 keepalive-time=1s local.address=172.19.16.18 .role=ebgp \
    name=FIBRA2-SOB-QC16 output.filter-chain=BGP-OUT-QC16 .network=Lo-QC16 \
    .no-client-to-client-reflection=yes remote.address=172.19.16.20/32 .as=\
    65116 routing-table=main templates=QC16
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC16 keepalive-time=1s local.address=172.19.16.34 .role=ebgp \
    name=FIBRA3-SOB-QC16 output.filter-chain=BGP-OUT-QC16 .network=Lo-QC16 \
    .no-client-to-client-reflection=yes remote.address=172.19.16.36/32 .as=\
    65116 routing-table=main templates=QC16
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC16 keepalive-time=1s local.address=172.19.16.66 .role=ebgp \
    name=WIFI-SE-2011-QC16 output.filter-chain=BGP-OUT-QC16 .network=Lo-QC16 \
    .no-client-to-client-reflection=yes remote.address=172.19.16.67/32 .as=\
    65016 routing-table=main templates=QC16
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC16 keepalive-time=1s local.address=172.19.16.66 .role=ebgp \
    name=WIFI-SE-SOB-QC16 output.filter-chain=BGP-OUT-QC16 .network=Lo-QC16 \
    .no-client-to-client-reflection=yes remote.address=172.19.16.68/32 .as=\
    65116 routing-table=main templates=QC16
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC16 keepalive-time=1s local.address=172.19.16.50 .role=ebgp \
    name=WIFI-SOB-2011-QC16 output.filter-chain=BGP-OUT-QC16 .network=Lo-QC16 \
    .no-client-to-client-reflection=yes remote.address=172.19.16.51/32 .as=\
    65016 routing-table=main templates=QC16
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC16 keepalive-time=1s local.address=172.19.16.81 .role=ebgp \
    name=LTE-SOB-QC16 output.filter-chain=BGP-OUT-QC16 .network=Lo-QC16 \
    .no-client-to-client-reflection=yes remote.address=172.19.16.82/32 .as=\
    65116 routing-table=main templates=QC16
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC17 keepalive-time=1s local.address=172.19.17.2 .role=ebgp \
    name=FIBRA1-2011-QC17 output.filter-chain=BGP-OUT-QC17 .network=Lo-QC17 \
    .no-client-to-client-reflection=yes remote.address=172.19.17.3/32 .as=\
    65017 routing-table=main templates=QC17
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC17 keepalive-time=1s local.address=172.19.17.18 .role=ebgp \
    name=FIBRA2-2011-QC17 output.filter-chain=BGP-OUT-QC17 .network=Lo-QC17 \
    .no-client-to-client-reflection=yes remote.address=172.19.17.19/32 .as=\
    65017 routing-table=main templates=QC17
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC17 keepalive-time=1s local.address=172.19.17.34 .role=ebgp \
    name=FIBRA3-2011-QC17 output.filter-chain=BGP-OUT-QC17 .network=Lo-QC17 \
    .no-client-to-client-reflection=yes remote.address=172.19.17.35/32 .as=\
    65017 routing-table=main templates=QC17
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC17 keepalive-time=1s local.address=172.19.17.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC17 output.filter-chain=BGP-OUT-QC17 .network=Lo-QC17 \
    .no-client-to-client-reflection=yes remote.address=172.19.17.52/32 .as=\
    65117 routing-table=main templates=QC17
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC17 keepalive-time=1s local.address=172.19.17.2 .role=ebgp \
    name=FIBRA1-SOB-QC17 output.filter-chain=BGP-OUT-QC17 .network=Lo-QC17 \
    .no-client-to-client-reflection=yes remote.address=172.19.17.4/32 .as=\
    65117 routing-table=main templates=QC17
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC17 keepalive-time=1s local.address=172.19.17.18 .role=ebgp \
    name=FIBRA2-SOB-QC17 output.filter-chain=BGP-OUT-QC17 .network=Lo-QC17 \
    .no-client-to-client-reflection=yes remote.address=172.19.17.20/32 .as=\
    65117 routing-table=main templates=QC17
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC17 keepalive-time=1s local.address=172.19.17.34 .role=ebgp \
    name=FIBRA3-SOB-QC17 output.filter-chain=BGP-OUT-QC17 .network=Lo-QC17 \
    .no-client-to-client-reflection=yes remote.address=172.19.17.36/32 .as=\
    65117 routing-table=main templates=QC17
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC17 keepalive-time=1s local.address=172.19.17.66 .role=ebgp \
    name=WIFI-SE-2011-QC17 output.filter-chain=BGP-OUT-QC17 .network=Lo-QC17 \
    .no-client-to-client-reflection=yes remote.address=172.19.17.67/32 .as=\
    65017 routing-table=main templates=QC17
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC17 keepalive-time=1s local.address=172.19.17.66 .role=ebgp \
    name=WIFI-SE-SOB-QC17 output.filter-chain=BGP-OUT-QC17 .network=Lo-QC17 \
    .no-client-to-client-reflection=yes remote.address=172.19.17.68/32 .as=\
    65117 routing-table=main templates=QC17
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC17 keepalive-time=1s local.address=172.19.17.50 .role=ebgp \
    name=WIFI-SOB-2011-QC17 output.filter-chain=BGP-OUT-QC17 .network=Lo-QC17 \
    .no-client-to-client-reflection=yes remote.address=172.19.17.51/32 .as=\
    65017 routing-table=main templates=QC17
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC17 keepalive-time=1s local.address=172.19.17.81 .role=ebgp \
    name=LTE-SOB-QC17 output.filter-chain=BGP-OUT-QC17 .network=Lo-QC17 \
    .no-client-to-client-reflection=yes remote.address=172.19.17.82/32 .as=\
    65117 routing-table=main templates=QC17
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC18 keepalive-time=1s local.address=172.19.18.2 .role=ebgp \
    name=FIBRA1-2011-QC18 output.filter-chain=BGP-OUT-QC18 .network=Lo-QC18 \
    .no-client-to-client-reflection=yes remote.address=172.19.18.3/32 .as=\
    65018 routing-table=main templates=QC18
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC18 keepalive-time=1s local.address=172.19.18.18 .role=ebgp \
    name=FIBRA2-2011-QC18 output.filter-chain=BGP-OUT-QC18 .network=Lo-QC18 \
    .no-client-to-client-reflection=yes remote.address=172.19.18.19/32 .as=\
    65018 routing-table=main templates=QC18
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC18 keepalive-time=1s local.address=172.19.18.34 .role=ebgp \
    name=FIBRA3-2011-QC18 output.filter-chain=BGP-OUT-QC18 .network=Lo-QC18 \
    .no-client-to-client-reflection=yes remote.address=172.19.18.35/32 .as=\
    65018 routing-table=main templates=QC18
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC18 keepalive-time=1s local.address=172.19.18.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC18 output.filter-chain=BGP-OUT-QC18 .network=Lo-QC18 \
    .no-client-to-client-reflection=yes remote.address=172.19.18.52/32 .as=\
    65118 routing-table=main templates=QC18
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC18 keepalive-time=1s local.address=172.19.18.2 .role=ebgp \
    name=FIBRA1-SOB-QC18 output.filter-chain=BGP-OUT-QC18 .network=Lo-QC18 \
    .no-client-to-client-reflection=yes remote.address=172.19.18.4/32 .as=\
    65118 routing-table=main templates=QC18
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC18 keepalive-time=1s local.address=172.19.18.18 .role=ebgp \
    name=FIBRA2-SOB-QC18 output.filter-chain=BGP-OUT-QC18 .network=Lo-QC18 \
    .no-client-to-client-reflection=yes remote.address=172.19.18.20/32 .as=\
    65118 routing-table=main templates=QC18
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC18 keepalive-time=1s local.address=172.19.18.34 .role=ebgp \
    name=FIBRA3-SOB-QC18 output.filter-chain=BGP-OUT-QC18 .network=Lo-QC18 \
    .no-client-to-client-reflection=yes remote.address=172.19.18.36/32 .as=\
    65118 routing-table=main templates=QC18
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC18 keepalive-time=1s local.address=172.19.18.66 .role=ebgp \
    name=WIFI-SE-2011-QC18 output.filter-chain=BGP-OUT-QC18 .network=Lo-QC18 \
    .no-client-to-client-reflection=yes remote.address=172.19.18.67/32 .as=\
    65018 routing-table=main templates=QC18
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC18 keepalive-time=1s local.address=172.19.18.66 .role=ebgp \
    name=WIFI-SE-SOB-QC18 output.filter-chain=BGP-OUT-QC18 .network=Lo-QC18 \
    .no-client-to-client-reflection=yes remote.address=172.19.18.68/32 .as=\
    65118 routing-table=main templates=QC18
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC18 keepalive-time=1s local.address=172.19.18.50 .role=ebgp \
    name=WIFI-SOB-2011-QC18 output.filter-chain=BGP-OUT-QC18 .network=Lo-QC18 \
    .no-client-to-client-reflection=yes remote.address=172.19.18.51/32 .as=\
    65018 routing-table=main templates=QC18
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC18 keepalive-time=1s local.address=172.19.18.81 .role=ebgp \
    name=LTE-SOB-QC18 output.filter-chain=BGP-OUT-QC18 .network=Lo-QC18 \
    .no-client-to-client-reflection=yes remote.address=172.19.18.82/32 .as=\
    65118 routing-table=main templates=QC18
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC19 keepalive-time=1s local.address=172.19.19.2 .role=ebgp \
    name=FIBRA1-2011-QC19 output.filter-chain=BGP-OUT-QC19 .network=Lo-QC19 \
    .no-client-to-client-reflection=yes remote.address=172.19.19.3/32 .as=\
    65019 routing-table=main templates=QC19
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC19 keepalive-time=1s local.address=172.19.19.18 .role=ebgp \
    name=FIBRA2-2011-QC19 output.filter-chain=BGP-OUT-QC19 .network=Lo-QC19 \
    .no-client-to-client-reflection=yes remote.address=172.19.19.19/32 .as=\
    65019 routing-table=main templates=QC19
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC19 keepalive-time=1s local.address=172.19.19.34 .role=ebgp \
    name=FIBRA3-2011-QC19 output.filter-chain=BGP-OUT-QC19 .network=Lo-QC19 \
    .no-client-to-client-reflection=yes remote.address=172.19.19.35/32 .as=\
    65019 routing-table=main templates=QC19
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC19 keepalive-time=1s local.address=172.19.19.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC19 output.filter-chain=BGP-OUT-QC19 .network=Lo-QC19 \
    .no-client-to-client-reflection=yes remote.address=172.19.19.52/32 .as=\
    65119 routing-table=main templates=QC19
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC19 keepalive-time=1s local.address=172.19.19.2 .role=ebgp \
    name=FIBRA1-SOB-QC19 output.filter-chain=BGP-OUT-QC19 .network=Lo-QC19 \
    .no-client-to-client-reflection=yes remote.address=172.19.19.4/32 .as=\
    65119 routing-table=main templates=QC19
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC19 keepalive-time=1s local.address=172.19.19.18 .role=ebgp \
    name=FIBRA2-SOB-QC19 output.filter-chain=BGP-OUT-QC19 .network=Lo-QC19 \
    .no-client-to-client-reflection=yes remote.address=172.19.19.20/32 .as=\
    65119 routing-table=main templates=QC19
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC19 keepalive-time=1s local.address=172.19.19.34 .role=ebgp \
    name=FIBRA3-SOB-QC19 output.filter-chain=BGP-OUT-QC19 .network=Lo-QC19 \
    .no-client-to-client-reflection=yes remote.address=172.19.19.36/32 .as=\
    65119 routing-table=main templates=QC19
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC19 keepalive-time=1s local.address=172.19.19.66 .role=ebgp \
    name=WIFI-SE-2011-QC19 output.filter-chain=BGP-OUT-QC19 .network=Lo-QC19 \
    .no-client-to-client-reflection=yes remote.address=172.19.19.67/32 .as=\
    65019 routing-table=main templates=QC19
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC19 keepalive-time=1s local.address=172.19.19.66 .role=ebgp \
    name=WIFI-SE-SOB-QC19 output.filter-chain=BGP-OUT-QC19 .network=Lo-QC19 \
    .no-client-to-client-reflection=yes remote.address=172.19.19.68/32 .as=\
    65119 routing-table=main templates=QC19
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC19 keepalive-time=1s local.address=172.19.19.50 .role=ebgp \
    name=WIFI-SOB-2011-QC19 output.filter-chain=BGP-OUT-QC19 .network=Lo-QC19 \
    .no-client-to-client-reflection=yes remote.address=172.19.19.51/32 .as=\
    65019 routing-table=main templates=QC19
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC19 keepalive-time=1s local.address=172.19.19.81 .role=ebgp \
    name=LTE-SOB-QC19 output.filter-chain=BGP-OUT-QC19 .network=Lo-QC19 \
    .no-client-to-client-reflection=yes remote.address=172.19.19.82/32 .as=\
    65119 routing-table=main templates=QC19
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC20 keepalive-time=1s local.address=172.19.20.2 .role=ebgp \
    name=FIBRA1-2011-QC20 output.filter-chain=BGP-OUT-QC20 .network=Lo-QC20 \
    .no-client-to-client-reflection=yes remote.address=172.19.20.3/32 .as=\
    65020 routing-table=main templates=QC20
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC20 keepalive-time=1s local.address=172.19.20.18 .role=ebgp \
    name=FIBRA2-2011-QC20 output.filter-chain=BGP-OUT-QC20 .network=Lo-QC20 \
    .no-client-to-client-reflection=yes remote.address=172.19.20.19/32 .as=\
    65020 routing-table=main templates=QC20
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC20 keepalive-time=1s local.address=172.19.20.34 .role=ebgp \
    name=FIBRA3-2011-QC20 output.filter-chain=BGP-OUT-QC20 .network=Lo-QC20 \
    .no-client-to-client-reflection=yes remote.address=172.19.20.35/32 .as=\
    65020 routing-table=main templates=QC20
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC20 keepalive-time=1s local.address=172.19.20.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC20 output.filter-chain=BGP-OUT-QC20 .network=Lo-QC20 \
    .no-client-to-client-reflection=yes remote.address=172.19.20.52/32 .as=\
    65120 routing-table=main templates=QC20
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC20 keepalive-time=1s local.address=172.19.20.2 .role=ebgp \
    name=FIBRA1-SOB-QC20 output.filter-chain=BGP-OUT-QC20 .network=Lo-QC20 \
    .no-client-to-client-reflection=yes remote.address=172.19.20.4/32 .as=\
    65120 routing-table=main templates=QC20
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC20 keepalive-time=1s local.address=172.19.20.18 .role=ebgp \
    name=FIBRA2-SOB-QC20 output.filter-chain=BGP-OUT-QC20 .network=Lo-QC20 \
    .no-client-to-client-reflection=yes remote.address=172.19.20.20/32 .as=\
    65120 routing-table=main templates=QC20
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC20 keepalive-time=1s local.address=172.19.20.34 .role=ebgp \
    name=FIBRA3-SOB-QC20 output.filter-chain=BGP-OUT-QC20 .network=Lo-QC20 \
    .no-client-to-client-reflection=yes remote.address=172.19.20.36/32 .as=\
    65120 routing-table=main templates=QC20
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC20 keepalive-time=1s local.address=172.19.20.66 .role=ebgp \
    name=WIFI-SE-2011-QC20 output.filter-chain=BGP-OUT-QC20 .network=Lo-QC20 \
    .no-client-to-client-reflection=yes remote.address=172.19.20.67/32 .as=\
    65020 routing-table=main templates=QC20
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC20 keepalive-time=1s local.address=172.19.20.66 .role=ebgp \
    name=WIFI-SE-SOB-QC20 output.filter-chain=BGP-OUT-QC20 .network=Lo-QC20 \
    .no-client-to-client-reflection=yes remote.address=172.19.20.68/32 .as=\
    65120 routing-table=main templates=QC20
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC20 keepalive-time=1s local.address=172.19.20.50 .role=ebgp \
    name=WIFI-SOB-2011-QC20 output.filter-chain=BGP-OUT-QC20 .network=Lo-QC20 \
    .no-client-to-client-reflection=yes remote.address=172.19.20.51/32 .as=\
    65020 routing-table=main templates=QC20
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC20 keepalive-time=1s local.address=172.19.20.81 .role=ebgp \
    name=LTE-SOB-QC20 output.filter-chain=BGP-OUT-QC20 .network=Lo-QC20 \
    .no-client-to-client-reflection=yes remote.address=172.19.20.82/32 .as=\
    65120 routing-table=main templates=QC20
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC21 keepalive-time=1s local.address=172.19.21.2 .role=ebgp \
    name=FIBRA1-2011-QC21 output.filter-chain=BGP-OUT-QC21 .network=Lo-QC21 \
    .no-client-to-client-reflection=yes remote.address=172.19.21.3/32 .as=\
    65021 routing-table=main templates=QC21
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC21 keepalive-time=1s local.address=172.19.21.18 .role=ebgp \
    name=FIBRA2-2011-QC21 output.filter-chain=BGP-OUT-QC21 .network=Lo-QC21 \
    .no-client-to-client-reflection=yes remote.address=172.19.21.19/32 .as=\
    65021 routing-table=main templates=QC21
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC21 keepalive-time=1s local.address=172.19.21.34 .role=ebgp \
    name=FIBRA3-2011-QC21 output.filter-chain=BGP-OUT-QC21 .network=Lo-QC21 \
    .no-client-to-client-reflection=yes remote.address=172.19.21.35/32 .as=\
    65021 routing-table=main templates=QC21
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC21 keepalive-time=1s local.address=172.19.21.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC21 output.filter-chain=BGP-OUT-QC21 .network=Lo-QC21 \
    .no-client-to-client-reflection=yes remote.address=172.19.21.52/32 .as=\
    65121 routing-table=main templates=QC21
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC21 keepalive-time=1s local.address=172.19.21.2 .role=ebgp \
    name=FIBRA1-SOB-QC21 output.filter-chain=BGP-OUT-QC21 .network=Lo-QC21 \
    .no-client-to-client-reflection=yes remote.address=172.19.21.4/32 .as=\
    65121 routing-table=main templates=QC21
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC21 keepalive-time=1s local.address=172.19.21.18 .role=ebgp \
    name=FIBRA2-SOB-QC21 output.filter-chain=BGP-OUT-QC21 .network=Lo-QC21 \
    .no-client-to-client-reflection=yes remote.address=172.19.21.20/32 .as=\
    65121 routing-table=main templates=QC21
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC21 keepalive-time=1s local.address=172.19.21.34 .role=ebgp \
    name=FIBRA3-SOB-QC21 output.filter-chain=BGP-OUT-QC21 .network=Lo-QC21 \
    .no-client-to-client-reflection=yes remote.address=172.19.21.36/32 .as=\
    65121 routing-table=main templates=QC21
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC21 keepalive-time=1s local.address=172.19.21.66 .role=ebgp \
    name=WIFI-SE-2011-QC21 output.filter-chain=BGP-OUT-QC21 .network=Lo-QC21 \
    .no-client-to-client-reflection=yes remote.address=172.19.21.67/32 .as=\
    65021 routing-table=main templates=QC21
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC21 keepalive-time=1s local.address=172.19.21.66 .role=ebgp \
    name=WIFI-SE-SOB-QC21 output.filter-chain=BGP-OUT-QC21 .network=Lo-QC21 \
    .no-client-to-client-reflection=yes remote.address=172.19.21.68/32 .as=\
    65121 routing-table=main templates=QC21
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC21 keepalive-time=1s local.address=172.19.21.50 .role=ebgp \
    name=WIFI-SOB-2011-QC21 output.filter-chain=BGP-OUT-QC21 .network=Lo-QC21 \
    .no-client-to-client-reflection=yes remote.address=172.19.21.51/32 .as=\
    65021 routing-table=main templates=QC21
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC21 keepalive-time=1s local.address=172.19.21.81 .role=ebgp \
    name=LTE-SOB-QC21 output.filter-chain=BGP-OUT-QC21 .network=Lo-QC21 \
    .no-client-to-client-reflection=yes remote.address=172.19.21.82/32 .as=\
    65121 routing-table=main templates=QC21
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC22 keepalive-time=1s local.address=172.19.22.2 .role=ebgp \
    name=FIBRA1-2011-QC22 output.filter-chain=BGP-OUT-QC22 .network=Lo-QC22 \
    .no-client-to-client-reflection=yes remote.address=172.19.22.3/32 .as=\
    65022 routing-table=main templates=QC22
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC22 keepalive-time=1s local.address=172.19.22.18 .role=ebgp \
    name=FIBRA2-2011-QC22 output.filter-chain=BGP-OUT-QC22 .network=Lo-QC22 \
    .no-client-to-client-reflection=yes remote.address=172.19.22.19/32 .as=\
    65022 routing-table=main templates=QC22
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC22 keepalive-time=1s local.address=172.19.22.34 .role=ebgp \
    name=FIBRA3-2011-QC22 output.filter-chain=BGP-OUT-QC22 .network=Lo-QC22 \
    .no-client-to-client-reflection=yes remote.address=172.19.22.35/32 .as=\
    65022 routing-table=main templates=QC22
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC22 keepalive-time=1s local.address=172.19.22.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC22 output.filter-chain=BGP-OUT-QC22 .network=Lo-QC22 \
    .no-client-to-client-reflection=yes remote.address=172.19.22.52/32 .as=\
    65122 routing-table=main templates=QC22
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC22 keepalive-time=1s local.address=172.19.22.2 .role=ebgp \
    name=FIBRA1-SOB-QC22 output.filter-chain=BGP-OUT-QC22 .network=Lo-QC22 \
    .no-client-to-client-reflection=yes remote.address=172.19.22.4/32 .as=\
    65122 routing-table=main templates=QC22
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC22 keepalive-time=1s local.address=172.19.22.18 .role=ebgp \
    name=FIBRA2-SOB-QC22 output.filter-chain=BGP-OUT-QC22 .network=Lo-QC22 \
    .no-client-to-client-reflection=yes remote.address=172.19.22.20/32 .as=\
    65122 routing-table=main templates=QC22
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC22 keepalive-time=1s local.address=172.19.22.34 .role=ebgp \
    name=FIBRA3-SOB-QC22 output.filter-chain=BGP-OUT-QC22 .network=Lo-QC22 \
    .no-client-to-client-reflection=yes remote.address=172.19.22.36/32 .as=\
    65122 routing-table=main templates=QC22
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC22 keepalive-time=1s local.address=172.19.22.66 .role=ebgp \
    name=WIFI-SE-2011-QC22 output.filter-chain=BGP-OUT-QC22 .network=Lo-QC22 \
    .no-client-to-client-reflection=yes remote.address=172.19.22.67/32 .as=\
    65022 routing-table=main templates=QC22
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC22 keepalive-time=1s local.address=172.19.22.66 .role=ebgp \
    name=WIFI-SE-SOB-QC22 output.filter-chain=BGP-OUT-QC22 .network=Lo-QC22 \
    .no-client-to-client-reflection=yes remote.address=172.19.22.68/32 .as=\
    65122 routing-table=main templates=QC22
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC22 keepalive-time=1s local.address=172.19.22.50 .role=ebgp \
    name=WIFI-SOB-2011-QC22 output.filter-chain=BGP-OUT-QC22 .network=Lo-QC22 \
    .no-client-to-client-reflection=yes remote.address=172.19.22.51/32 .as=\
    65022 routing-table=main templates=QC22
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC22 keepalive-time=1s local.address=172.19.22.81 .role=ebgp \
    name=LTE-SOB-QC22 output.filter-chain=BGP-OUT-QC22 .network=Lo-QC22 \
    .no-client-to-client-reflection=yes remote.address=172.19.22.82/32 .as=\
    65122 routing-table=main templates=QC22
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC23 keepalive-time=1s local.address=172.19.23.2 .role=ebgp \
    name=FIBRA1-2011-QC23 output.filter-chain=BGP-OUT-QC23 .network=Lo-QC23 \
    .no-client-to-client-reflection=yes remote.address=172.19.23.3/32 .as=\
    65023 routing-table=main templates=QC23
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC23 keepalive-time=1s local.address=172.19.23.18 .role=ebgp \
    name=FIBRA2-2011-QC23 output.filter-chain=BGP-OUT-QC23 .network=Lo-QC23 \
    .no-client-to-client-reflection=yes remote.address=172.19.23.19/32 .as=\
    65023 routing-table=main templates=QC23
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC23 keepalive-time=1s local.address=172.19.23.34 .role=ebgp \
    name=FIBRA3-2011-QC23 output.filter-chain=BGP-OUT-QC23 .network=Lo-QC23 \
    .no-client-to-client-reflection=yes remote.address=172.19.23.35/32 .as=\
    65023 routing-table=main templates=QC23
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC23 keepalive-time=1s local.address=172.19.23.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC23 output.filter-chain=BGP-OUT-QC23 .network=Lo-QC23 \
    .no-client-to-client-reflection=yes remote.address=172.19.23.52/32 .as=\
    65123 routing-table=main templates=QC23
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC23 keepalive-time=1s local.address=172.19.23.2 .role=ebgp \
    name=FIBRA1-SOB-QC23 output.filter-chain=BGP-OUT-QC23 .network=Lo-QC23 \
    .no-client-to-client-reflection=yes remote.address=172.19.23.4/32 .as=\
    65123 routing-table=main templates=QC23
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC23 keepalive-time=1s local.address=172.19.23.18 .role=ebgp \
    name=FIBRA2-SOB-QC23 output.filter-chain=BGP-OUT-QC23 .network=Lo-QC23 \
    .no-client-to-client-reflection=yes remote.address=172.19.23.20/32 .as=\
    65123 routing-table=main templates=QC23
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC23 keepalive-time=1s local.address=172.19.23.34 .role=ebgp \
    name=FIBRA3-SOB-QC23 output.filter-chain=BGP-OUT-QC23 .network=Lo-QC23 \
    .no-client-to-client-reflection=yes remote.address=172.19.23.36/32 .as=\
    65123 routing-table=main templates=QC23
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC23 keepalive-time=1s local.address=172.19.23.66 .role=ebgp \
    name=WIFI-SE-2011-QC23 output.filter-chain=BGP-OUT-QC23 .network=Lo-QC23 \
    .no-client-to-client-reflection=yes remote.address=172.19.23.67/32 .as=\
    65023 routing-table=main templates=QC23
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC23 keepalive-time=1s local.address=172.19.23.66 .role=ebgp \
    name=WIFI-SE-SOB-QC23 output.filter-chain=BGP-OUT-QC23 .network=Lo-QC23 \
    .no-client-to-client-reflection=yes remote.address=172.19.23.68/32 .as=\
    65123 routing-table=main templates=QC23
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC23 keepalive-time=1s local.address=172.19.23.50 .role=ebgp \
    name=WIFI-SOB-2011-QC23 output.filter-chain=BGP-OUT-QC23 .network=Lo-QC23 \
    .no-client-to-client-reflection=yes remote.address=172.19.23.51/32 .as=\
    65023 routing-table=main templates=QC23
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC23 keepalive-time=1s local.address=172.19.23.81 .role=ebgp \
    name=LTE-SOB-QC23 output.filter-chain=BGP-OUT-QC23 .network=Lo-QC23 \
    .no-client-to-client-reflection=yes remote.address=172.19.23.82/32 .as=\
    65123 routing-table=main templates=QC23
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC24 keepalive-time=1s local.address=172.19.24.2 .role=ebgp \
    name=FIBRA1-2011-QC24 output.filter-chain=BGP-OUT-QC24 .network=Lo-QC24 \
    .no-client-to-client-reflection=yes remote.address=172.19.24.3/32 .as=\
    65024 routing-table=main templates=QC24
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC24 keepalive-time=1s local.address=172.19.24.18 .role=ebgp \
    name=FIBRA2-2011-QC24 output.filter-chain=BGP-OUT-QC24 .network=Lo-QC24 \
    .no-client-to-client-reflection=yes remote.address=172.19.24.19/32 .as=\
    65024 routing-table=main templates=QC24
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC24 keepalive-time=1s local.address=172.19.24.34 .role=ebgp \
    name=FIBRA3-2011-QC24 output.filter-chain=BGP-OUT-QC24 .network=Lo-QC24 \
    .no-client-to-client-reflection=yes remote.address=172.19.24.35/32 .as=\
    65024 routing-table=main templates=QC24
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC24 keepalive-time=1s local.address=172.19.24.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC24 output.filter-chain=BGP-OUT-QC24 .network=Lo-QC24 \
    .no-client-to-client-reflection=yes remote.address=172.19.24.52/32 .as=\
    65124 routing-table=main templates=QC24
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC24 keepalive-time=1s local.address=172.19.24.2 .role=ebgp \
    name=FIBRA1-SOB-QC24 output.filter-chain=BGP-OUT-QC24 .network=Lo-QC24 \
    .no-client-to-client-reflection=yes remote.address=172.19.24.4/32 .as=\
    65124 routing-table=main templates=QC24
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC24 keepalive-time=1s local.address=172.19.24.18 .role=ebgp \
    name=FIBRA2-SOB-QC24 output.filter-chain=BGP-OUT-QC24 .network=Lo-QC24 \
    .no-client-to-client-reflection=yes remote.address=172.19.24.20/32 .as=\
    65124 routing-table=main templates=QC24
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC24 keepalive-time=1s local.address=172.19.24.34 .role=ebgp \
    name=FIBRA3-SOB-QC24 output.filter-chain=BGP-OUT-QC24 .network=Lo-QC24 \
    .no-client-to-client-reflection=yes remote.address=172.19.24.36/32 .as=\
    65124 routing-table=main templates=QC24
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC24 keepalive-time=1s local.address=172.19.24.66 .role=ebgp \
    name=WIFI-SE-2011-QC24 output.filter-chain=BGP-OUT-QC24 .network=Lo-QC24 \
    .no-client-to-client-reflection=yes remote.address=172.19.24.67/32 .as=\
    65024 routing-table=main templates=QC24
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC24 keepalive-time=1s local.address=172.19.24.66 .role=ebgp \
    name=WIFI-SE-SOB-QC24 output.filter-chain=BGP-OUT-QC24 .network=Lo-QC24 \
    .no-client-to-client-reflection=yes remote.address=172.19.24.68/32 .as=\
    65124 routing-table=main templates=QC24
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC24 keepalive-time=1s local.address=172.19.24.50 .role=ebgp \
    name=WIFI-SOB-2011-QC24 output.filter-chain=BGP-OUT-QC24 .network=Lo-QC24 \
    .no-client-to-client-reflection=yes remote.address=172.19.24.51/32 .as=\
    65024 routing-table=main templates=QC24
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC24 keepalive-time=1s local.address=172.19.24.81 .role=ebgp \
    name=LTE-SOB-QC24 output.filter-chain=BGP-OUT-QC24 .network=Lo-QC24 \
    .no-client-to-client-reflection=yes remote.address=172.19.24.82/32 .as=\
    65124 routing-table=main templates=QC24
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC25 keepalive-time=1s local.address=172.19.25.2 .role=ebgp \
    name=FIBRA1-2011-QC25 output.filter-chain=BGP-OUT-QC25 .network=Lo-QC25 \
    .no-client-to-client-reflection=yes remote.address=172.19.25.3/32 .as=\
    65025 routing-table=main templates=QC25
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC25 keepalive-time=1s local.address=172.19.25.18 .role=ebgp \
    name=FIBRA2-2011-QC25 output.filter-chain=BGP-OUT-QC25 .network=Lo-QC25 \
    .no-client-to-client-reflection=yes remote.address=172.19.25.19/32 .as=\
    65025 routing-table=main templates=QC25
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC25 keepalive-time=1s local.address=172.19.25.34 .role=ebgp \
    name=FIBRA3-2011-QC25 output.filter-chain=BGP-OUT-QC25 .network=Lo-QC25 \
    .no-client-to-client-reflection=yes remote.address=172.19.25.35/32 .as=\
    65025 routing-table=main templates=QC25
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC25 keepalive-time=1s local.address=172.19.25.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC25 output.filter-chain=BGP-OUT-QC25 .network=Lo-QC25 \
    .no-client-to-client-reflection=yes remote.address=172.19.25.52/32 .as=\
    65125 routing-table=main templates=QC25
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC25 keepalive-time=1s local.address=172.19.25.2 .role=ebgp \
    name=FIBRA1-SOB-QC25 output.filter-chain=BGP-OUT-QC25 .network=Lo-QC25 \
    .no-client-to-client-reflection=yes remote.address=172.19.25.4/32 .as=\
    65125 routing-table=main templates=QC25
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC25 keepalive-time=1s local.address=172.19.25.18 .role=ebgp \
    name=FIBRA2-SOB-QC25 output.filter-chain=BGP-OUT-QC25 .network=Lo-QC25 \
    .no-client-to-client-reflection=yes remote.address=172.19.25.20/32 .as=\
    65125 routing-table=main templates=QC25
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC25 keepalive-time=1s local.address=172.19.25.34 .role=ebgp \
    name=FIBRA3-SOB-QC25 output.filter-chain=BGP-OUT-QC25 .network=Lo-QC25 \
    .no-client-to-client-reflection=yes remote.address=172.19.25.36/32 .as=\
    65125 routing-table=main templates=QC25
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC25 keepalive-time=1s local.address=172.19.25.66 .role=ebgp \
    name=WIFI-SE-2011-QC25 output.filter-chain=BGP-OUT-QC25 .network=Lo-QC25 \
    .no-client-to-client-reflection=yes remote.address=172.19.25.67/32 .as=\
    65025 routing-table=main templates=QC25
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC25 keepalive-time=1s local.address=172.19.25.66 .role=ebgp \
    name=WIFI-SE-SOB-QC25 output.filter-chain=BGP-OUT-QC25 .network=Lo-QC25 \
    .no-client-to-client-reflection=yes remote.address=172.19.25.68/32 .as=\
    65125 routing-table=main templates=QC25
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC25 keepalive-time=1s local.address=172.19.25.50 .role=ebgp \
    name=WIFI-SOB-2011-QC25 output.filter-chain=BGP-OUT-QC25 .network=Lo-QC25 \
    .no-client-to-client-reflection=yes remote.address=172.19.25.51/32 .as=\
    65025 routing-table=main templates=QC25
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC25 keepalive-time=1s local.address=172.19.25.81 .role=ebgp \
    name=LTE-SOB-QC25 output.filter-chain=BGP-OUT-QC25 .network=Lo-QC25 \
    .no-client-to-client-reflection=yes remote.address=172.19.25.82/32 .as=\
    65125 routing-table=main templates=QC25
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC26 keepalive-time=1s local.address=172.19.26.2 .role=ebgp \
    name=FIBRA1-2011-QC26 output.filter-chain=BGP-OUT-QC26 .network=Lo-QC26 \
    .no-client-to-client-reflection=yes remote.address=172.19.26.3/32 .as=\
    65026 routing-table=main templates=QC26
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC26 keepalive-time=1s local.address=172.19.26.18 .role=ebgp \
    name=FIBRA2-2011-QC26 output.filter-chain=BGP-OUT-QC26 .network=Lo-QC26 \
    .no-client-to-client-reflection=yes remote.address=172.19.26.19/32 .as=\
    65026 routing-table=main templates=QC26
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC26 keepalive-time=1s local.address=172.19.26.34 .role=ebgp \
    name=FIBRA3-2011-QC26 output.filter-chain=BGP-OUT-QC26 .network=Lo-QC26 \
    .no-client-to-client-reflection=yes remote.address=172.19.26.35/32 .as=\
    65026 routing-table=main templates=QC26
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC26 keepalive-time=1s local.address=172.19.26.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC26 output.filter-chain=BGP-OUT-QC26 .network=Lo-QC26 \
    .no-client-to-client-reflection=yes remote.address=172.19.26.52/32 .as=\
    65126 routing-table=main templates=QC26
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC26 keepalive-time=1s local.address=172.19.26.2 .role=ebgp \
    name=FIBRA1-SOB-QC26 output.filter-chain=BGP-OUT-QC26 .network=Lo-QC26 \
    .no-client-to-client-reflection=yes remote.address=172.19.26.4/32 .as=\
    65126 routing-table=main templates=QC26
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC26 keepalive-time=1s local.address=172.19.26.18 .role=ebgp \
    name=FIBRA2-SOB-QC26 output.filter-chain=BGP-OUT-QC26 .network=Lo-QC26 \
    .no-client-to-client-reflection=yes remote.address=172.19.26.20/32 .as=\
    65126 routing-table=main templates=QC26
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC26 keepalive-time=1s local.address=172.19.26.34 .role=ebgp \
    name=FIBRA3-SOB-QC26 output.filter-chain=BGP-OUT-QC26 .network=Lo-QC26 \
    .no-client-to-client-reflection=yes remote.address=172.19.26.36/32 .as=\
    65126 routing-table=main templates=QC26
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC26 keepalive-time=1s local.address=172.19.26.66 .role=ebgp \
    name=WIFI-SE-2011-QC26 output.filter-chain=BGP-OUT-QC26 .network=Lo-QC26 \
    .no-client-to-client-reflection=yes remote.address=172.19.26.67/32 .as=\
    65026 routing-table=main templates=QC26
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC26 keepalive-time=1s local.address=172.19.26.66 .role=ebgp \
    name=WIFI-SE-SOB-QC26 output.filter-chain=BGP-OUT-QC26 .network=Lo-QC26 \
    .no-client-to-client-reflection=yes remote.address=172.19.26.68/32 .as=\
    65126 routing-table=main templates=QC26
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC26 keepalive-time=1s local.address=172.19.26.50 .role=ebgp \
    name=WIFI-SOB-2011-QC26 output.filter-chain=BGP-OUT-QC26 .network=Lo-QC26 \
    .no-client-to-client-reflection=yes remote.address=172.19.26.51/32 .as=\
    65026 routing-table=main templates=QC26
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC26 keepalive-time=1s local.address=172.19.26.81 .role=ebgp \
    name=LTE-SOB-QC26 output.filter-chain=BGP-OUT-QC26 .network=Lo-QC26 \
    .no-client-to-client-reflection=yes remote.address=172.19.26.82/32 .as=\
    65126 routing-table=main templates=QC26
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC27 keepalive-time=1s local.address=172.19.27.2 .role=ebgp \
    name=FIBRA1-2011-QC27 output.filter-chain=BGP-OUT-QC27 .network=Lo-QC27 \
    .no-client-to-client-reflection=yes remote.address=172.19.27.3/32 .as=\
    65027 routing-table=main templates=QC27
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC27 keepalive-time=1s local.address=172.19.27.18 .role=ebgp \
    name=FIBRA2-2011-QC27 output.filter-chain=BGP-OUT-QC27 .network=Lo-QC27 \
    .no-client-to-client-reflection=yes remote.address=172.19.27.19/32 .as=\
    65027 routing-table=main templates=QC27
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC27 keepalive-time=1s local.address=172.19.27.34 .role=ebgp \
    name=FIBRA3-2011-QC27 output.filter-chain=BGP-OUT-QC27 .network=Lo-QC27 \
    .no-client-to-client-reflection=yes remote.address=172.19.27.35/32 .as=\
    65027 routing-table=main templates=QC27
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC27 keepalive-time=1s local.address=172.19.27.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC27 output.filter-chain=BGP-OUT-QC27 .network=Lo-QC27 \
    .no-client-to-client-reflection=yes remote.address=172.19.27.52/32 .as=\
    65127 routing-table=main templates=QC27
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC27 keepalive-time=1s local.address=172.19.27.2 .role=ebgp \
    name=FIBRA1-SOB-QC27 output.filter-chain=BGP-OUT-QC27 .network=Lo-QC27 \
    .no-client-to-client-reflection=yes remote.address=172.19.27.4/32 .as=\
    65127 routing-table=main templates=QC27
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC27 keepalive-time=1s local.address=172.19.27.18 .role=ebgp \
    name=FIBRA2-SOB-QC27 output.filter-chain=BGP-OUT-QC27 .network=Lo-QC27 \
    .no-client-to-client-reflection=yes remote.address=172.19.27.20/32 .as=\
    65127 routing-table=main templates=QC27
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC27 keepalive-time=1s local.address=172.19.27.34 .role=ebgp \
    name=FIBRA3-SOB-QC27 output.filter-chain=BGP-OUT-QC27 .network=Lo-QC27 \
    .no-client-to-client-reflection=yes remote.address=172.19.27.36/32 .as=\
    65127 routing-table=main templates=QC27
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC27 keepalive-time=1s local.address=172.19.27.66 .role=ebgp \
    name=WIFI-SE-2011-QC27 output.filter-chain=BGP-OUT-QC27 .network=Lo-QC27 \
    .no-client-to-client-reflection=yes remote.address=172.19.27.67/32 .as=\
    65027 routing-table=main templates=QC27
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC27 keepalive-time=1s local.address=172.19.27.66 .role=ebgp \
    name=WIFI-SE-SOB-QC27 output.filter-chain=BGP-OUT-QC27 .network=Lo-QC27 \
    .no-client-to-client-reflection=yes remote.address=172.19.27.68/32 .as=\
    65127 routing-table=main templates=QC27
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC27 keepalive-time=1s local.address=172.19.27.50 .role=ebgp \
    name=WIFI-SOB-2011-QC27 output.filter-chain=BGP-OUT-QC27 .network=Lo-QC27 \
    .no-client-to-client-reflection=yes remote.address=172.19.27.51/32 .as=\
    65027 routing-table=main templates=QC27
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC27 keepalive-time=1s local.address=172.19.27.81 .role=ebgp \
    name=LTE-SOB-QC27 output.filter-chain=BGP-OUT-QC27 .network=Lo-QC27 \
    .no-client-to-client-reflection=yes remote.address=172.19.27.82/32 .as=\
    65127 routing-table=main templates=QC27
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC28 keepalive-time=1s local.address=172.19.28.2 .role=ebgp \
    name=FIBRA1-2011-QC28 output.filter-chain=BGP-OUT-QC28 .network=Lo-QC28 \
    .no-client-to-client-reflection=yes remote.address=172.19.28.3/32 .as=\
    65028 routing-table=main templates=QC28
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC28 keepalive-time=1s local.address=172.19.28.18 .role=ebgp \
    name=FIBRA2-2011-QC28 output.filter-chain=BGP-OUT-QC28 .network=Lo-QC28 \
    .no-client-to-client-reflection=yes remote.address=172.19.28.19/32 .as=\
    65028 routing-table=main templates=QC28
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC28 keepalive-time=1s local.address=172.19.28.34 .role=ebgp \
    name=FIBRA3-2011-QC28 output.filter-chain=BGP-OUT-QC28 .network=Lo-QC28 \
    .no-client-to-client-reflection=yes remote.address=172.19.28.35/32 .as=\
    65028 routing-table=main templates=QC28
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC28 keepalive-time=1s local.address=172.19.28.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC28 output.filter-chain=BGP-OUT-QC28 .network=Lo-QC28 \
    .no-client-to-client-reflection=yes remote.address=172.19.28.52/32 .as=\
    65128 routing-table=main templates=QC28
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC28 keepalive-time=1s local.address=172.19.28.2 .role=ebgp \
    name=FIBRA1-SOB-QC28 output.filter-chain=BGP-OUT-QC28 .network=Lo-QC28 \
    .no-client-to-client-reflection=yes remote.address=172.19.28.4/32 .as=\
    65128 routing-table=main templates=QC28
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC28 keepalive-time=1s local.address=172.19.28.18 .role=ebgp \
    name=FIBRA2-SOB-QC28 output.filter-chain=BGP-OUT-QC28 .network=Lo-QC28 \
    .no-client-to-client-reflection=yes remote.address=172.19.28.20/32 .as=\
    65128 routing-table=main templates=QC28
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC28 keepalive-time=1s local.address=172.19.28.34 .role=ebgp \
    name=FIBRA3-SOB-QC28 output.filter-chain=BGP-OUT-QC28 .network=Lo-QC28 \
    .no-client-to-client-reflection=yes remote.address=172.19.28.36/32 .as=\
    65128 routing-table=main templates=QC28
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC28 keepalive-time=1s local.address=172.19.28.66 .role=ebgp \
    name=WIFI-SE-2011-QC28 output.filter-chain=BGP-OUT-QC28 .network=Lo-QC28 \
    .no-client-to-client-reflection=yes remote.address=172.19.28.67/32 .as=\
    65028 routing-table=main templates=QC28
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC28 keepalive-time=1s local.address=172.19.28.66 .role=ebgp \
    name=WIFI-SE-SOB-QC28 output.filter-chain=BGP-OUT-QC28 .network=Lo-QC28 \
    .no-client-to-client-reflection=yes remote.address=172.19.28.68/32 .as=\
    65128 routing-table=main templates=QC28
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC28 keepalive-time=1s local.address=172.19.28.50 .role=ebgp \
    name=WIFI-SOB-2011-QC28 output.filter-chain=BGP-OUT-QC28 .network=Lo-QC28 \
    .no-client-to-client-reflection=yes remote.address=172.19.28.51/32 .as=\
    65028 routing-table=main templates=QC28
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC28 keepalive-time=1s local.address=172.19.28.81 .role=ebgp \
    name=LTE-SOB-QC28 output.filter-chain=BGP-OUT-QC28 .network=Lo-QC28 \
    .no-client-to-client-reflection=yes remote.address=172.19.28.82/32 .as=\
    65128 routing-table=main templates=QC28
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC29 keepalive-time=1s local.address=172.19.29.2 .role=ebgp \
    name=FIBRA1-2011-QC29 output.filter-chain=BGP-OUT-QC29 .network=Lo-QC29 \
    .no-client-to-client-reflection=yes remote.address=172.19.29.3/32 .as=\
    65029 routing-table=main templates=QC29
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC29 keepalive-time=1s local.address=172.19.29.18 .role=ebgp \
    name=FIBRA2-2011-QC29 output.filter-chain=BGP-OUT-QC29 .network=Lo-QC29 \
    .no-client-to-client-reflection=yes remote.address=172.19.29.19/32 .as=\
    65029 routing-table=main templates=QC29
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC29 keepalive-time=1s local.address=172.19.29.34 .role=ebgp \
    name=FIBRA3-2011-QC29 output.filter-chain=BGP-OUT-QC29 .network=Lo-QC29 \
    .no-client-to-client-reflection=yes remote.address=172.19.29.35/32 .as=\
    65029 routing-table=main templates=QC29
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC29 keepalive-time=1s local.address=172.19.29.50 .role=ebgp \
    name=WIFI-SOB-SOB-QC29 output.filter-chain=BGP-OUT-QC29 .network=Lo-QC29 \
    .no-client-to-client-reflection=yes remote.address=172.19.29.52/32 .as=\
    65129 routing-table=main templates=QC29
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA1 \
    instance=QC29 keepalive-time=1s local.address=172.19.29.2 .role=ebgp \
    name=FIBRA1-SOB-QC29 output.filter-chain=BGP-OUT-QC29 .network=Lo-QC29 \
    .no-client-to-client-reflection=yes remote.address=172.19.29.4/32 .as=\
    65129 routing-table=main templates=QC29
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA2 \
    instance=QC29 keepalive-time=1s local.address=172.19.29.18 .role=ebgp \
    name=FIBRA2-SOB-QC29 output.filter-chain=BGP-OUT-QC29 .network=Lo-QC29 \
    .no-client-to-client-reflection=yes remote.address=172.19.29.20/32 .as=\
    65129 routing-table=main templates=QC29
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-FIBRA3 \
    instance=QC29 keepalive-time=1s local.address=172.19.29.34 .role=ebgp \
    name=FIBRA3-SOB-QC29 output.filter-chain=BGP-OUT-QC29 .network=Lo-QC29 \
    .no-client-to-client-reflection=yes remote.address=172.19.29.36/32 .as=\
    65129 routing-table=main templates=QC29
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC29 keepalive-time=1s local.address=172.19.29.66 .role=ebgp \
    name=WIFI-SE-2011-QC29 output.filter-chain=BGP-OUT-QC29 .network=Lo-QC29 \
    .no-client-to-client-reflection=yes remote.address=172.19.29.67/32 .as=\
    65029 routing-table=main templates=QC29
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-WIFI-SE \
    instance=QC29 keepalive-time=1s local.address=172.19.29.66 .role=ebgp \
    name=WIFI-SE-SOB-QC29 output.filter-chain=BGP-OUT-QC29 .network=Lo-QC29 \
    .no-client-to-client-reflection=yes remote.address=172.19.29.68/32 .as=\
    65129 routing-table=main templates=QC29
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-SOB \
    instance=QC29 keepalive-time=1s local.address=172.19.29.50 .role=ebgp \
    name=WIFI-SOB-2011-QC29 output.filter-chain=BGP-OUT-QC29 .network=Lo-QC29 \
    .no-client-to-client-reflection=yes remote.address=172.19.29.51/32 .as=\
    65029 routing-table=main templates=QC29
add afi=ip as=65000 disabled=no hold-time=3s input.filter=BGP-IN-LTE \
    instance=QC29 keepalive-time=1s local.address=172.19.29.81 .role=ebgp \
    name=LTE-SOB-QC29 output.filter-chain=BGP-OUT-QC29 .network=Lo-QC29 \
    .no-client-to-client-reflection=yes remote.address=172.19.29.82/32 .as=\
    65129 routing-table=main templates=QC29
/routing filter rule
add chain=BGP-IN-FIBRA1 disabled=no rule="set bgp-local-pref 100;\r\
    \naccept"
add chain=BGP-IN-FIBRA2 disabled=no rule="set bgp-local-pref 90;\r\
    \naccept"
add chain=BGP-IN-FIBRA3 disabled=no rule="set bgp-local-pref 80;\r\
    \naccept"
add chain=BGP-IN-SOB disabled=no rule="set bgp-local-pref 70;\r\
    \naccept"
add chain=BGP-IN-WIFI-SE disabled=no rule="set bgp-local-pref 60;\r\
    \naccept"
add chain=BGP-IN-LTE disabled=no rule="set bgp-local-pref 50;\r\
    \naccept"
add chain=BGP-OUT-QC10 disabled=no rule=\
    "if (dst == 172.19.10.241) { accept }"
add chain=BGP-OUT-QC11 disabled=no rule=\
    "if (dst == 172.19.11.241) { accept }"
add chain=BGP-OUT-QC12 disabled=no rule=\
    "if (dst == 172.19.12.241) { accept }"
add chain=BGP-OUT-QC14 disabled=no rule=\
    "if (dst == 172.19.14.241) { accept }"
add chain=BGP-OUT-QC15 disabled=no rule=\
    "if (dst == 172.19.15.241) { accept }"
add chain=BGP-OUT-QC16 disabled=no rule=\
    "if (dst == 172.19.16.241) { accept }"
add chain=BGP-OUT-QC17 disabled=no rule=\
    "if (dst == 172.19.17.241) { accept }"
add chain=BGP-OUT-QC18 disabled=no rule=\
    "if (dst == 172.19.18.241) { accept }"
add chain=BGP-OUT-QC19 disabled=no rule=\
    "if (dst == 172.19.19.241) { accept }"
add chain=BGP-OUT-QC20 disabled=no rule=\
    "if (dst == 172.19.20.241) { accept }"
add chain=BGP-OUT-QC21 disabled=no rule=\
    "if (dst == 172.19.21.241) { accept }"
add chain=BGP-OUT-QC22 disabled=no rule=\
    "if (dst == 172.19.22.241) { accept }"
add chain=BGP-OUT-QC23 disabled=no rule=\
    "if (dst == 172.19.23.241) { accept }"
add chain=BGP-OUT-QC24 disabled=no rule=\
    "if (dst == 172.19.24.241) { accept }"
add chain=BGP-OUT-QC25 disabled=no rule=\
    "if (dst == 172.19.25.241) { accept }"
add chain=BGP-OUT-QC26 disabled=no rule=\
    "if (dst == 172.19.26.241) { accept }"
add chain=BGP-OUT-QC27 disabled=no rule=\
    "if (dst == 172.19.27.241) { accept }"
add chain=BGP-OUT-QC28 disabled=no rule=\
    "if (dst == 172.19.28.241) { accept }"
add chain=BGP-OUT-QC29 disabled=no rule=\
    "if (dst == 172.19.29.241) { accept }"
/snmp
set enabled=yes engine-id-suffix=QCCLOUDCORE1 src-address=172.17.1.201 \
    trap-community=snmp4otnetwork trap-version=3
/system clock
set time-zone-name=Europe/Madrid
/system identity
set name=CCR_QC_1
/system note
set note="  ___ _________  ___  _____                   _             _     \r\
    \n / _ \\| ___ |  \\/  | |_   _|                 (_)           | |    \r\
    \n/ /_\\ | |_/ | .  . |   | | ___ _ __ _ __ ___  _ _ __   __ _| |___ \r\
    \n|  _  |  __/| |\\/| |   | |/ _ | '__| '_ ` _ \\| | '_ \\ / _` | / __|\r\
    \n| | | | |   | |  | |   | |  __| |  | | | | | | | | | | (_| | \\__ \\\r\
    \n\\_____\\_|   \\_|  |_/   \\__\\___|_|  |_| |_| |_|_|_| |_|\\__,_|_|___/\
    \r\
    \n / _ \\| |               (_)                                       \r\
    \n/ /_\\ | | __ _  ___  ___ _ _ __ __ _ ___                          \r\
    \n|  _  | |/ _` |/ _ \\/ __| | '__/ _` / __|                         \r\
    \n| | | | | (_| |  __| (__| | | | (_| \\__ \\                         \r\
    \n\\_| |_|_|\\__, |\\___|\\___|_|_|  \\__,_|___/                         \
    \r\
    \n          __/ |                                                   \r\
    \n         |___/                                                    \r\
    \nATENCION\r\
    \nEste sistema es de uso exclusivo para personal autorizado.\r\
    \nTodos los accesos y actividades son registrados y monitoreados.\r\
    \nCualquier intento de acceso no autorizado sera reportado y \r\
    \npodria derivar en acciones legales.\r\
    \nSi no tiene autorizacion, desconectese de inmediato.\r\
    \n" show-at-cli-login=yes
/system ntp client
set enabled=yes
/system ntp client servers
add address=172.17.1.250
/system routerboard settings
set auto-upgrade=yes enter-setup-on=delete-key
/tool bandwidth-server
set enabled=no
/tool mac-server
set allowed-interface-list=none
/tool mac-server mac-winbox
set allowed-interface-list=Management
/tool mac-server ping
set enabled=no
/tool romon
set enabled=yes
