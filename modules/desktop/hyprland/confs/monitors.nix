{ ctx }:

{
  monitor = [
    # Easily plug in any monitor
    ",preferred,auto,1"

    # My Monitors (Fine to leave these since i used the serial numbers)
    "desc:BNQ BenQ EW277HDR 99J01861SL0,preferred,-1920x0,1"
    "desc:BNQ BenQ EL2870U PCK00489SL0,preferred,0x0,2"
    "desc:BNQ BenQ xl2420t 99D06760SL0,preferred,1920x-420,1,transform,1" # 5 for fipped
  ];
}
