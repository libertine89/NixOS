{ ctx }:

{
  workspace = [
    # Binds workspaces to my monitors (find desc with: hyprctl monitors)
    "1, persistent:true,default:true"
    "2, persistent:true"
    "3, persistent:true"
    "4, persistent:true"
    "5, persistent:true"
  ];
}
