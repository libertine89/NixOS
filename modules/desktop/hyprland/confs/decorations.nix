{ ctx }:

{
  decoration = {
    shadow.enabled = false;
    rounding = 10;
    dim_special = 0.3;
    blur = {
      enabled = true;
      special = false;
      size = 6; # 6
      passes = 2; # 3
      new_optimizations = true;
      ignore_opacity = true;
      xray = false;
    };
  };
}
