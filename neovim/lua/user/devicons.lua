local status_ok, devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
	return
end

devicons.set_icon {
	tex         = {icon = ""},
	txt         = {icon = ""},
	dirvish     = {icon = "ﱮ"},
	foam        = {icon = "∇"},
	checkhealth = {icon = "ﯭ"},
}
