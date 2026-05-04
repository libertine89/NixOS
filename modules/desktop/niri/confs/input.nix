{ ctx, ... }:

{
  input = {
    keyboard = {
      layout = ctx.kbdLayout;
      variant = ctx.kbdVariant;
    };

    touchpad = {
      tap = true;
      natural-scroll = true;
    };
  };
}
