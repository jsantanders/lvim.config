if lvim.colorscheme == "github" then
  require("user.themes.github")
end
if lvim.colorscheme == "tokyonight" then
  require("user.themes.tokyonight").config()
end
